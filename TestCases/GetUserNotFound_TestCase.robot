*** Settings ***
Documentation       Test Demonstration

Library             RequestsLibrary
Library             JSONLibrary
Library             Collections

Suite Setup         Create Session    mysession    ${base_url}
Suite Teardown      Delete All Sessions


*** Variables ***
${base_url}     https://reqres.in/api
${user_id}      1234


*** Test Cases ***
Get User Profile Not Found Test
    # Send Get Request API
    ${response}=    Get On Session    mysession    /users/${user_id}     expected_status=404
    ${json_object}=    To Json    ${response.content}
    Log To Console    ${response.content}
    # Validate Status Code
    Should Be Equal As Integers   ${response.status_code}    404

    #Validate Response Body Empty
    Should Be Empty   ${json_object}
