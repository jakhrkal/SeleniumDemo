*** Settings ***
Documentation  Example of how a "page object" might look like.
Library  Selenium2Library
Resource  common.robot

*** Variables ***

*** Keywords ***
Select from menu
    [Arguments]  ${cathegory}  ${subcathegory}
    wait click element  //*[@id="nav"]//ul/li//a//*[text()='${cathegory}']
    wait click element  //*[@id="nav"]//ul/li//ul/li//a//*[text()='${subcathegory}']
