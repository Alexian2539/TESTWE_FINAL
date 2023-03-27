*** Settings ***
Library    SeleniumLibrary

Resource    ./XX_Keyword_Principaux.robot

*** Variables ***


*** Test Cases ***
Images du site
    j'ouvre le navigateur chrome sur la page "${page}"
    je verifie l'affichage et la fonction de l'image principale du site

    je ferme les navigateurs


Affichage du Texte Descriptif
    j'ouvre le navigateur chrome sur la page "${page}"
    je verifie l'affichage du texte de la section principale

    je ferme les navigateurs



Raccourci What If 2
    j'ouvre le navigateur chrome sur la page "${page}"
    je verifie l'affichage et la fonction du raccourci What If 2

    je ferme les navigateurs



*** Keywords ***