//
//  PlayGame.swift
//  MasterMind
//
//  Created by Christopher Torrecampo on 4/11/19.
//  Copyright © 2019 Glenville Pecor. All rights reserved.
//

import UIKit

class PlayGame: UIViewController {

    /*
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }*/
    
    var difficulty: Int = 0
    let easySet: Set = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"]
    let medSet: Set = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j"]
    let hardSet: Set = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "a", "b", "c", "d", "e", "f", "g", "h", "i", "j"]
    var answerSet: Set<String> = ["", "", "", ""]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print (difficulty)
        
        //Switch Function call
        //Answer Function call
        
        //Main Game Function call
    }
    
    func randomizer() {
        
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
