//
//  RMEndpoint.swift
//  RickAndMorty
//
//  Created by Sulaymon O'rinov on 16/11/23.
//

import Foundation

///  Represents unique API endpoint
@frozen enum RMEndpoit: String {
    ///  Endpoint to get character info
    case character
    
    ///  Endpoint to get location info
    case location
    
    ///  Endpoint  to get episode info
    case episode
}
