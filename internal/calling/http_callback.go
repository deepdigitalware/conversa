package calling

import (
	"fmt"
	"io"
	"net"
	"net/http"
	"net/url"
	"strings"
	"time"
)

// HTTPCallbackResult holds the response from an HTTP callback.
type HTTPCallbackResult struct {
	StatusCode int
	Body       string
}

// executeHTTPCallback performs an HTTP request with configurable method, headers, and body.
// The URL is validated to prevent SSRF — only HTTPS to public IPs is allowed.
func executeHTTPCallback(callbackURL, method string, headers map[string]string, body string, timeout time.Duration) (*HTTPCallbackResult, error) {
	if err := validateCallbackURL(callbackURL); err != nil {
		return nil, err
	}

	var bodyReader io.Reader
	if body != "" {
		bodyReader = strings.NewReader(body)
	}

	req, err := http.NewRequest(method, callbackURL, bodyReader)
	if err != nil {
		return nil, fmt.Errorf("create request: %w", err)
	}

	for k, v := range headers {
		req.Header.Set(k, v)
	}
	if body != "" && req.Header.Get("Content-Type") == "" {
		req.Header.Set("Content-Type", "application/json")
	}

	// Use a custom transport that blocks redirects to internal IPs.
	client := &http.Client{
		Timeout: timeout,
		CheckRedirect: func(req *http.Request, via []*http.Request) error {
			if err := validateCallbackURL(req.URL.String()); err != nil {
				return err
			}
			if len(via) >= 5 {
				return fmt.Errorf("too many redirects")
			}
			return nil
		},
	}
	resp, err := client.Do(req)
	if err != nil {
		return nil, fmt.Errorf("http request: %w", err)
	}
	defer resp.Body.Close() //nolint:errcheck

	respBody, err := io.ReadAll(io.LimitReader(resp.Body, 64*1024)) // limit to 64KB
	if err != nil {
		return nil, fmt.Errorf("read response: %w", err)
	}

	return &HTTPCallbackResult{
		StatusCode: resp.StatusCode,
		Body:       string(respBody),
	}, nil
}

// validateCallbackURL checks that the URL is HTTPS and does not point to
// internal/private network addresses (SSRF prevention).
func validateCallbackURL(rawURL string) error {
	u, err := url.Parse(rawURL)
	if err != nil {
		return fmt.Errorf("invalid callback URL: %w", err)
	}

	if u.Scheme != "https" {
		return fmt.Errorf("callback URL must use HTTPS, got %q", u.Scheme)
	}

	host := u.Hostname()
	ips, err := net.LookupHost(host)
	if err != nil {
		return fmt.Errorf("cannot resolve callback host %q: %w", host, err)
	}

	for _, ipStr := range ips {
		ip := net.ParseIP(ipStr)
		if ip == nil {
			continue
		}
		if ip.IsLoopback() || ip.IsPrivate() || ip.IsLinkLocalUnicast() || ip.IsLinkLocalMulticast() || ip.IsUnspecified() {
			return fmt.Errorf("callback URL must not point to internal address %s", ipStr)
		}
	}

	return nil
}

// interpolateTemplate replaces {{key}} placeholders with values from the variables map.
func interpolateTemplate(tpl string, vars map[string]string) string {
	for k, v := range vars {
		tpl = strings.ReplaceAll(tpl, "{{"+k+"}}", v)
	}
	return tpl
}
