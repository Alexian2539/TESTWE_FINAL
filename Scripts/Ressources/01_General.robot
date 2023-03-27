*** Settings ***
Library    SeleniumLibrary

*** Variables ***



*** Keywords ***
GNRL_Cliquer sur lien "${link}"
    [Documentation]    Keyword général permettant le clic sur un lien texte. (Sensible à la casse)
    
    Log To Console    . . . Clic sur le lien : "${link}"
    
    # Test si la variable est directement nommée comme le lien ou non, puis clic dessus
    ${present}=    Run Keyword And Return Status    Click Link    xpath://*[contains(text(),"${link}")]
    Run Keyword If    "${present}"=="False"    Click Element    xpath://*[contains(text(),"${${link}}")]


GNRL_Revenir sur page principale
    [Documentation]    Permet de revenir sur la page principale du site
    
    # Test si l'image principale du site (lien) est visible, sinon utilise l'URL pour changer de page
    ${pass}=    Run Keyword And Return Status    Click Element    xpath://*[@id="masthead"]
    Run Keyword If    "${pass}"=="False"    Go To    https://xkcd.com/

GNRL_Verifier section liens principaux correctement affichee
    [Documentation]    Permet de vérifier que la section en haut a gauche , des liens principaux et bien visible.

    # Vérifie si la section des liens utiles est visible
    Wait Until Element Is Visible    xpath://*[@id="topLeft"]

    # Vérifie si chaque lien est bien visible
    Wait Until Element Is Visible    xpath://*[@id="topLeft"]/ul/li/a[@href="/archive"]
    Wait Until Element Is Visible    xpath://*[@id="topLeft"]/ul/li/a[@href="https://what-if.xkcd.com"]
    Wait Until Element Is Visible    xpath://*[@id="topLeft"]/ul/li/a[@href="/about"]
    Wait Until Element Is Visible    xpath://*[@id="topLeft"]/ul/li/a[@href="/atom.xml"]
    Wait Until Element Is Visible    xpath://*[@id="topLeft"]/ul/li/a[@href="/newsletter/"]
    Wait Until Element Is Visible    xpath://*[@id="topLeft"]/ul/li/a[@href="https://twitter.com/xkcd/"]
    Wait Until Element Is Visible    xpath://*[@id="topLeft"]/ul/li/a[@href="https://www.facebook.com/TheXKCD/"]
    Wait Until Element Is Visible    xpath://*[@id="topLeft"]/ul/li/a[@href="https://www.instagram.com/xkcd/"]
    Wait Until Element Is Visible    xpath://*[@id="topLeft"]/ul/li/a[@href="/books/"]
    Wait Until Element Is Visible    xpath://*[@id="topLeft"]/ul/li/a[@href="/what-if-2/"]
    Wait Until Element Is Visible    xpath://*[@id="topLeft"]/ul/li/a[@href="/what-if/"]
    Wait Until Element Is Visible    xpath://*[@id="topLeft"]/ul/li/a[@href="/thing-explainer/"]
    Wait Until Element Is Visible    xpath://*[@id="topLeft"]/ul/li/a[@href="/how-to/"]

GNRL_Verifier section "${name}" n'est pas visible
    [Documentation]    Ce keyword permet de vérifier qu'un bloc principal, une section de la page n'est pas visible / affichée.

    ${section1}=    Set Variable    id="topLeft"
    ${section2}=    Set Variable    id="topRight"
    ${section3}=    Set Variable    id="middleContainer"
    ${section4}=    Set Variable    id="bottom"

    IF  "${name}"=="Liens Principaux"

        Element Should Not Be Visible    xpath://*[@${section1}]

    ELSE IF    "${name}"=="Section principale"

        Element Should Not Be Visible    xpath://*[@${section2}]

    ELSE IF    "${name}"=="Histoires"

        Element Should Not Be Visible    xpath://*[@${section3}]

    ELSE IF    "${name}"=="Liens utiles"

        Element Should Not Be Visible    xpath://*[@${section4}]

    END

GNRL_Verifier section "${name}" est visible
    [Documentation]    Ce keyword permet de vérifier qu'un bloc principal, une section de la page est bien visible / affichée.

    ${section1}=    Set Variable    id="topLeft"
    ${section2}=    Set Variable    id="topRight"
    ${section3}=    Set Variable    id="middleContainer"
    ${section4}=    Set Variable    id="bottom"

    IF  "${name}"=="Liens Principaux"

        Element Should Be Visible    xpath://*[@${section1}]

    ELSE IF    "${name}"=="Section principale"

        Element Should Be Visible    xpath://*[@${section2}]

    ELSE IF    "${name}"=="Section du milieu"

        Element Should Be Visible    xpath://*[@${section3}]

    ELSE IF    "${name}"=="Section du bas"

        Element Should Be Visible    xpath://*[@${section4}]

    END

GNRL_Verifier url page actuelle "${page}"
    [Documentation]    Ce keyword permet de vérifier qu'on est bien sur la page désirée.

    ${current_url}=    Get Location
    Should Be Equal As Strings    ${current_url}    ${page}
    

GNRL_Verifier section "${name}" contient bien l'element texte "${element}"
    [Documentation]    Ce keyword permet de vérifier qu'un bloc principal, une section de la page contient bien l'element texte attendu

    ${section1}=    Set Variable    id="topLeft"
    ${section2}=    Set Variable    id="topRight"
    ${section3}=    Set Variable    id="middleContainer"
    ${section4}=    Set Variable    id="bottom"

    IF  "${name}"=="Liens Principaux"

        Element Should Be Visible    xpath://*[@${section1}]//*[contains(text(),"${element}")]

    ELSE IF    "${name}"=="Section principale"

        Element Should Be Visible    xpath://*[@${section2}]//*[contains(text(),"${element}")]

    ELSE IF    "${name}"=="Section du milieu"

        Element Should Be Visible    xpath://*[@${section3}]//*[contains(text(),"${element}")]

    ELSE IF    "${name}"=="Section du bas"

        Element Should Be Visible    xpath://*[@${section4}]//*[contains(text(),"${element}")]

    END

GNRL_Verifier element texte "${element}" est un titre principal
    [Documentation]    Ce keyword permet de vérifier que l'element texte passé en paramètre est bien un titre principal (h1).

    Element Should Be Visible    xpath://h1[contains(text(),"${element}")]




