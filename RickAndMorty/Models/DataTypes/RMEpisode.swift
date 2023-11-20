//
//  RMEpisode.swift
//  RickAndMorty
//
//  Created by Sulaymon O'rinov on 15/11/23.
//

import Foundation

struct RMEpisode: Codable{
    let id: Int
    let name: String
    let air_data: String
    let episode: String
    let characters: [String]
    let url: String
    let created: String
}
