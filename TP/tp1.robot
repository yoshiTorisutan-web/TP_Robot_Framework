*** Settings ***
Documentation    User Management Test
Library          SeleniumLibrary

*** Variables ***
${BASE_URL}         https://opensource-demo.orangehrmlive.com/web/index.php/auth/login
${BROWSER}          Chrome
${USER_ROLE}        ESS
${STATUS}           Enabled
${EMPLOYEE_NAME}    bo
${USERNAME}         Robotframework
${PASSWORD}         securepassword123

${WAIT_TIME}                        10

*** Test Cases ***
My TP QA Robot Test
    [Tags]                                                                  my_tp_qa
    # 1. Aller sur le site https://opensource-demo.orangehrmlive.com/web/index.php/auth/login connecté avec le compte générique (Username: Admin, Password: admin123)
    Given I am on the website "${BASE_URL}"
    When I log in with the generic account
    # 2. Cliquer dans le menu sur la page «Admin»
    And I click on the "Admin" menu
    # 3. Ajouter un utilisateur
    And I add a user with the role "${USER_ROLE}" and status "${STATUS}"
    # 4. Recherche l’utilisateur précédemment créé
    And I search for the previously created user
    # 5. Modifier les informations de l’utilisateur recherché
    And I modify the information of the searched user
    And I search for the previously created user
    # 6. Supprimer l’utilisateur modifié
    And I delete the modified user
    # 7. Se déconnecter
    And I log out
    # 8. Vérifier que nous sommes revenus sur la page de connexion
    #Then I should be redirected to the login page
    Check Connect Page

*** Keywords ***
Wait And Input Text
    [Arguments]                     ${locator}  ${input_text}
    Wait Until Element Is Visible   ${locator}  ${WAIT_TIME}
    Input Text                      ${locator}  ${input_text}

Wait And Input Password
    [Arguments]                     ${locator}  ${input_password}
    Wait Until Element Is Visible   ${locator}  ${WAIT_TIME}
    Input Password                  ${locator}  ${input_password}

Wait And Click Button
    [Arguments]                     ${locator}
    Wait Until Element Is Visible   ${locator}  ${WAIT_TIME}
    Click Button                    ${locator}

Wait And Click Link
    [Arguments]                     ${locator}
    Wait Until Element Is Visible   ${locator}  ${WAIT_TIME}
    Click Link                      ${locator}

Wait And Click Element
    [Arguments]                     ${locator}
    Wait Until Element Is Visible   ${locator}  ${WAIT_TIME}
    Click Element                   ${locator}

Wait For Element
    [Arguments]                     ${locator}
    Wait Until Element Is Visible   ${locator}  ${WAIT_TIME}


I am on the website "${url}"
    Open Browser    ${url}    ${BROWSER}
    Maximize Browser Window
I log in with the generic account
    Wait And Input Text        name=username                   Admin
    Wait And Input Password    name=password                   admin123
    Wait And Click Button      class=orangehrm-login-button

I click on the "Admin" menu
    Wait And Click Link    xpath=//a[@href="/web/index.php/admin/viewAdminModule"]

I add a user with the role "${USER_ROLE}" and status "${STATUS}"

    Wait And Click Button    xpath=//div[@class="orangehrm-header-container"]/button

    Wait And Click Element    xpath=(//div[@class='oxd-select-wrapper'])[1]
    Wait And Click Element    xpath=(//div[@class='oxd-select-wrapper'])[1]//div[@class='oxd-select-option']/span[text()='${USER_ROLE}']

    Wait And Click Element    xpath=(//div[@class='oxd-select-wrapper'])[2]
    Wait And Click Element    xpath=(//div[@class='oxd-select-wrapper'])[2]//div[@class='oxd-select-option']/span[text()='${STATUS}']


    Wait And Input Text    css=.oxd-autocomplete-text-input input    ${EMPLOYEE_NAME}
    Sleep    3
    Wait Until Element Is Visible    xpath=//div[@class="oxd-autocomplete-option"]    ${WAIT_TIME}
    Wait And Click Element    xpath=//div[@class="oxd-autocomplete-option"]

    Wait And Input Text    xpath=//label[contains(text(), 'Username')]/../../div/input    ${USERNAME}
    Wait And Input Text    xpath=//label[contains(text(), 'Password')]/../../div/input    ${PASSWORD}
    Wait And Input Text    xpath=//label[contains(text(), 'Confirm Password')]/../../div/input    ${PASSWORD}
    Wait And Click Button    xpath=(//div[@class="oxd-form-actions"]/button)[2]

I search for the previously created user
    Wait For Element    xpath=//h5[@class="oxd-text oxd-text--h5 oxd-table-filter-title"]
    Wait And Input Text    xpath=//label[contains(text(), 'Username')]/../../div/input    ${USERNAME}

    # Wait And Click Element    xpath=//div[@class="orangehrm-header-container"]                                                            
    # Wait And Click Element    xpath=(//div[@class='oxd-select-wrapper'])[1]//div[@class='oxd-select-option']/span[text()='${USER_ROLE}']

    Wait And Input Text    css=.oxd-autocomplete-text-input input    ${EMPLOYEE_NAME}
    Sleep    3
    Wait Until Element Is Visible    xpath=//div[@class="oxd-autocomplete-dropdown --positon-bottom"]
    Wait And Click Element    xpath=(//div[@class='oxd-autocomplete-option'])

    Wait And Click Button    xpath=//button[@class="oxd-button oxd-button--medium oxd-button--secondary orangehrm-left-space"]

I modify the information of the searched user
    Sleep    1
    Wait And Click Button    xpath=//i[@class="oxd-icon bi-pencil-fill"]/..
    Wait And Click Element    xpath=//span[@class="oxd-checkbox-input oxd-checkbox-input--active --label-right oxd-checkbox-input"]
    Wait And Input Text    xpath=//label[contains(text(), 'Password')]/../../div/input   ${PASSWORD}1234
    Wait And Input Text    xpath=//label[contains(text(), 'Confirm Password')]/../../div/input   ${PASSWORD}1234
    Wait And Click Button    xpath=//button[@class="oxd-button oxd-button--medium oxd-button--secondary orangehrm-left-space"]

I delete the modified user
    Wait Until Element Is Visible    xpath=//div[@class="oxd-table-card"]    10
    Click Element    xpath=//i[@class="oxd-icon bi-trash"]/..

    Wait Until Element Is Visible    xpath=//button[@class="oxd-button oxd-button--medium oxd-button--label-danger orangehrm-button-margin"]    10
    Click Button    xpath=//button[@class="oxd-button oxd-button--medium oxd-button--label-danger orangehrm-button-margin"]

    Sleep    2

I log out
    Wait Until Element Is Visible    xpath=//span[@class="oxd-userdropdown-tab"]    10
    Click Element    xpath=//span[@class="oxd-userdropdown-tab"]

    Wait Until Element Is Visible    xpath=//a[@href="/web/index.php/auth/logout"]    10
    Click Link   xpath=//a[@href="/web/index.php/auth/logout"]

Check Connect Page
    Wait Until Element Is Visible    xpath=//div[@class="orangehrm-login-slot"]    10
