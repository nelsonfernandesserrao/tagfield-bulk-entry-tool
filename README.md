# Tagfield Bulk Entry Tool

An AutoHotkey script that automates the process of entering multiple values from your clipboard into tagfield components (i.e. multi-select input fields that create visual tags/chips for each entry). Designed and built for use in entering names/enrolling students within the Arbor MIS. 

## 🎯 Designed For

This script is specifically designed for **tagfield components** commonly found in:
- ExtJS/Sencha applications
- Multi-select input fields that create visual tags/chips
- Student management systems, CRM platforms, and web applications with tag-based selection - notably, the Arbor MIS platform.

## 📋 Requirements

- **AutoHotkey v2.0 or later** - [Download here](https://www.autohotkey.com/)
- Windows operating system
- Administrator privileges may be required for some applications, and in some environmnts.

## 🔧 Installation

1. **Download and install AutoHotkey v2.0+**
   ```
   https://www.autohotkey.com/download/
   ```

2. **Download the script**
   - Save the `.ahk` file to your desired location
   - Or clone this repository:
   ```bash
   git clone https://github.com/nelsonfernandesserrao/tagfield-bulk-entry-tool.git
   ```

3. **Run the script**
   - Double-click the `.ahk` file
   - Or right-click and select "Compile Script" to create an executable

## 📖 Usage

### Basic Usage

1. **Prepare your name list**
   - Create a list of names, one per line
       - In the Arbor MIS platform ecosystem, it is strongly recommended that you set up the names as a list of FirstName LastName (Registration group) e.g. John Adams (12K)
   - Copy the entire list to your clipboard (Ctrl+C)

2. **Position your cursor**
   - Click inside the tag field input box (the text input area within the tag field)
   - Look for fields that show selected items as visual tags/chips
   - Ensure the input field is active and ready for typing

3. **Start the automation**
   - Press **F10** to begin
   - A confirmation dialog will show the number of names found
   - Click OK to start creating tags for each name

4. **Watch the magic happen**
   - Each name will be typed and converted to a visual tag/chip
   - The script will automatically move to the next name
   - Tags will appear in the field as they're created

4. **Emergency stop**
   - Press **Escape** at any time to stop the script

### Name List Format

Ensure that you tailor the list format to your tagfield requirements. As above, for the Arbor MIS, this will be ```FirstName Surname (Registration group)```

## ⚙️ Configuration

You can modify the script behavior by editing these variables:

```autohotkey
; Delay between name entries in milliseconds
EntryDelay := 50
```

### Recommended Settings by Application Type

| Application Type | Recommended EntryDelay |
|------------------|------------------------|
| ExtJS/Sencha tag fields | 50-100ms        |
| Web-based tag components | 100-150ms      |
| Legacy tag systems | 200-300ms             |
| Slow network connections | 300-500ms      |

## 🎯 Common Use Cases

- **Student Management**: Quickly add multiple students to a class or group
- **Contact Management**: Bulk tagging of contacts in CRM systems
- **User Assignment**: Adding multiple users to projects or teams
- **Email Recipients**: Building email distribution lists with tag-based selection
- **Testing**: Populating tag fields with test data for QA purposes
- **Bulk Operations**: Any scenario requiring multiple tag entries

## 🔑 Hotkeys

| Key | Action |
|-----|--------|
| `F10` | Start tag creation automation |
| `Escape` | Stop script (emergency stop) |

## ⚠️ Important Notes

### Before Using
- Always test with a small list first (2-3 names)
- Ensure the tag field is active and ready for input
- Click inside the input area of the tag field, not on existing tags
- Have your name list ready in clipboard
- Verify each name will create a valid tag (no special characters that might break the field)

### Compatibility
- Optimized for ExtJS/Sencha tag field components
- Works with most web-based tag/chip input fields
- May require adjustment of `EntryDelay` for slower tag field implementations
- Some applications with special security measures may block automated input

### Safety Features
- Clipboard validation prevents errors if no data is copied
- Empty line handling skips blank entries
- Emergency stop available at any time
- Confirmation dialog prevents accidental execution

## 🐛 Troubleshooting

### Script Not Working?

1. **Check AutoHotkey Version**
   - Ensure you're using AutoHotkey v2.0+
   - This script is NOT compatible with v1.x

2. **Administrator Privileges**
   - Try running AutoHotkey as administrator
   - Some applications require elevated privileges

3. **Timing Issues**
   - Increase `EntryDelay` if tags are being created too quickly
   - Some tag fields need more time to process and render each tag
   - Watch for tags that don't appear - this usually indicates timing issues

4. **Tag Field Issues**
   - Ensure you're clicking in the input area, not on existing tags
   - Some tag fields require you to clear existing tags first
   - Try typing one name manually first to ensure the field works normally

### Common Issues

| Issue | Solution |
|-------|----------|
| Tags created too fast | Increase `EntryDelay` value |
| Some tags not appearing | Increase both delays (100ms + EntryDelay) |
| Script stops working | Ensure cursor is in input field, press F10 again |
| Names with spaces split | Check if tag field supports spaces in tags |
| Not working in specific field | Try manual entry first to test field behavior |

## 🛡️ Security Considerations

- This script only reads from clipboard and sends keystrokes
- No network connections or file modifications
- Source code is fully visible and auditable
- Consider the security implications of automated input in sensitive applications
