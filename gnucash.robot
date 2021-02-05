*** Settings ***
Documentation   Template robot main suite.
Library   RPA.Desktop


*** Keywords ***
Close GnuCash
    Press Keys   ctrl  Q
    Wait For Element  ocr:"Close Without Saving"
    Click  ocr:"Close Without Saving"

*** Keywords ***
Open GnuCash
    Press Keys   cmd  D
    Press Keys   cmd  S
    Type Text    gnucash
    Press Keys   enter

*** Keywords ***
Add new account
    [Arguments]   ${account_name}  ${account_code}   ${description}
    Wait For Element  image:.images${/}gnucash-newaccount-path.png
    Wait For Element  alias:GnuCash.NewAccount
    Click    alias:GnuCash.NewAccount
    Wait For Element  ocr:"New Account"
    Move mouse    offset:0,200
    Type Text Into  ocr:"Account name" then offset:200,0   ${account_name}
    Type Text Into  ocr:"Account code" then offset:200,0   ${account_code}
    Type Text Into  ocr:Description then offset:200,0    ${description}
    Press Keys   alt  O
    Wait For Element   ocr:"Grand Total"

*** Tasks ***
Case GnuCash 
    Open GnuCash
    Add New Account   OCR testing   1337  Found by OCR and region locators
    Close GnuCash
