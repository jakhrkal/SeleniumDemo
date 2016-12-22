*** Settings ***
Documentation  Account tests.
Resource  ../Resources/common.robot
Resource  ../Resources/menu.robot

Test Setup  Login
Test Teardown  Finish test

*** Variables ***
${payment_table}=  xpath=//*[@id="DataTables_Table_0_wrapper"]//table
${payment_table_rows}=  10

*** Test Cases ***
List accounts
    select from menu  Účty  Prehľad účtov
    wait until page contains  Disponibilný zostatok
    table row should contain  ${payment_table}  1  Bežný účet

Size of payment history
    [Tags]  dev
    select from menu  Účty  Prehľad účtov
    wait until page contains  Disponibilný zostatok
    Check number of table elements  ${payment_table}  Bežný účet  ${payment_table_rows}

Filter accounts
    select from menu  Účty  Prehľad účtov
#   typ uctu
    select from dropdown  xpath=//*[@id="ng-view"]//form/fieldset/div/div[2]/div[1]/div/div/div/div/div[2]  Termínovaný účet
    wait click element  xpath=//*[@id="ng-view"]//form//button[text()='Hľadať']
    wait until page does not contain  Bežný účet