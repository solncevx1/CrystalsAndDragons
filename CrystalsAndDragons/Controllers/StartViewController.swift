//
//  StartViewController.swift
//  CrystalsAndDragons
//
//  Created by Максим Солнцев on 10/7/20.
//

import UIKit

class StartViewController: UIViewController {

    @IBOutlet weak var numberOfRoomsTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
      
    }
    

    @IBAction func startButtonAction(_ sender: UIButton) {
        
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let controller = segue.destination as? ViewController {
            let numberOfRooms: Int = Int(numberOfRoomsTextField.text!) ?? 5
            controller.labyrinth.numberOfRoom = numberOfRooms
        }
    }

}


