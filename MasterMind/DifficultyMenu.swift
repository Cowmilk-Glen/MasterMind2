//
//  DifficultyMenu.swift
//  MasterMind
//
//  Created by Christopher Torrecampo on 4/11/19.
//  Copyright © 2019 Glenville Pecor. All rights reserved.
//

import UIKit

class DifficultyMenu: UIViewController {
    
    var chosenDiff : Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.destination is PlayGame {
            let vc = segue.destination as? PlayGame
            vc?.difficulty = chosenDiff
        }
    }
    
    @IBAction func easyButtonPress(_ sender: Any) {
        chosenDiff = 0
    }
    
    @IBAction func medButtonPress(_ sender: Any) {
        chosenDiff = 1
    }
    
    @IBAction func hardButtonPress(_ sender: Any) {
        chosenDiff = 2
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
