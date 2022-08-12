*** Settings ***
Documentation   Test Demonstration
Library    Selenium2Library
Library    DataDriver   ../TestData/Login_TestData.xlsx    sheet_name=Failed
Resource    ../Resources/Web_Keywords.robot 

Suite Setup     Open Browser To Login    ${url}     ${browser}
Suite Teardown    Close Browsers
Test Template     Login Failed

*** Variables ***
${url}      http://the-internet.herokuapp.com/login
${browser}    chrome


*** Test Cases ***
Login with user ${username} and password ${password} with expected message ${expected_result}

*** Keywords ***
Login Failed
    [Arguments]    ${username}    ${password}    ${expected_result}
    Enter Username     ${username}
    Enter Password     ${password} 
    Click Login
    Verify Login Failed    ${expected_result}






