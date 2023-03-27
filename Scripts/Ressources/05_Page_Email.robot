*** Settings ***
Library    SeleniumLibrary

Variables    ./Variables.py


*** Variables ***


*** Keywords ***
EMAIL_Verifier page principale "Email" est correctement affichée
    [Documentation]    Keyword permettant de vérifier que l'on est bien sur la page principale des histoires "What If"

    Element Should Be Visible    xpath://p[contains(text(),"${Texte_email}")]
    Element Should Be Visible    xpath://input[@type="email"][@name="email"]
    Element Should Be Visible    xpath://input[@type="submit"][@value="subscribe"]


EMAIL_Renseigner mon email "${email}"
    [Documentation]    Ce keyword permet de renseigner du texte (email) dans le champs pour souscrire son email.
    ...                Verifie également que si le champ est vide , un warning est remonté dans la console.
    
    ${pass}=    Run Keyword And Return Status    Input Text    xpath://input[@type="email"][@name="email"]    ${email}

    IF  "${email}"!="${EMPTY}"
        
        Click Element    xpath://input[@type="submit"][@value="subscribe"]
        Wait Until Element Is Visible    xpath://*[contains(text(),"${alert_email}")]
        
    ELSE

        Log To Console    . . . Attention aucun Email n'est entré dans le champ de saisie.

        Click Element    xpath://input[@type="submit"][@value="subscribe"]
        Wait Until Element Is Visible    xpath://*[contains(text(),"${alert_email}")]

    END
    