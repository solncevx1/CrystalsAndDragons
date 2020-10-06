//
//  Person.swift
//  CrystalsAndDragons
//
//  Created by Максим Солнцев on 10/1/20.
//

import Foundation


class Person {
    
    var x: Int
    var y: Int
    var steps: Int
    var inventory: [Inventory]
    
    init() {
        x = 0
        y = 0
        steps = 500
        inventory = []
    }
    
    func go(to direction: Direction) {
        let newPosition = getCoordinate(direction: direction, x: self.x, y: self.x)
        self.x = newPosition[0]
        self.y = newPosition[1]
        self.steps -= 1
    }
    
    func get(_ item: Inventory) {
        self.inventory.append(item)
    }
    
    
    func drop(_ item: Inventory) {
        var i = 0
        for invent in self.inventory {
            if invent == item {
                self.inventory.remove(at: i)
                return
            }
            i = i + 1
        }
    }
    
    func haveItem(itemInInvertory: Inventory) -> Bool {
        for item in self.inventory {
            if item == itemInInvertory {
                return true
            }
        }
        
        return false
    }
    
    private func getCoordinate( direction: Direction, x: Int, y: Int) -> [Int] {
        switch direction {
        case .north: return [x + 1, y]
        case .east: return [x, y + 1]
        case .west: return [x, y - 1]
        case .south: return [x - 1, y]
        }
    }
}
