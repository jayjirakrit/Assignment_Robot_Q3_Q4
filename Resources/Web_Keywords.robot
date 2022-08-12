*** Settings ***
Documentation   Test Demonstration
Library    Selenium2Library
Library    ../Library/DriverManager.py
Variables  ../Pages/Login_Page.py

*** Keywords ***
Open Browser To Login
    [Arguments]    ${url}     ${browser}
    ${driver_path}  DriverManager.get_driver_path_with_browser    ${browser}
    open browser      ${url}     ${browser}     executable_path=${driver_path}
    Maximize Browser Window
    Wait Until Element Is Visible    ${username_text}     30
    Page Should Contain    Login Page
    Log To Console    Open Login Page Success

Enter Username
    [Arguments]    ${username}
    Input Text    ${username_text}    ${username}

Enter Password
    [Arguments]    ${password}
    Input Text    ${password_text}    ${password}

Click Login    
    Element Should Be Enabled    ${login_btn}
    Click Button   ${login_btn}

Click Logout
    Element Should Be Enabled    ${logout_btn}
    Click Element     ${logout_btn}   

Verify Login Success
    Element Should Contain    ${flag_message}    You logged into a secure area!
    Log To Console    Login Successful Passed You logged into a secure area!

Verify Logout Success
    Element Should Contain    ${flag_message}    You logged out of the secure area!
    Log To Console    Logout Successful Passed: You logged out of the secure area!

Close Browsers
    Close All Browsers
 
Verify Login Failed    
    [Arguments]    ${message}
    Element Should Contain    ${flag_message}    ${message}
    Log To Console    Login Failed Passed: ${message}

