//
//  PokeAnnotation.swift
//  PokemonCatcher
//
//  Created by Joey Newfield on 1/15/18.
//  Copyright © 2018 Joey Newfield. All rights reserved.
//

import UIKit
import MapKit

class PokeAnnotation: NSObject, MKAnnotation {
    var coordinate: CLLocationCoordinate2D
    var pokemon: Pokemon
    
    init(coord: CLLocationCoordinate2D, pokemon: Pokemon) {
        self.coordinate = coord
        self.pokemon = pokemon
    }
}
