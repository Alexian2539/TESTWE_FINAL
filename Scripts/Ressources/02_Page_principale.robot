*** Settings ***
Library    SeleniumLibrary

Resource    ../XX_Keyword_Principaux.robot

*** Variables ***



*** Keywords ***
PGE_PRNCPL_Verifier l'affichage et la fonction de l'image principale du site
    [Documentation]

    Element Should Be Visible    xpath://div[@id="masthead"]//img
    Click Image    xpath://div[@id="masthead"]//img

    ${current_url}=    Get Location
    Should Be Equal As Strings    ${current_url}    ${page}

PGE_PRNCPL_Verifier l'affichage du texte de la section principale
    [Documentation]

    Element Should Be Visible    xpath://span[@id="slogan"]

PGE_PRNCPL_Verifier l'affichage et la fonction du raccourci What If 2
    [Documentation]

    Element Should Be Visible    xpath://div[@id="countdown"]//img
    Click Image    xpath://div[@id="countdown"]//img

    ${current_url}=    Get Location
    Should Be Equal As Strings    ${current_url}    https://xkcd.com/what-if-2/
    
    Element Should Be Visible    xpath://*[contains(text(),"what if? 2: the book")]


PGE_PRNCPL_Verifier titre de la section histoire
    [Documentation]

    Element Should Be Visible    xpath://*[@id="ctitle"]

PGE_PRNCPL_Tester les Boutons supérieurs
    [Documentation]

    ${Comics_1}=    Set Variable    Barrel - Part 1
    ${Comics_2}=    Set Variable    Petit Trees (sketch)
    ${Comics_Last}=    Set Variable    Relative Terms

    # Clic sur bouton |<
    # Verification que l'on est pas déjà sur le premier comics de la liste. Mise en place d'un jeu de données adapté le cas échéant.
    ${present}=    Run Keyword And Return Status    Element Should Not Be Visible    xpath://*[@id="ctitle"][contains(text(),"${Comics_1}")]
    
    IF  "${present}"=="False"

        Click Element    xpath://a[contains(text(),"Random")][1]
        ${present}=    Run Keyword And Return Status    Element Should Not Be Visible    xpath://*[@id="ctitle"][contains(text(),"${Comics_1}")]
                
    END

    Click Element    xpath://a[contains(text(),"|<")][1]
    Element Should Be Visible    xpath://*[@id="ctitle"][contains(text(),"${Comics_1}")]
    

    # Clic sur bouton < Prev
    # Verification que l'on est sur le deuxieme comics de la liste. Mise en place d'un jeu de données adapté le cas échéant.
    ${present}=    Run Keyword And Return Status    Element Should Be Visible    xpath://*[@id="ctitle"][contains(text(),"${Comics_2}")]
    
    IF  "${present}"=="False"

        Click Element    xpath://a[contains(text(),"|<")][1]
        Click Element    xpath://a[contains(text(),"Next >")][1]
        ${present}=    Run Keyword And Return Status    Element Should Be Visible    xpath://*[@id="ctitle"][contains(text(),"${Comics_2}")]
                
    END

    Click Element    xpath://a[contains(text(),"< Prev")][1]
    Element Should Be Visible    xpath://*[@id="ctitle"][contains(text(),"${Comics_1}")]

    # Clic sur bouton Random
    # Verification changement histoire aléatoire sur 3 essais
    ${count}=    Set Variable    0
    ${max}    Set Variable    3

    WHILE  ${count}<${max}
        
        ${story}=    Get Text    xpath://*[@id="ctitle"][contains(text(),"")]

        Click Element    xpath://a[contains(text(),"Random")][1]
        Element Should Not Be Visible    xpath://*[@id="ctitle"][contains(text(),"${story}")]

        ${count}=    Evaluate    ${count} + 1

    END
    
    # Clic sur bouton Next >
    # Verification que l'on est sur le premier comics de la liste. Mise en place d'un jeu de données adapté le cas échéant.
    ${present}=    Run Keyword And Return Status    Element Should Be Visible    xpath://*[@id="ctitle"][contains(text(),"${Comics_1}")]
    
    IF  "${present}"=="False"

        Click Element    xpath://a[contains(text(),"|<")][1]
        ${present}=    Run Keyword And Return Status    Element Should Be Visible    xpath://*[@id="ctitle"][contains(text(),"${Comics_1}")]
                
    END

    Click Element    xpath://a[contains(text(),"Next >")][1]
    Element Should Be Visible    xpath://*[@id="ctitle"][contains(text(),"${Comics_2}")]

    # Clic sur bouton >|
    # Verification que l'on est pas déjà sur le dernier comics de la liste. Mise en place d'un jeu de données adapté le cas échéant.
    ${present}=    Run Keyword And Return Status    Element Should Not Be Visible    xpath://*[@id="ctitle"][contains(text(),"${Comics_Last}")]
    
    IF  "${present}"=="False"

        Click Element    xpath://a[contains(text(),"Random")][1]
        ${present}=    Run Keyword And Return Status    Element Should Not Be Visible    xpath://*[@id="ctitle"][contains(text(),"${Comics_Last}")]
                
    END

    Click Element    xpath://a[contains(text(),">|")][1]
    Element Should Be Visible    xpath://*[@id="ctitle"][contains(text(),"${Comics_Last}")]


PGE_PRNCPL_Verifier l'affichage des images des histoires
    [Documentation]
    ${source_actuelle}=    Get Element Attribute    xpath://*[@id="comic"]/img    src
    Click Element    xpath://a[contains(text(),"Random")][1]

    ${source_nouvelle}=    Get Element Attribute    xpath://*[@id="comic"]/img    src
    
    Should Not Be Equal    ${source_actuelle}    ${source_nouvelle}