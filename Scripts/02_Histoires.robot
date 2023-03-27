*** Settings ***
Library    SeleniumLibrary

Resource    ./XX_Keyword_Principaux.robot

*** Variables ***


*** Test Cases ***
Verification Histoire
    j'ouvre le navigateur chrome sur la page "${page}"
    je verifie le titre de la section histoire
    je teste les Boutons supérieurs
    je verifie l'affichage des images des histoires

    je ferme les navigateurs



Liens annexes
    j'ouvre le navigateur chrome sur la page "${page}"

    je verifie l'affichage des liens
    je clique sur les liens

    je ferme les navigateurs