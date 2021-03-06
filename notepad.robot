*** Settings ***
Documentation   Opens test.txt with associated application (expects Notepad).
...             Changes font settings and copies text from clipboard to edit window.
...             Saves the text.
Library  RPA.Desktop.Windows
Library  OperatingSystem
Library  String


*** Keywords ***
Windows Text Replacer
    [Arguments]  ${text}
    ${text}=  Replace String  ${text}  ${SPACE}  {VK_SPACE}
    ${text}=  Replace String  ${text}  \n  {ENTER}
    [Return]  ${text}

*** Keywords ***
Change Font Settings
    [Arguments]  ${style}  ${size}  ${name}
    Menu Select  Format->Font
    Refresh Window   # because UI changed
    Mouse Click  name:\'Font style:\' and type:Edit
    Send Keys  ${style}
    Mouse Click  name:Size: and class:Edit
    Send Keys   ${size}
    ${fontname}=  Windows Text Replacer   ${name}
    Send Keys    %f${fontname}
    Mouse Click  name:OK and type:Button
    Wait For Element  class:Edit

*** Keywords ***
Write Notepad Message
    [Arguments]   ${message}
    ${message}=  Windows Text Replacer   ${message}
    Type Into   class:Edit  ${message}

*** Keywords ***
Copy Text From Clipboard
    Send Keys    ^v{ENTER}
    Sleep  1s

*** Keywords ***
Notepad Save And Exit
    Menu Select  File->Save
    Sleep  3s  # For demo purpose
    Menu Select  File->Exit

*** Tasks ***
Case Notepad
    Copy File   ${CURDIR}${/}test.txt  ${OUTPUTDIR}${/}workfile.txt
    Open File   ${OUTPUTDIR}${/}workfile.txt  Notepad   wildcard=True
    Change Font Settings  style=Italic  size=18  name=Times New Roman
    Write Notepad Message    ^a{VK_CLEAR}  # Clear Notepad editor
    Copy Text From Clipboard
    Notepad Save And Exit
    [Teardown]   Close All Applications
