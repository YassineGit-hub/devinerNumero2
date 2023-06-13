//
//  main.swift
//  DevinezNumero-Etape2
//
//  Created by Hamid Boudnaoui et Yassine Belkaousse on 2023-06-09.
//

import Foundation

var continuer = true
while continuer {
   
let strd = "Bienvenue au jeu"
let strdd = "Que voulez-vous faire?"
let clas = "1. Partie Classique"
let rap = "2. Partie Rapide"
let perso = "3. Entrez une Partie manuellement"
    
   
    
print("""
    \(strd)
    \(strdd)
    \(clas)
    \(rap)
    \(perso)
    Faites votre choix:
    """)



    
if let choix = readLine(), let partie = Int(choix) {
        switch partie {
        case 1:
            partieClassique()
        case 2:
            partieRapide()
        case 3:
            partieManuelle()
        default:
            print("Choix invalide.")
        }
    } else {
        print("Entrée invalide.")
    }

    print("Fin de la partie Voulez-vous rejouer ? (oui/non)")
    if let reponse = readLine(), reponse.lowercased() != "oui" {
        continuer = false
    }
}

print("Au revoir et merci d'avoir joué !")

// Partie classique
func partieClassique() {
    print("Entrez un nombre entre 1 et 100")
    print("Vous avez 10 coups")
    let borneMin = 1
    let borneMax = 100
    let chiffreMystère = Int.random(in: borneMin...borneMax)
    let nbCoupsMax = 10

    for i in 1...nbCoupsMax {
        print("Entrez un nombre:")

        if let res = readLine(), let nb = Int(res),nb >= borneMin, nb <= borneMax {
            print("Coup n: \(i): \(nb)")

            if i > nbCoupsMax {
                print("Perdu")
                break
            } else if nb == chiffreMystère {
                print("Gagné")
                break
            } else {
                print(nb < chiffreMystère ? "Le nombre à deviner est plus grand." : "Le nombre à deviner est plus petit.")
            }
        } else {
            print("Ce n'est pas un nombre valide, veuillez saisir un nombre compris entre \(borneMin) et \(borneMax).")
        }
    }
    print("Bye")
}

// Partie rapide
func partieRapide() {
    print("""
    Entrez un nombre entre 21 et 42
    Vous devez deviner le nombre en 3 coups
    Bonne chance!
    """)

    let borneMin = 21
    let borneMax = 42
    let chiffreMystèreTs = Int.random(in: borneMin...borneMax)
    let nbCoupsTs = 3
     
    for i in 1...nbCoupsTs {
        print("Coup \(i) - Entrez un nombre entre 21 et 42:")

        if let res = readLine(), let int = Int(res), int >= borneMin, int <= borneMax {
            print("Le Nombre saisi est \(int)")

            if int > chiffreMystèreTs {
                print("Le nombre à deviner est plus petit.")
            } else if int < chiffreMystèreTs {
                print("Le nombre à deviner est plus grand.")
            } else {
                print("Gagné")
                print("Le chiffre Mystère est :\(chiffreMystèreTs)")
                return
            }
        } else {
            print("Le Nombre saisi n'est pas un nombre entier ou est hors des bornes.")
        }
    }
    print("Perdu")
    print("Le chiffre Mystère est :\(chiffreMystèreTs)")
}

// Partie manuelle
func partieManuelle() {
    print("""
      Établissez vos Régles et Devinez le Chiffre Mystère
      Bonne chance!
    """)
    
    print("Entrez la borne minimum:")

    if let minimumSaisie = readLine(), let borneMin = Int(minimumSaisie), borneMin > 0 {
        print("Entrez la borne maximum:")

        if let maximumSaisie = readLine(), let borneMax = Int(maximumSaisie), borneMax > 0 {
            let chiffreMystèreSaisie = Int.random(in: borneMin...borneMax)
            print("Entrez le nombre de coups à jouer:")

            if let nbCoupsJouer = readLine(), let nbCoups = Int(nbCoupsJouer), nbCoups > 0 {
                for i in 1...nbCoups {
                    print("Coup \(i) - Entrez un nombre:")

                    if let res = readLine(), let int = Int(res), int >= borneMin, int <= borneMax {
                        print("Le Nombre saisi est \(int)")

                        if int > chiffreMystèreSaisie {
                            print("Le nombre à deviner est plus petit.")
                        } else if int < chiffreMystèreSaisie {
                            print("Le nombre à deviner est plus grand.")
                        } else {
                            print("Gagné")
                            print("Le chiffre Mystère est :\(chiffreMystèreSaisie)")
                            return
                        }
                    } else {
                        print("Le Nombre saisi n'est pas un nombre entier ou est hors des bornes.")
                    }
                }
                print("Perdu")
                print("Le chiffre Mystère est :\(chiffreMystèreSaisie)")
            } else {
                print("Nombre de coups invalide.")
            }
        } else {
            print("La borne maximum saisie n'est pas un entier .")
        }
    } else {
        print("La borne minimum saisie n'est pas un entier .")
    }
}


