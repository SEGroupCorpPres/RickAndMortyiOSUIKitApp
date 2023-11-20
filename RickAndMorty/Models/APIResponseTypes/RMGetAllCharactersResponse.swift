//
//  RMGetCharactersResponse.swift
//  RickAndMorty
//
//  Created by Sulaymon O'rinov on 17/11/23.
//

import Foundation

struct RMGetAllCharacterResponse: Codable {
    struct Info: Codable{
        let count: Int
        let pages: Int
        let next: String?
        let prev: String?
    }
    let info: Info
    let results: [RMCharacter]
}
