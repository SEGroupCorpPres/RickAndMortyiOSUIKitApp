//
//  RMCharacterDetailViewViewModel.swift
//  RickAndMorty
//
//  Created by Sulaymon O'rinov on 20/11/23.
//

import Foundation

class RMCharacterDetailViewViewModel {

    private let character: RMCharacter
    
    init(character: RMCharacter) {
        self.character = character
    }
    
    public var title: String {
        character.name.uppercased()
    }

}
