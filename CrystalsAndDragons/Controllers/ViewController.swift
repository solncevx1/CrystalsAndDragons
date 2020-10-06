//
//  ViewController.swift
//  CrystalsAndDragons
//
//  Created by Максим Солнцев on 9/29/20.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var upButton: UIButton!
    @IBOutlet weak var rightButton: UIButton!
    @IBOutlet weak var leftButton: UIButton!
    @IBOutlet weak var downButton: UIButton!
    @IBOutlet weak var boxButton: UIButton!
    
    var player: Person!
    var labyrinth: Labyrinth!

    var stepsLabel: UILabel!
    var keyButton: UIButton!
    var stoneButton: UIButton!
    var boneButton: UIButton!
    var chestButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
   
        self.labyrinth = Labyrinth()
        self.player = Person()
        

        createButtons()
        loadRoom()
        
        let doubleTap = UITapGestureRecognizer(target: self, action: #selector(dropStone))
        doubleTap.numberOfTapsRequired = 2
        stoneButton.addGestureRecognizer(doubleTap)
    }
    

    @IBAction func upPressed(_ sender: UIButton) {
        self.player.go(to: .north)
        loadRoom()
        gameCheck()
        print(player.x, player.y)
        print(labyrinth.numberOfRoom)

    }
    
    @IBAction func leftPressed(_ sender: UIButton) {
        self.player.go(to: .west)
        loadRoom()
        gameCheck()
        print(player.x, player.y)
        
    }
    
    
    @IBAction func downPressed(_ sender: UIButton) {
        self.player.go(to: .south)
        loadRoom()
        gameCheck()
        print(player.x, player.y)
        
    }
    
    @IBAction func rightPressed(_ sender: UIButton) {
        self.player.go(to: .east)
        loadRoom()
        gameCheck()
        print(player.x, player.y)
        
        
    }
    
    
    @IBAction func boxPressed(_ sender: UIButton) {
        if self.player.haveItem(itemInInvertory: .key) {
            self.performSegue(withIdentifier: "GameToEnd", sender: true)
        }
        
    }
    
    @IBAction func keyButtonPressed(_ sender: UIButton) {
        keyButton.frame = CGRect(x: 80, y: 782, width: 65, height: 65)
        let thisRoom = self.labyrinth.labyrinthMatrix[self.player.x][self.player.y]
        self.player.get(.key)
        thisRoom.playerGet(.key)
//        loadButton()
//        setUpInventory(in: thisRoom)
        
    }
    @IBAction func boneButtonPressed(_ sender: UIButton) {
        boneButton.frame = CGRect(x: 160, y: 782, width: 65, height: 65)
        let thisRoom = self.labyrinth.labyrinthMatrix[self.player.x][self.player.y]
        self.player.get(.bone)
        thisRoom.playerGet(.bone)
//        loadButton()
//        setUpInventory(in: thisRoom)
        
    }
    
    @IBAction func stoneButtonPressed(_ sender: UIButton) {
        stoneButton.frame = CGRect(x: 240, y: 782, width: 65, height: 65)
        let thisRoom = self.labyrinth.labyrinthMatrix[self.player.x][self.player.y]
        self.player.get(.stone)
        thisRoom.playerGet(.stone)
       setUpInventory(in: thisRoom)
        
    }
    
    @IBAction func chestButtonPressed(_ sender: UIButton) {
        if player.haveItem(itemInInvertory: .key) {
            
            self.performSegue(withIdentifier: "GameToEnd", sender: true)
            
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let controller = segue.destination as? EndViewController {
            controller.isWin = sender! as? Bool
        }
    }
    
    
    @objc
    func dropStone() {
        let thisRoom = self.labyrinth.labyrinthMatrix[self.player.x][self.player.y]
        
        thisRoom.playerDrop(.stone)
        self.player.drop(.stone)
        setUpInventory(in: thisRoom)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }

    
}

