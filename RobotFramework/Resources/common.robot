*** Settings ***
Documentation  Common keyword used in multiple tests.
Library  Selenium2Library

*** Variables ***
${browser}=  chrome
${url}=  https://b24demo.slsp.sk/web/login
${selenium_speed}=  0.1     # sec
${timeout_short}=  15       # sec
${tab}=  \\09
${enter}=  \\13

*** Keywords ***
Start test
    open browser  ${url}  ${browser}
    maximize browser window
    set selenium speed  ${selenium_speed}
    set selenium timeout  ${timeout_short}

Finish test
    ${test_passed}=  evaluate  '${TEST STATUS}' == 'PASS'
    run keyword if  ${test_passed}  close browser

Wait click element
    [Arguments]  ${locator}
    [Documentation]  Waits until element is clickable and clicks it
    wait until page does not contain element  css=div.bsc-ui-overlay--waiting
    wait until page does not contain element  css=div.bsc-ui-overlay--wait-out
    wait until page does not contain element  css=div.bsc-ui-loader--show
    wait until element is enabled  ${locator}
    click element  ${locator}

Login
    start test
    wait click element  xpath=//*[@id="loginButton"]
    sleep  1
    wait click element  id=loginButton
    wait until page contains  Inkasá

Select from dropdown
    [Arguments]  ${selector}  ${text}
    wait click element  ${selector}//span/i
    wait click element  ${selector}//ul/li//*[text()='${text}']

Check number of table elements
    [Documentation]    Loops over table rows from 1 to rows_number
    [Arguments]  ${table_selector}  ${expected_text}  ${rows_number}=10
    :FOR    ${index}    IN RANGE  1  ${rows_number}+1
    \    log many  Table=${table_selector}  Expected=${expected_text}  Row=${index}
    \    table row should contain  ${table_selector}  ${index}  ${expected_text}
