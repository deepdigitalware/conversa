# Quick Reference - Conversa Setup

## Current Status (LIVE NOW)

### Frontend
- **Running**: http://localhost:3000
- **Status**: ✅ Active
- Click the preview button to view

### WhatsApp API
- **Phone Number**: +91 6282 57048 ✅
- **Business Account**: Jai Mataji Jewellers ✅
- **Access Token**: Valid ✅
- **Templates**: Need to be created in Meta Business Manager ⚠️

---

## WhatsApp Credentials Summary

```
App ID:              893861519929186
App Secret:          0c60c8557c5070cdde16dc75d648f04a
Phone Number ID:     952459407958673
Business Account ID: 911696244594404
Access Token:        EAAMs9lpfr2IBQ6FQ3DQoWoEbxzMeo8BypZAbv8XpWZCI8jPh2NfKvscMS4VGKj7NGPZBAHyCynZAGVlme8oKFelWjSZAEf9rhtGADyI8spB7go2xqbbb9UPDyHgfNKEcVTWSpEpvkZB4cpebNChMrntYOs1nTfR5F7FN8LnKmZBYZAzXKnrdTkJ2wxAo5wROSXBHGQZDZD
API Version:         v23.0
```

---

## To Enable Full Functionality

### Option 1: Docker Desktop (Easiest)

```powershell
# Install Docker Desktop
winget install Docker.DockerDesktop

# Restart computer, then start services
cd C:\Users\deepd\Deepverse\conversa\docker
docker-compose up -d
```

### Option 2: Install Go

```powershell
# Download and install Go from https://go.dev/dl/

# Then run:
cd C:\Users\deepd\Deepverse\conversa
go mod download
make run-migrate
```

---

## Fix Template Issues

### Why Templates Are Failing

The 400 error when retrieving templates is likely because:
1. **No templates exist** - You need to create them first
2. **Templates not approved** - Waiting for Meta review

### How to Create Templates

1. **Go to Meta Business Manager**
   - URL: https://business.facebook.com/whatsapp-manager
   
2. **Navigate to Templates**
   - Click "Tools" → "Templates"
   
3. **Create Your First Template**
   - Click "Create Template"
   - Choose category: UTILITY (for order updates) or AUTH (for OTP)
   - Name: `order_confirmation`
   - Language: English
   - Add content: "Your order {{1}} has been confirmed. Track at {{2}}"
   - Submit for approval
   
4. **Wait for Approval**
   - Usually takes 24-48 hours
   - Check status in Templates section
   
5. **Test in Conversa**
   - Once approved, refresh template list
   - Select template and send test message

---

## Common Template Errors & Solutions

### Error: "Template not approved"
**Solution**: Wait for Meta approval or check approval status

### Error: "Parameters mismatch"
**Solution**: Ensure template variables match exactly (case-sensitive)

Example:
```
Template: "Hello {{name}}, your order {{order_id}} is ready"
Send with: {"name": "John", "order_id": "12345"}
```

### Error: "Phone number not in allowed list"
**Solution**: Add test numbers in Meta Business Manager → Phone Numbers → Allowed Recipients

---

## Testing Commands

### Test WhatsApp Connection
```powershell
cd C:\Users\deepd\Deepverse\conversa
.\test-whatsapp-api.ps1
```

### Check Frontend
Open browser: http://localhost:3000

### View Logs (after backend starts)
```powershell
# If using Docker
docker logs whatomate_app -f

# If using Go binary
# Check terminal output where you ran make run-migrate
```

---

## Feature Checklist

Once backend is running, you can test:

### Messaging
- [ ] Send text messages
- [ ] Send template messages
- [ ] Send media (images, documents)
- [ ] Receive messages (webhooks)

### Templates
- [ ] List templates
- [ ] Create new template
- [ ] Upload template for approval
- [ ] Delete template

### Campaigns
- [ ] Create broadcast campaign
- [ ] Schedule campaign
- [ ] View campaign analytics
- [ ] Retry failed messages

### Chatbot
- [ ] Create conversation flow
- [ ] Set up keyword triggers
- [ ] Configure auto-replies
- [ ] Test chatbot responses

### Contacts
- [ ] Import contacts
- [ ] Export contacts
- [ ] Segment contacts
- [ ] Manage contact labels

### Analytics
- [ ] View message statistics
- [ ] Track delivery rates
- [ ] Monitor response times
- [ ] Agent performance metrics

---

## Support Resources

### Documentation
- SETUP.md - Complete setup guide
- STATUS.md - Detailed status report
- README.md - Project documentation

### External Links
- Meta Business Manager: https://business.facebook.com
- WhatsApp Business API Docs: https://developers.facebook.com/docs/whatsapp
- Whatomate GitHub: https://github.com/shridarpatil/whatomate

### Troubleshooting
1. Check STATUS.md for detailed troubleshooting
2. Run test-whatsapp-api.ps1 to verify credentials
3. Check Meta Business Manager for template status
4. Review application logs for errors

---

## Quick Login Info

**After starting backend:**
- URL: http://localhost:8080 (backend API)
- Frontend: http://localhost:3000
- Username: admin@admin.com
- Password: admin

**First Time Setup:**
1. Login with default credentials
2. Go to Settings → Accounts
3. Add WhatsApp account using credentials above
4. Test connection
5. Start messaging!
