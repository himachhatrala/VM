//
//  Room.swift
//  VM
//
//  Created by Hima Chhatrala on 10/10/22.
//

import Foundation

struct Room: Decodable {
    let createdAt, id : String
    let maxOccupancy : Int
    let isOccupied : Bool
}
