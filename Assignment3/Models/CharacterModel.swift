//
//  CharacterModel.swift
//  Assignment3
//
//  Created by Michael Medlin on 3/31/24.
//

import Foundation

struct CharacterResults : Codable {
    let results : [CharacterModel]
}

struct CharacterModel : Codable, Identifiable {
    let id : Int
    let name : String
    let status : String
    let species : String?
    let type : String?
    let gender : String?
    let image : String?
    let url : String?
    
}


