

*** Settings ***
Library                             SeleniumLibrary
Library    FakerLibrary
Suite Setup  Set All Values

*** Variables ***
${PASSWORD}    ATVaPbHIGJaJGULN1234

*** Test Cases ***
User Management(Selenium) Robot Test
    [Tags]    tp2
    Open Browser To OrangeHRM
    Click PIM
    Click Add
    Search User
    Modify User
    Search User
    Delete User
    Disconnect
    Check Connect Page

*** Keywords ***
Set All Values
    ${FakeName} =    FakerLibrary.Name
    ${FakeLastName} =    FakerLibrary.Lastname

    Set Suite Variable  ${FIRSTNAME}    ${FakeName}
    Set Suite Variable  ${LASTNAME}    ${FakeLastName} 
    Set Suite Variable  ${USERNAME}    ${FakeName}

Open Browser To OrangeHRM
    Open Browser    https://opensource-demo.orangehrmlive.com/web/index.php/auth/login    chrome
    Maximize Browser Window
    Wait Until Element Is Visible    name:username    10
    Wait Until Element Is Visible    name:password    10
    Wait Until Element Is Visible    class:orangehrm-login-button    10
    Input Text    name:username    Admin
    Input Password    name:password    admin123
    Click Button    class:orangehrm-login-button

Click PIM
    Wait Until Element Is Visible    xpath=//a[@href="/web/index.php/pim/viewPimModule"]    10
    Click Link   xpath=//a[@href="/web/index.php/pim/viewPimModule"]

Click Add
    Wait Until Element Is Visible    xpath=//div[@class="orangehrm-header-container"]/button    10
    Click Button    xpath=//div[@class="orangehrm-header-container"]/button

    Wait Until Element Is Visible    name:firstName    10
    Input Text    name:firstName    ${FIRSTNAME}
    Input Text    name:lastName    ${LASTNAME}
    Click Element    xpath=//div[@class="oxd-switch-wrapper"]/label/span

    Wait Until Element Is Visible     xpath=//label[contains(text(), 'Username')]/../../div/input    10
    Input Text    xpath=//label[contains(text(), 'Username')]/../../div/input    ${USERNAME}
    Input Text    xpath=//label[contains(text(), 'Password')]/../../div/input    ${PASSWORD}
    Input Text    xpath=//label[contains(text(), 'Confirm Password')]/../../div/input    ${PASSWORD}

    Wait Until Element Is Visible    xpath=//button[@class="oxd-button oxd-button--medium oxd-button--secondary orangehrm-left-space"]    10
    Click Button    xpath=//button[@class="oxd-button oxd-button--medium oxd-button--secondary orangehrm-left-space"]

    Wait Until Element Is Visible    xpath=//div[@class="orangehrm-edit-employee-content"]    10
    Wait Until Element Is Visible    xpath=//a[contains(text(), 'Employee List')]     10
    
    Click Link   xpath=//a[contains(text(), 'Employee List')] 
    
Search User
    Wait Until Element Is Visible    xpath=//label[contains(text(), 'Employee Name')]/../../div/div/div/input    10
    Input Text    xpath=//label[contains(text(), 'Employee Name')]/../../div/div/div/input    ${FIRSTNAME} ${LASTNAME}

    Sleep    1
    Click Button    xpath=//button[@class="oxd-button oxd-button--medium oxd-button--secondary orangehrm-left-space"]
    
    
Modify User
    Wait Until Element Is Visible    xpath=//div[@class="oxd-table-card"]    10
    Click Element    xpath=//i[@class="oxd-icon bi-pencil-fill"]/..

    Wait Until Element Is Visible    xpath=//div[@class="orangehrm-edit-employee-content"]    10
    Wait Until Element Is Visible    xpath=//label[contains(text(), 'Other Id')]/../../div/input    10

    ${RANDOM_NUMBER} =    FakerLibrary.Random Number    4

    Sleep    1
    Click Element    xpath=//label[contains(text(), 'Other Id')]/../../div/input
    Input Text    xpath=//label[contains(text(), 'Other Id')]/../../div/input   ${RANDOM_NUMBER}

    Press Keys    xpath=//label[contains(text(), 'Other Id')]/../../div/input    RETURN

    Sleep    1

    Wait Until Element Is Visible    xpath=//label[contains(text(), 'Other Id')]    10
    Click Link   xpath=//a[contains(text(), 'Employee List')] 
    

Delete User
    Wait Until Element Is Visible    xpath=//div[@class="oxd-table-card"]    10
    Click Element    xpath=//i[@class="oxd-icon bi-trash"]/..

    Wait Until Element Is Visible    xpath=//button[@class="oxd-button oxd-button--medium oxd-button--label-danger orangehrm-button-margin"]    10
    Click Button    xpath=//button[@class="oxd-button oxd-button--medium oxd-button--label-danger orangehrm-button-margin"]

    Sleep    2
Disconnect
    Wait Until Element Is Visible    xpath=//span[@class="oxd-userdropdown-tab"]    10
    Click Element    xpath=//span[@class="oxd-userdropdown-tab"]

    Wait Until Element Is Visible    xpath=//a[@href="/web/index.php/auth/logout"]    10
    Click Link   xpath=//a[@href="/web/index.php/auth/logout"]

Check Connect Page
    Wait Until Element Is Visible    xpath=//div[@class="orangehrm-login-slot"]    10
    