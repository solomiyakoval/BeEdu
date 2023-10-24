//
//  TrashBinModel.swift
//  TrashMinigameTest
//
//  Created by Michele Colella on 19/10/23.
//

import Foundation

struct TrashItem {
    var image: String // Nome dell'immagine da utilizzare per l'oggetto di spazzatura
    var type: TrashType // Tipo di spazzatura
    var binType: BinType
}

enum TrashType {
    case paper
    case plastic
    case organic
    case aluminum
    case glass
}

enum BinType {
    case paperBin
    case plasticBin
    case organicBin
    case aluminumBin
    case glassBin
}
