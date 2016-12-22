*** Settings ***
Documentation  Login functionality.
Library  Selenium2Library
Resource  ../Resources/common.robot

Test Setup  Start test
Test Teardown  Finish test

*** Variables ***


*** Test Cases ***
Smoke
    [Documentation]  Basic login functionality.
    sleep  1
    close browser

Login
    wait click element  xpath=//*[@id="loginButton"]
    sleep  1
    wait click element  id=loginButton
    wait until page contains  Administrácia

Logout
    wait click element  xpath=//*[@id="loginButton"]
    sleep  1
    wait click element  id=loginButton
    wait until page contains  Administrácia
#    logout
    wait click element  xpath=/html/body/div[3]/div[5]/div[1]/header/div/div[2]/div[2]/h2
    wait until page does not contain  Administrácia