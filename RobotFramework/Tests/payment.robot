*** Settings ***
Documentation  Payment functionality tests.
Library  Selenium2Library
Resource  ../Resources/common.robot
Resource  ../Resources/menu.robot

Test Setup  Login
Test Teardown  Finish test


*** Variables ***


*** Test Cases ***
Make payment
#    Platby
    wait click element  xpath=//*[@id="nav"]/div[2]/ul/li[3]/a/span/span
#    Jednorazovy platobny prikaz
    wait click element  xpath=//*[@id="menu_payments"]/li[1]/a/span
    sleep  2
#    Todo - dokoncit test
