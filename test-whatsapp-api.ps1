# WhatsApp API Test Script
# This script tests your WhatsApp Business API credentials

$phone_number_id = "952459407958673"
$business_account_id = "911696244594404"
$app_id = "893861519929186"
$app_secret = "0c60c8557c5070cdde16dc75d648f04a"
$access_token = "EAAMs9lpfr2IBQ6FQ3DQoWoEbxzMeo8BypZAbv8XpWZCI8jPh2NfKvscMS4VGKj7NGPZBAHyCynZAGVlme8oKFelWjSZAEf9rhtGADyI8spB7go2xqbbb9UPDyHgfNKEcVTWSpEpvkZB4cpebNChMrntYOs1nTfR5F7FN8LnKmZBYZAzXKnrdTkJ2wxAo5wROSXBHGQZDZD"
$api_version = "v23.0"

Write-Host "========================================" -ForegroundColor Cyan
Write-Host "WhatsApp Business API Connection Test" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""

# Test 1: Verify Phone Number
Write-Host "Test 1: Verifying Phone Number..." -ForegroundColor Yellow
try {
    $url = "https://graph.facebook.com/$api_version/$phone_number_id"
    $headers = @{
        "Authorization" = "Bearer $access_token"
    }
    
    $response = Invoke-RestMethod -Uri $url -Headers $headers -Method Get
    
    Write-Host "SUCCESS: Phone number verified!" -ForegroundColor Green
    Write-Host "  Display Phone: $($response.display_phone_number)" -ForegroundColor Gray
    Write-Host "  Quality Rating: $($response.quality_rating)" -ForegroundColor Gray
} catch {
    Write-Host "FAILED: Could not verify phone number" -ForegroundColor Red
    Write-Host "  Error: $($_.Exception.Message)" -ForegroundColor Red
}

Write-Host ""

# Test 2: Verify Business Account
Write-Host "Test 2: Verifying Business Account..." -ForegroundColor Yellow
try {
    $url = "https://graph.facebook.com/$api_version/$business_account_id"
    $headers = @{
        "Authorization" = "Bearer $access_token"
    }
    
    $response = Invoke-RestMethod -Uri $url -Headers $headers -Method Get
    
    Write-Host "SUCCESS: Business account verified!" -ForegroundColor Green
    Write-Host "  Name: $($response.name)" -ForegroundColor Gray
} catch {
    Write-Host "FAILED: Could not verify business account" -ForegroundColor Red
    Write-Host "  Error: $($_.Exception.Message)" -ForegroundColor Red
}

Write-Host ""

# Test 3: List Templates
Write-Host "Test 3: Listing WhatsApp Templates..." -ForegroundColor Yellow
try {
    $url = "https://graph.facebook.com/$api_version/$phone_number_id/message_templates"
    $headers = @{
        "Authorization" = "Bearer $access_token"
    }
    
    $response = Invoke-RestMethod -Uri $url -Headers $headers -Method Get
    
    Write-Host "SUCCESS: Retrieved templates!" -ForegroundColor Green
    if ($response.data -and $response.data.Count -gt 0) {
        Write-Host "  Found $($response.data.Count) template(s):" -ForegroundColor Gray
        foreach ($template in $response.data) {
            $status = $template.status
            Write-Host "    - $($template.name) (Status: $status)" -ForegroundColor Gray
        }
    } else {
        Write-Host "  No templates found. You need to create templates in Meta Business Manager first." -ForegroundColor Yellow
    }
} catch {
    Write-Host "FAILED: Could not retrieve templates" -ForegroundColor Red
    Write-Host "  Error: $($_.Exception.Message)" -ForegroundColor Red
    Write-Host ""
    Write-Host "  Common reasons for template errors:" -ForegroundColor Yellow
    Write-Host "  1. Templates not approved in Meta Business Manager" -ForegroundColor Yellow
    Write-Host "  2. Invalid access token" -ForegroundColor Yellow
    Write-Host "  3. Phone number not verified" -ForegroundColor Yellow
}

Write-Host ""
Write-Host "========================================" -ForegroundColor Cyan
Write-Host "Test Complete" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
