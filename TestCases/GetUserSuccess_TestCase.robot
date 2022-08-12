*** Settings ***
Documentation       Test Demonstration

Library             RequestsLibrary
Library             JSONLibrary
Library             Collections

Suite Setup         Create Session    mysession    ${base_url}
Suite Teardown      Delete All Sessions


*** Variables ***
${base_url}     https://reqres.in/api
${user_id}      12


*** Test Cases ***
Get User Profile Success Test
    # Send Get Request API
    ${response}=    Get On Session    mysession    /users/${user_id}
    ${json_object}=    To Json    ${response.content}
    Log To Console    ${response.content}
    # Validate Status Code
    Should Be Equal As Numbers    ${response.status_code}    200

    # Extract Response Body
    ${id}=    Get Value From Json    ${json_object}    $.data.id
    ${email}=    Get Value From Json    ${json_object}    $.data.email
    ${first_name}=    Get Value From Json    ${json_object}    $.data.first_name
    ${last_name}=    Get Value From Json    ${json_object}    $.data.last_name
    ${avatar}=    Get Value From Json    ${json_object}    $.data.avatar

    #Validate Response Body
    Should Be Equal As Integers    ${id[0]}    12
    Should Be Equal    ${email[0]}    rachel.howell@reqres.in
    Should Be Equal    ${first_name[0]}    Rachel
    Should Be Equal    ${last_name[0]}    Howell
    Should Be Equal    ${avatar[0]}    https://reqres.in/img/faces/12-image.jpg
