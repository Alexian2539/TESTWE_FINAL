*** Settings ***
Library    SeleniumLibrary    

*** Variables ***
${BROWSER}        Chrome


*** Keywords ***
CNF_Ouvrir Browser chrome page "${URL}"
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Sleep    5s

CNF_Fermer Browser
    [Documentation]    Permet de fermer les navigateurs après un test.
    
    Close All Browsers  
    Log To Console    . . . Les browsers ont été fermés.   






