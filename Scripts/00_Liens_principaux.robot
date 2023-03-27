*** Settings ***
Library    SeleniumLibrary

Resource    ./XX_Keyword_Principaux.robot

*** Variables ***


*** Test Cases ***
Consulter les archives
    j'ouvre le navigateur chrome sur la page "${page}"
    je verifie que la section liens principaux est correctement affichee 
    je clique sur le lien "Archive"

    je verifie que je suis sur la page "https://xkcd.com/archive/"
    je verifie que la section "Liens Principaux" est visible
    je verifie que la section "Section principale" est visible
    je verifie que la section "Section du milieu" est visible
    je verifie que la section "Section du bas" est visible

    je verifie que la section "Section du milieu" contient bien l'element texte "Comics"
    je verifie que l'element texte "Comics" est un titre principal
    # je verifie que la liste de comics est bien presente et contient potentiellement "2753" lien de comics
    
    je verifie que la section "Section du bas" est visible

    je reviens sur la page principale
    je ferme les navigateurs

Histoires alternatives
    j'ouvre le navigateur chrome sur la page "${page}"
    je verifie que la section liens principaux est correctement affichee
    je clique sur le lien "What If?"

    je verifie que je suis sur la page "https://what-if.xkcd.com/"

    je verifie que l'element texte "what if?" est un titre principal
    je verifie que l'element texte "&" est un titre principal
    je verifie que l'element texte "how to:" est un titre principal

    je verifie que la page principale de "What If" est correctement affichée
    je reviens sur la page principale
    
    je ferme les navigateurs

Email
    j'ouvre le navigateur chrome sur la page "${page}"
    je verifie que la section liens principaux est correctement affichee
    je clique sur le lien "Email"

    je verifie que la page principale de "Email" est correctement affichée
    je renseigne mon email "testexos@testtestwe.fr"
    je ferme les navigateurs




*** Keywords ***