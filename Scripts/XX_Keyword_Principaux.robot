*** Settings ***
Library    SeleniumLibrary

Variables    ./Ressources/Variables.py

Resource    ./Ressources/00_Configuration.robot
Resource    ./Ressources/01_General.robot
Resource    ./Ressources/02_Page_principale.robot
Resource    ./Ressources/03_Page_Archives.robot
Resource    ./Ressources/04_Page_WhatIF.robot
Resource    ./Ressources/05_Page_Email.robot


*** Variables ***
${BROWSER}        Chrome
${page}    https://xkcd.com/

*** Keywords ***
### CONFIGURATION ###
j'ouvre le navigateur chrome sur la page "${URL}"
    [Documentation]    Permet d'ouvrir le navigateur chrome sur la page désirée.

    Log To Console    \n j'ouvre le navigateur chrome sur la page "${URL}"
    CNF_Ouvrir Browser chrome page "${URL}"

je ferme les navigateurs
    [Documentation]    Permet de fermer les navigateurs après un test.

    Log To Console    \n je ferme les navigateurs
    CNF_Fermer Browser

### GENERAL ###
je clique sur le lien "${link}"
    [Documentation]    Keyword général permettant le clic sur un lien texte.

    Log To Console    \n je clique sur le lien "${link}"
    GNRL_Cliquer sur lien "${link}"

je reviens sur la page principale
    [Documentation]    Permet de revenir sur la page principale du site

    Log To Console    \n je reviens sur la page principale
    GNRL_Revenir sur page principale


je verifie que la section liens principaux est correctement affichee
    [Documentation]    Permet de vérifier que la section en haut a gauche , des liens principaux et bien visible.

    Log To Console    \n je verifie que la section liens principaux est correctement affichee
    GNRL_Verifier section liens principaux correctement affichee

je verifie que je suis sur la page "${page}"
    [Documentation]    Ce keyword permet de vérifier qu'on est bien sur la page désirée.

    Log To Console    \n je verifie que je suis sur la page "${page}"
    GNRL_Verifier url page actuelle "${page}"

je verifie que la section "${name}" est visible
    [Documentation]    Ce keyword permet de vérifier qu'un bloc principal, une section de la page n'est pas visible / affichée.
    
    Log To Console    \n je verifie que la section "${page}" est visible
    GNRL_Verifier section "${name}" est visible

je verifie que la section "${name}" contient bien l'element texte "${element}"
    [Documentation]    Ce keyword permet de vérifier qu'un bloc principal, une section de la page contient bien l'element texte attendu

    Log To Console    \n je verifie que la section "${name}" contient bien l'element texte "${element}"
    GNRL_Verifier section "${name}" contient bien l'element texte "${element}"

je verifie que l'element texte "${element}" est un titre principal
    [Documentation]    Ce keyword permet de vérifier que l'element texte passé en paramètre est bien un titre principal (h1).
    
    Log To Console    \n L'element texte "${element}" doit etre un titre principal
    GNRL_Verifier element texte "${element}" est un titre principal


### PAGE PRINCIPALE ###
je verifie l'affichage et la fonction de l'image principale du site
    [Documentation]    

    Log To Console    \n je verifie l'affichage et la fonction de l'image principale du site
    PGE_PRNCPL_Verifier l'affichage et la fonction de l'image principale du site

je verifie l'affichage du texte de la section principale
    [Documentation]    

    Log To Console    \n je verifie l'affichage du texte de la section principale
    PGE_PRNCPL_Verifier l'affichage du texte de la section principale

je verifie l'affichage et la fonction du raccourci What If 2
    [Documentation]    

    Log To Console    \n je verifie l'affichage et la fonction du raccourci What If 2
    PGE_PRNCPL_Verifier l'affichage et la fonction du raccourci What If 2

je verifie le titre de la section histoire
    [Documentation]    

    Log To Console    \n je verifie le titre de la section histoire
    PGE_PRNCPL_Verifier titre de la section histoire

je teste les Boutons supérieurs
    [Documentation]    

    Log To Console    \n je teste les Boutons supérieurs
    PGE_PRNCPL_Tester les Boutons supérieurs

je verifie l'affichage des images des histoires
    [Documentation]    

    Log To Console    \n je verifie l'affichage des images des histoires
    PGE_PRNCPL_Verifier l'affichage des images des histoires

je verifie l'affichage des liens
    [Documentation]    

    Log To Console    \n je verifie l'affichage des liens
    # PGE_PRNCPL_Verifier l'affichage des liens

je clique sur les liens
    [Documentation]    

    Log To Console    \n je clique sur les liens
    # PGE_PRNCPL_Cliquer sur les liens
    

### PAGE ARCHIVES ###
je verifie que la liste de comics est bien presente et contient potentiellement "${nb_comics}" lien de comics
    [Documentation]    Keyword permettant de verifier que la longue liste de comis est bien présentée.

    Log To Console    \n je verifie que la liste de comics est bien presente
    ARCHVS_Verifier liste comics bien presente et contient potentiellement "${nb_comics}" lien de comics



### PAGE WHAT IF ###
je verifie que la page principale de "What If" est correctement affichée
    [Documentation]    Keyword permettant de vérifier que l'on est bien sur la page principale des histoires "What If"

    Log To Console    \n je verifie que la page principale de "What If" est correctement affichée
    WHATIF_Verifier page principale "What If" est correctement affichée



### PAGE EMAIL ###
je verifie que la page principale de "Email" est correctement affichée
    [Documentation]    Keyword permettant de vérifier que l'on est bien sur la page principale des histoires "What If"

    Log To Console    \n je verifie que la page principale de "Email" est correctement affichée
    EMAIL_Verifier page principale "Email" est correctement affichée

je renseigne mon email "${email}"
    [Documentation]    Ce keyword permet de renseigner du texte (email) dans le champs pour souscrire son email.
    ...                Verifie également que si le champ est vide , un warning est remonté dans la console.

    Log To Console    \n je renseigne mon email "${email}"
    EMAIL_Renseigner mon email "${email}"
