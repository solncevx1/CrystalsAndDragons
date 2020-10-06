//
//  Model.swift
//  CrystalsAndDragons
//
//  Created by Максим Солнцев on 9/30/20.
//

import Foundation


class Room {
    var key: Key?
    var box: Box?
    var value: Int?
}


class Person {
    
    var x = 0
    var y = 0
    
    var invertory: Inventory?
    
    func goToNextRoom(direction: Direction) {
        
        switch direction {
        case .Down:
            print("I go  Down")
        case .Up:
            print("I go  Up")
        case .Left:
            print("I go Left")
        case .Right:
            print("I go  Right")
        }
    }
}


class Key {
    var coordinate: Double?
}


class Box {
    var coordinate: Double?
}

enum Direction {
    case Left, Right, Up, Down
}



class Inventory {
    
    
    
}
