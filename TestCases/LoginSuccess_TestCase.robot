*** Settings ***
Documentation   Test Demonstration
Library    Selenium2Library
Library    DataDriver   ../TestData/Login_TestData.xlsx    sheet_name=Success
Resource    ../Resources/Web_Keywords.robot 

Suite Setup     Open Browser To Login    ${url}     ${browser}
Suite Teardown    Close Browsers
Test Template     Login Successful

*** Variables ***
${url}      http://the-internet.herokuapp.com/login
${browser}    chrome


*** Test Cases ***
Login with user ${username} and password ${password}

*** Keywords ***
Login Successful
    [Arguments]    ${username}    ${password}
    Enter Username     ${username}
    Enter Password     ${password} 
    Click Login
    Verify Login Success
    Click Logout
    Verify Logout Success






