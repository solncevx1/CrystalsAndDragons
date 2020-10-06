//
//  EndViewController.swift
//  CrystalsAndDragons
//
//  Created by Максим Солнцев on 10/5/20.
//

import UIKit

class EndViewController: UIViewController {

    @IBOutlet weak var winImage: UIImageView!
    @IBOutlet weak var newGameButton: UIButton!
    var isWin: Bool!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if isWin {
            winImage.image = UIImage(named: "win")
        } else {
            winImage.image = UIImage(named: "lose")
        }

    }
    

    @IBAction func newGamePressed(_ sender: UIButton) {
        
        
        
    }
    

}
