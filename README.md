# Training - RPA Developer
## Module 3 Desktop and Image based automation

This repository contains example implementations of automating Windows Notepad application and Windows GnuCash application.

## Links

- [Training slides](resources/training_module3.pdf)
- [Finding locators](https://robocorp.com/docs/development-guide/desktop/how-to-find-user-interface-elements-using-locators-and-keyboard-shortcuts-in-windows-applications)

## Notepad

Library in use: [RPA.Desktop.Windows](https://robocorp.com/docs/libraries/rpa-framework/rpa-desktop-windows)

Task steps:

1. copies template txt file into work txt file, and opens the file with associated application (expecting it to be Notepad)
2. change font settings
3. clear existing text in the edit window
4. copy text from clipboard into edit window
5. save and exit

## GnuCash

Library in use: [RPA.Desktop](https://robocorp.com/docs/libraries/rpa-framework/rpa-desktop)

Task steps:

1. open application
2. add new account with account name, code and description
3. close application without saving changes
