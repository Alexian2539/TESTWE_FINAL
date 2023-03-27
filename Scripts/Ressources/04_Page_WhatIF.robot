*** Settings ***
Library    SeleniumLibrary    

*** Variables ***



*** Keywords ***
WHATIF_Verifier page principale "What If" est correctement affichée
    [Documentation]    Keyword permettant de vérifier que l'on est bien sur la page principale des histoires "What If"

    ${current_url}=    Get Location
    ${Url_what_if}=    Set Variable    https://what-if.xkcd.com/
    ${pass}=    Run Keyword And Return Status    Should Be Equal    ${current_url}    ${Url_what_if}

    IF  ${pass}

        Log To Console    . . . Vous êtes bien sur la page de "What If ?"

        ${present}=    Run Keyword And Return Status    Element Should Be Visible    xpath://section[@id="news"]
        Run Keyword If    ${present}    Log To Console    . . . La section des news est bien visible.

        ${present}=    Run Keyword And Return Status    Element Should Be Visible    xpath://section[@id="entry-wrapper"]
        Run Keyword If    ${present}    Log To Console    . . . La section principale des entrées est bien visible.

        ${present}=    Run Keyword And Return Status    Element Should Be Visible    xpath://section[@id="the-books"]
        Run Keyword If    ${present}    Log To Console    . . . La section des livres est bien visible.

        ${present}=    Run Keyword And Return Status    Element Should Be Visible    xpath://section[@id="the-comic"]
        Run Keyword If    ${present}    Log To Console    . . . La section des comics est bien visible.
    
        ${present}=    Run Keyword And Return Status    Element Should Be Visible    xpath://section[@id="footer-wrapper"]
        Run Keyword If    ${present}    Log To Console    . . . Le pied de page est bien visible.
        
    ELSE
        
        Log To Console    . . . Vous ne semblez pas être sur la bonne page...

    END


    





