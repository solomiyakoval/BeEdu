//
//  ObjectA.swift
//  TrashMinigameTest
//
//  Created by Michele Colella on 19/10/23.
//

import Foundation

struct ObjectA: Identifiable {
    let id = UUID()
    var position: CGPoint
    var disappeared: Bool
    var trashType: TrashType
}
