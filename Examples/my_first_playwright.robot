*** Settings ***
Library                             Browser

*** Variables ***
${LOGIN}  value
${PWD}    value

*** Test Cases ***
My Fisrt Playwright Robot Test
    [Tags]  my_first_playwright
    # Step 1 : aller sur le site https://www.saucedemo.com/
    # Step 2 : se connecter au compte standard_user
    # Step 2 : vider le panier (avec le bouton "Remove", s’il est visibile sur la grille produit
    # Step 2 : ajouter la produit "Sauce Labs Backpack" au panier
    # Step 2 : aller dans le panier
    # Step 2 : vérifier que le produit "Sauce Labs Backpack" est présent dans le panier
    # Step 2 : continuer le processus de commande
    # Step 2 : payer la commande
    # Step 2 : vérifier que la commande est validée grâce au message "Thank you for your order"

*** Keywords ***