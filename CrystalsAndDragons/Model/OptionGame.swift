//
//  Option.swift
//  CrystalsAndDragons
//
//  Created by Максим Солнцев on 10/5/20.
//

import Foundation
import UIKit


extension ViewController {
func createButtons() {
    
    stepsLabel = UILabel(frame: CGRect(x: 20, y: 140, width: 200, height: 30))
    stepsLabel.textColor = UIColor.black
    stepsLabel.font = UIFont.systemFont(ofSize: 20)
    self.view.addSubview(stepsLabel)
    
    keyButton = UIButton(frame: CGRect(x: 200, y: 100, width: 60, height: 30))
    keyButton.setImage(UIImage(named: "key"), for: .normal)
    keyButton.addTarget(self, action: #selector(keyButtonPressed), for: .touchUpInside)
    self.view.addSubview(keyButton)
    
    stoneButton = UIButton(frame: CGRect(x: 300, y: 400, width: 50, height: 50))
    stoneButton.addTarget(self, action: #selector(stoneButtonPressed), for: .touchUpInside)
    stoneButton.setImage(UIImage(named: "stone"), for: .normal)
    self.view.addSubview(stoneButton)
    
    
    boneButton = UIButton(frame: CGRect(x: 100, y: 500, width: 50, height: 50))
    boneButton.setImage(UIImage(named: "bone"), for: .normal)
    boneButton.addTarget(self, action: #selector(boneButtonPressed), for: .touchUpInside)
    self.view.addSubview(boneButton)
    
    chestButton = UIButton(frame: CGRect(x: 200, y: 300, width: 50, height: 50))
    chestButton.setImage(UIImage(named: "chest"), for: .normal)
    chestButton.addTarget(self, action: #selector(chestButtonPressed), for: .touchUpInside)
    self.view.addSubview(chestButton)
    
   
    
    }
    
    
    

    
    func loadRoom() {
        
        stepsLabel.text = "Шагов: \(player.steps)"
        
        let thisRoom = self.labyrinth.labyrinthMatrix[self.player.x][self.player.y]
        if !thisRoom.isThere(direction: .north) {
            upButton.isHidden = true
        } else {
            upButton.isHidden = false
        }
        
        if !thisRoom.isThere(direction: .east) {
           rightButton.isHidden = true
        } else {
            rightButton.isHidden = false
        }
        
        if !thisRoom.isThere(direction: .west) {
            leftButton.isHidden = true
        } else {
            leftButton.isHidden = false
        }
        
        if !thisRoom.isThere(direction: .south) {
            downButton.isHidden = true
        } else {
            downButton.isHidden = false
        }
        
        setUpInventory(in: thisRoom)
    }
    
    func setUpInventory(in room: Room) {
 
        if !player.haveItem(itemInInvertory: .key) {
            
            if room.haveItem(itemHere: .key) {
                keyButton.isHidden = false
            } else {
                keyButton.isHidden = true
            }
        }
        if !player.haveItem(itemInInvertory: .bone) {
            
            if room.haveItem(itemHere: .bone) {
                boneButton.isHidden = false
            } else {
                boneButton.isHidden = true
            }
        }
        
        if !player.haveItem(itemInInvertory: .stone) {
            
            if room.haveItem(itemHere: .stone) {
                stoneButton.isHidden = false
            } else {
                stoneButton.isHidden = true
            }
        }
        
        if room.haveItem(itemHere: .chest) {
            chestButton.isHidden = false
        } else {
            chestButton.isHidden = true
        }
    }
    
    func gameCheck() {
        
        if self.player.steps == 0 {
            self.performSegue(withIdentifier: "GameToEnd", sender: false)
        }
    }
}
