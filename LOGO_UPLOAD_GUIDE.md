# Logo Upload Guide

## Where to Upload Your Logo

**Folder Location:**
```
C:\Users\deepd\Deepverse\conversa\frontend\public\branding\
```

**File Name:**
```
logo.svg
```

**Full Path:**
```
C:\Users\deepd\Deepverse\conversa\frontend\public\branding\logo.svg
```

---

## How to Upload Your Logo

### Option 1: Copy File Manually
1. Prepare your logo as an **SVG file**
2. Rename it to `logo.svg`
3. Copy it to: `C:\Users\deepd\Deepverse\conversa\frontend\public\branding\`

### Option 2: Using PowerShell
```powershell
# If your logo is at Downloads folder
Copy-Item "C:\Users\deepd\Deepverse\Downloads\your-logo.svg" "C:\Users\deepd\Deepverse\conversa\frontend\public\branding\logo.svg"
```

### Option 3: Using Windows Explorer
1. Open File Explorer
2. Navigate to: `C:\Users\deepd\Deepverse\conversa\frontend\public\branding\`
3. Paste your logo file there and rename to `logo.svg`

---

## Logo Requirements

### Format
- **Preferred**: SVG (Scalable Vector Graphics)
- **Size**: Square or near-square aspect ratio
- **Dimensions**: Minimum 200x200 pixels
- **Background**: Transparent background recommended

### Design Tips
- Simple, recognizable design
- High contrast for visibility
- Works in both light and dark modes
- Avoid too much detail (small sizes need clarity)

---

## After Uploading

### Step 1: Refresh the Page
The login page will automatically load your new logo from:
- `/branding/logo.svg`

### Step 2: Clear Browser Cache (if needed)
If the old logo still shows:
- Press `Ctrl + Shift + Delete`
- Clear cached images
- Or open in Incognito mode: `Ctrl + Shift + N`

### Step 3: Verify
Visit: http://localhost:3000/login
Your logo should appear in the top center of the login page.

---

## Troubleshooting

### Logo Not Showing?

**Check 1: File Location**
```powershell
# Verify file exists
Test-Path "C:\Users\deepd\Deepverse\conversa\frontend\public\branding\logo.svg"
# Should return: True
```

**Check 2: File Name**
Make sure it's exactly `logo.svg` (lowercase)

**Check 3: Restart Dev Server**
```bash
cd C:\Users\deepd\Deepverse\conversa\frontend
npm run dev
```

**Check 4: Check Browser Console**
Press `F12` → Console tab
Look for any image loading errors

### Fallback Behavior
If the logo fails to load, the app will automatically show a default green chat icon instead.

---

## Alternative Formats

If you don't have an SVG, you can also use:
- PNG (with transparency)
- JPG

Just update the filename in `LoginView.vue`:
```vue
<!-- Line 33 -->
return basePath ? `${basePath}/branding/logo.png` : '/branding/logo.png'
```

---

## Current Status

✅ **"Powered by Deepverse" removed** from login page
📁 **Logo folder ready**: `frontend/public/branding/`
🎨 **Upload your logo** as `logo.svg`
🔄 **Auto-loads** on login page after upload
