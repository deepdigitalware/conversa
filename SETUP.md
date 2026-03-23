# Conversa (Whatomate) Setup Guide

## WhatsApp Business API Credentials (Provided)
- **App ID**: 893861519929186
- **App Secret**: 0c60c8557c5070cdde16dc75d648f04a
- **Phone Number ID**: 952459407958673
- **WhatsApp Business Account ID**: 911696244594404
- **Access Token**: EAAMs9lpfr2IBQ6FQ3DQoWoEbxzMeo8BypZAbv8XpWZCI8jPh2NfKvscMS4VGKj7NGPZBAHyCynZAGVlme8oKFelWjSZAEf9rhtGADyI8spB7go2xqbbb9UPDyHgfNKEcVTWSpEpvkZB4cpebNChMrntYOs1nTfR5F7FN8LnKmZBYZAzXKnrdTkJ2wxAo5wROSXBHGQZDZD

## Quick Start with Docker (Recommended)

### Step 1: Start Docker Services
```bash
cd C:\Users\deepd\Deepverse\conversa\docker
docker-compose up -d
```

This will start:
- PostgreSQL database on port 5432
- Redis on port 6379
- Whatomate app on port 8080

### Step 2: Access the Application
- Open browser and go to: http://localhost:8080
- Login with: `admin@admin.com` / `admin`

### Step 3: Configure WhatsApp Account
1. Go to Settings → Accounts
2. Click "Add Account"
3. Enter the following details:
   - **Account Name**: Lavya Jewels
   - **Phone Number ID**: 952459407958673
   - **Business Account ID**: 911696244594404
   - **App ID**: 893861519929186
   - **Access Token**: EAAMs9lpfr2IBQ6FQ3DQoWoEbxzMeo8BypZAbv8XpWZCI8jPh2NfKvscMS4VGKj7NGPZBAHyCynZAGVlme8oKFelWjSZAEf9rhtGADyI8spB7go2xqbbb9UPDyHgfNKEcVTWSpEpvkZB4cpebNChMrntYOs1nTfR5F7FN8LnKmZBYZAzXKnrdTkJ2wxAo5wROSXBHGQZDZD
   - **API Version**: v23.0 (or latest)

## Alternative: Local Development Setup

### Prerequisites
- Go 1.21+
- Node.js 18+
- PostgreSQL 17
- Redis 7

### Step 1: Install Dependencies
```bash
# Backend
cd C:\Users\deepd\Deepverse\conversa
go mod download

# Frontend
cd frontend
npm install
```

### Step 2: Start Database and Redis
You need to have PostgreSQL and Redis running locally.

### Step 3: Run Backend
```bash
cd C:\Users\deepd\Deepverse\conversa
make run-migrate
```

### Step 4: Run Frontend
```bash
cd C:\Users\deepd\Deepverse\conversa\frontend
npm run dev
```

## Testing WhatsApp Template Messages

### Common Template Errors and Solutions:

1. **"Template not approved"**
   - Go to Meta Business Manager → WhatsApp → Templates
   - Ensure template is approved
   - Wait 5-10 minutes after approval

2. **"Phone number not verified"**
   - Verify phone number in Meta Business Manager
   - Complete WhatsApp Business API verification flow

3. **"Invalid access token"**
   - Token may have expired
   - Generate new token from Meta Business Manager
   - Update in Conversa Settings → Accounts

4. **"Template parameters mismatch"**
   - Check template variables match exactly
   - Case-sensitive matching
   - Ensure all required parameters are provided

### Test Sending Template Message:
1. Go to Campaigns → New Campaign
2. Select approved template
3. Add test contact (your WhatsApp number)
4. Send test message
5. Check logs for any errors

## Troubleshooting

### Check Logs
```bash
# Docker logs
docker logs whatomate_app -f

# Check specific error patterns
docker logs whatomate_app | grep -i error
docker logs whatomate_app | grep -i template
docker logs whatomate_app | grep -i whatsapp
```

### Test WhatsApp Connection
```bash
# Test API connection
curl -X GET "https://graph.facebook.com/v23.0/952459407958673" \
  -H "Authorization: Bearer EAAMs9lpfr2IBQ6FQ3DQoWoEbxzMeo8BypZAbv8XpWZCI8jPh2NfKvscMS4VGKj7NGPZBAHyCynZAGVlme8oKFelWjSZAEf9rhtGADyI8spB7go2xqbbb9UPDyHgfNKEcVTWSpEpvkZB4cpebNChMrntYOs1nTfR5F7FN8LnKmZBYZAzXKnrdTkJ2wxAo5wROSXBHGQZDZD"
```

### Database Issues
```bash
# Check DB connection
docker exec whatomate_db pg_isready -U whatomate

# View DB logs
docker logs whatomate_db
```

### Redis Issues
```bash
# Check Redis connection
docker exec whatomate_redis redis-cli ping

# Should return: PONG
```
