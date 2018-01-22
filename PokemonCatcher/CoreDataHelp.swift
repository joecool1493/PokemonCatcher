//
//  CoreDataHelp.swift
//  PokemonCatcher
//
//  Created by Joey Newfield on 1/14/18.
//  Copyright © 2018 Joey Newfield. All rights reserved.
//

import Foundation
import UIKit
import CoreData

func addAllPokemon() {
    createPokemon(name: "Bacon", imageName: "bacon")
    createPokemon(name: "Beans", imageName: "beans")
    createPokemon(name: "Green Bell Pepper", imageName: "bell-pepper")
    createPokemon(name: "Cheeseburger", imageName: "burger")
    createPokemon(name: "Chili Pepper", imageName: "chili")
    createPokemon(name: "Double Cheeseburger for Ultimate Shlorp Experience", imageName: "double-burger")
    createPokemon(name: "Garlic", imageName: "garlic")
    createPokemon(name: "Beans", imageName: "beans")
    createPokemon(name: "Onion", imageName: "onion")
    createPokemon(name: "Beans", imageName: "beans")
    createPokemon(name: "Salt and Pepper", imageName: "salt-and-pepper")
    createPokemon(name: "Tomato", imageName: "tomato")
    
    (UIApplication.shared.delegate as! AppDelegate).saveContext()
}

func createPokemon(name :String, imageName: String) {
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    let pokemon = Pokemon(context: context)
    pokemon.name = name
    pokemon.imageName = imageName
}

func getAllPokemon() -> [Pokemon] {
     let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    do {
    let pokemons = try context.fetch(Pokemon.fetchRequest()) as! [Pokemon]
        
        if pokemons.count == 0 {
            addAllPokemon()
            return getAllPokemon()
        }
        return pokemons
    } catch {}
    
    return []
}

func getAllCaughtPokemons() -> [Pokemon] {
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    let fetchRequest = Pokemon.fetchRequest() as NSFetchRequest<Pokemon>
    fetchRequest.predicate = NSPredicate(format: "caught == %@", true as CVarArg)
    do {
    let pokemons = try context.fetch(fetchRequest) as [Pokemon]
        return pokemons
    } catch {}
    return []
    
}

func getAllUncaughtPokemons() -> [Pokemon] {
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    let fetchRequest = Pokemon.fetchRequest() as NSFetchRequest<Pokemon>
    fetchRequest.predicate = NSPredicate(format: "caught == %@", false as CVarArg)
    do {
        let pokemons = try context.fetch(fetchRequest) as [Pokemon]
        return pokemons
    } catch {}
    return []
}
