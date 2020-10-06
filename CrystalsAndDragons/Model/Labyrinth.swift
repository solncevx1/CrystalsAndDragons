//
//  Labyrinth.swift
//  CrystalsAndDragons
//
//  Created by Максим Солнцев on 10/1/20.
//

import Foundation



enum Inventory {
    case key
    case stone
    case bone
    case chest
}


enum Direction {
    case north
    case east
    case west
    case south
    
}

class Labyrinth {
    
    var numberOfRoom: Int
    private(set) var labyrinthMatrix: [[Room]]
    
    init() {
        
        self.numberOfRoom = 5
        self.labyrinthMatrix = [[]]
        for i in 0..<self.numberOfRoom {
            for j in 0..<self.numberOfRoom {
                self.labyrinthMatrix[i].append(Room(x: i, y: j, labyrinth: self))
            }
            self.labyrinthMatrix.append([])
        }
        self.labyrinthMatrix.remove(at: self.labyrinthMatrix.endIndex - 1)
        
        initInventory()
        initDirections()
    }
    
    private func initInventory() {
        //проверка
        self.labyrinthMatrix[2][1].inventory.append(Inventory.key)
        self.labyrinthMatrix[1][2].inventory.append(Inventory.bone)
        self.labyrinthMatrix[0][1].inventory.append(Inventory.stone)
        self.labyrinthMatrix[0][1].inventory.append(Inventory.chest)
        
//        self.labyrinthMatrix[getRandom(min: 1, max: self.numberOfRoom)][getRandom(min: 1, max: self.numberOfRoom)].inventory.append(Inventory.key)
//        self.labyrinthMatrix[getRandom(min: 1, max: self.numberOfRoom)][getRandom(min: 1, max: self.numberOfRoom)].inventory.append(Inventory.bone)
//        self.labyrinthMatrix[getRandom(min: 1, max: self.numberOfRoom)][getRandom(min: 1, max: self.numberOfRoom)].inventory.append(Inventory.stone)
//        self.labyrinthMatrix[getRandom(min: 1, max: self.numberOfRoom)][getRandom(min: 1, max: self.numberOfRoom)].inventory.append(Inventory.chest)
//
        
    }
    
    private func initMatrix(index: Int, way: Direction) {
        if way == .north {
            if index == 0 {
                for i in 1..<self.numberOfRoom - 1 {
                    self.labyrinthMatrix[i][index].directions.append(.north)
                    self.labyrinthMatrix[i][index].directions.append(.south)
                    self.labyrinthMatrix[i][index].directions.append(.east)
                }
            } else {
                for i in 1..<self.numberOfRoom - 1 {
                    self.labyrinthMatrix[i][index].directions.append(.north)
                    self.labyrinthMatrix[i][index].directions.append(.south)
                    self.labyrinthMatrix[i][index].directions.append(.west)
                    
                }
            }
        } else {
            if index == 0 {
                for i in 1..<self.numberOfRoom - 1 {
                    self.labyrinthMatrix[index][i].directions.append(.west)
                    self.labyrinthMatrix[index][i].directions.append(.east)
                    self.labyrinthMatrix[index][i].directions.append(.north)
                }
            } else {
                for i in 1..<self.numberOfRoom - 1 {
                    self.labyrinthMatrix[index][i].directions.append(.west)
                    self.labyrinthMatrix[index][i].directions.append(.east)
                    self.labyrinthMatrix[index][i].directions.append(.south)
                }
            }
        }
    }
    
    private func initCenter(x: Int, y: Int) {
           let doors = getRandom(min: 2, max: 5)
        
        for _ in 1...doors {
            let way = getRandom(min: 0, max: 4)
            switch way {
            case 0: self.labyrinthMatrix[x][y].directions.append(.north)
            case 1: self.labyrinthMatrix[x][y].directions.append(.west)
            case 2: self.labyrinthMatrix[x][y].directions.append(.east)
            case 3: self.labyrinthMatrix[x][y].directions.append(.south)
            default: break
            }
        }
    }
    
    private func initDirections() {
        self.labyrinthMatrix[0][0].directions.append(.north)
        self.labyrinthMatrix[0][0].directions.append(.east)
        
        initMatrix(index: 0, way: .north)
        initMatrix(index: 0, way: .east)
        initMatrix(index: self.numberOfRoom - 1, way: .north)
        initMatrix(index: self.numberOfRoom - 1, way: .east)
        
        for i in 1..<self.numberOfRoom - 1 {
            for j in 1..<self.numberOfRoom - 1 {
                initCenter(x: i, y: j)
            }
        }
    }
    
    private func getRandom(min: Int, max: Int) -> Int {
        return min + Int(arc4random_uniform(UInt32(max - min)))
    }
    
}


class Room {
    
    fileprivate var x: Int
    fileprivate var y: Int
    fileprivate var directions: [Direction]
    fileprivate var inventory: [Inventory]
    
    init(x: Int, y: Int, labyrinth: Labyrinth) {
        self.x = x
        self.y = y
        self.directions = []
        self.inventory = []
        
    }
    
    func playerGet(_ item: Inventory) {
        var i = 0
        for invent in self.inventory {
            if invent == item {
                self.inventory.remove(at: i)
                return
            }
            i = i + 1
        }
    }
    
    func playerDrop(_ item: Inventory) {
        self.inventory.append(item)
    }
    
    func isThere(direction: Direction) -> Bool {
        for dir in self.directions {
            if dir == direction {
                return true
            }
        }
        
        return false
    }
    
    func haveItem(itemHere: Inventory) -> Bool {
        for item in self.inventory {
            if item == itemHere {
                return true
            }
        }
        
        return false
    }
}
