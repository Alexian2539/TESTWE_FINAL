*** Settings ***
Library    SeleniumLibrary    

*** Variables ***



*** Keywords ***
ARCHVS_Verifier liste comics bien presente et contient potentiellement "${nb_comics}" lien de comics
    [Documentation]    Keyword permettant de verifier que la longue liste de comis est bien présentée.
    
    ${xpath}=    Set Variable    xpath://h1[contains(text(),"Comics")]/../a[contains(@href,"")][1]
    ${increment_xpath}=    Set Variable    xpath://h1[contains(text(),"Comics")]/../a[contains(@href,"")][1]/following-sibling::a

    ${count}=    Set Variable    0
    ${lien_present}=    Run Keyword And Return Status    Element Should Be Visible    ${xpath}

    ${previous_link}=    Set Variable    ${EMPTY}
    WHILE  ${lien_present}
        
        ${nom_comic}=    Get Text    ${xpath}
        Log To Console    . . . Lien de comics ${count} affiché : ${nom_comic}

        ${count}=    Evaluate    ${count} + 1
        
        # Trouver le xpath du lien suivant en utilisant le nom du lien courant
        ${xpath_ergo_increment}=    Set Variable If    "${previous_link}" == "${EMPTY}" 
            ...    xpath://h1[contains(text(),"Comics")]/../a[contains(text(),"${nom_comic}")]/following-sibling::a
            ...    xpath://h1[contains(text(),"Comics")]/../a[contains(text(),"${nom_comic}") and not(contains(text(),"${previous_link}"))]/following-sibling::a
        ${previous_link}=    Set Variable    ${nom_comic}
        ${xpath}=    Set Variable    ${xpath_ergo_increment}

        ${lien_present}=    Run Keyword And Return Status    Element Should Be Visible    ${xpath}
        

    END
    
    IF  "${nb_comics}"!="None"

        ${equals}=    Run Keyword And Return Status    Should Be Equal    ${nb_comics}    ${count}
        Log To Console    ${count} ${nb_comics}
        IF  ${equals}

            Log To Console    . . . La liste de comics contient bien ${count} comics sur ${nb_comics} attendus.
            
        ELSE

            Log To Console    . . . La liste de contient pas les ${nb_comics} attendus, il n'est remonté que ${count} lien de comics, il y a peut être un problème sur quelques liens...

        END
        
        
    END


# ARCHVS_Verifier liste comics bien presente et contient potentiellement "${nb_comics}" lien de comics
#     [Documentation]    Keyword permettant de verifier que la longue liste de comis est bien présentée.
    
#     ${xpath}=    Set Variable    xpath://h1[contains(text(),"Comics")]/../a[contains(@href,"")][1]
#     ${increment_xpath}=    Set Variable    xpath://h1[contains(text(),"Comics")]/../a[contains(@href,"")][1]/following-sibling::a

#     ${count}=    Set Variable    0
#     ${lien_present}=    Run Keyword And Return Status    Element Should Be Visible    ${xpath}

#     WHILE  ${lien_present}
        
#         ${nom_comic}=    Get Text    ${xpath}
#         Log To Console    . . . Lien de comics ${count} affiché : ${nom_comic}

#         ${count}=    Evaluate    ${count} + 1
#         ${xpath_ergo_increment}=    Set Variable    xpath://h1[contains(text(),"Comics")]/../a[contains(text(),"${nom_comic}")]/following-sibling::a
#         ${xpath}=    Set Variable    ${xpath_ergo_increment}

#         ${lien_present}=    Run Keyword And Return Status    Element Should Be Visible    ${xpath}
        

#     END
    
#     IF  "${nb_comics}"!="None"

#         ${equals}=    Run Keyword And Return Status    Should Be Equal    ${nb_comics}    ${count}
#         Log To Console    ${count} ${nb_comics}
#         IF  ${equals}

#             Log To Console    . . . La liste de comics contient bien ${count} comics sur ${nb_comics} attendus.
            
#         ELSE

#             Log To Console    . . . La liste de contient pas les ${nb_comics} attendus, il n'est remonté que ${count} lien de comics, il y a peut être un problème sur quelques liens...

#         END
        
        
#     END
    
    



