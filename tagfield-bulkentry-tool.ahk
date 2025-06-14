; ==============================================================================
; Tag Field Name Entry Automation Script
; ==============================================================================
; Description: Automates the process of entering multiple names from clipboard
;              into tag field components (ExtJS/Sencha style multi-select fields)
;              Each name becomes a separate tag/chip in the field
; Author: Nelson Fernandes Serrao
; Version: 1.0
; Requirements: AutoHotkey v2.0+
; Target: Tag field components
; ==============================================================================

; Show warning dialog if script syntax errors occur
#Warn

; Set input mode to simulate physical keystrokes (more compatible with applications)
SendMode "Input"

; Set the working directory to the script's directory
SetWorkingDir A_ScriptDir

; ==============================================================================
; CONFIGURATION
; ==============================================================================

; Delay between name entries in milliseconds
; Tag fields typically need slightly more time to process each entry
; and create the visual tag/chip element
EntryDelay := 50

; F10 Key: Main function to process and enter names from clipboard
F10:: {
    ; ==============================================================================
    ; CLIPBOARD VALIDATION
    ; ==============================================================================
    
    ; Wait up to 2 seconds for clipboard content to be available
    ; ClipWait returns false if clipboard is empty or unavailable
    if !ClipWait(2) {
        MsgBox("Error: Clipboard is empty or not available. Please copy the list of names first.")
        return
    }

    ; ==============================================================================
    ; DATA PROCESSING
    ; ==============================================================================
    
    ; Get clipboard content
    NameList := A_Clipboard 
    
    ; Normalize line endings by removing carriage returns
    ; This handles text copied from different sources (Windows/Unix/Mac)
    NameList := StrReplace(NameList, "`r", "")
    
    ; Split the text into an array of names using newline as delimiter
    Names := StrSplit(NameList, "`n")

    ; ==============================================================================
    ; USER CONFIRMATION
    ; ==============================================================================
    
    ; Display confirmation dialog with count of names found
    ; Gives user time to position cursor in the tag field input box
    MsgBox("Found " . Names.Length . " names to enter. Ensure your cursor is in the tag field input box, then click OK to start. Press Escape at any time to stop.")

    ; ==============================================================================
    ; NAME ENTRY AUTOMATION
    ; ==============================================================================
    
    ; Loop through each name in the array
    for index, name in Names {
        ; Remove leading/trailing whitespace from current name
        name := Trim(name)
        
        ; Skip empty lines or whitespace-only entries
        if (name = "")
            continue

        ; Type the current name into the tag field
        Send(name)
        
        ; Short delay to ensure name is fully entered before pressing Enter
        Sleep(100)
        
        ; Press Enter to create a new tag/chip with the entered name
        ; The tag field will convert the text into a visual tag element
        Send("{Enter}")
        
        ; Wait specified delay before processing next name
        ; This allows the tag field to fully process and render the new tag
        Sleep(EntryDelay)
    }

    ; ==============================================================================
    ; COMPLETION NOTIFICATION
    ; ==============================================================================
    
    ; Notify user that all names have been processed as tags
    MsgBox("Finished entering all names! Check that all tags were created successfully.")
}

; ==============================================================================
; EMERGENCY STOP
; ==============================================================================

; Escape Key: Emergency stop - reloads the script to halt all operations
Esc:: {
    ; Reload the entire script, effectively stopping any running automation
    ; This is safer than ExitApp as it allows the script to be used again
    Reload()
}