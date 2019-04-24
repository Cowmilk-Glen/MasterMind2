//
//  CustomMenu.swift
//  MasterMind
//
//  Created by Christopher Torrecampo on 4/24/19.
//  Copyright © 2019 Glenville Pecor. All rights reserved.
//

import UIKit

class CustomMenu: UIViewController {
    
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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
