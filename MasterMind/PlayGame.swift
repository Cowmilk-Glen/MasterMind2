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
    let easyArr: [String] = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"]
    let medArr: [String] = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j"]
    let hardArr: [String] = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "a", "b", "c", "d", "e", "f", "g", "h", "i", "j"]
    var answerArr: [String] = ["", "", "", ""]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //Populate answerArr
        answerGenerator(diff: difficulty)
        printAnswerArr()
        //Main Game Function call
    }
    
    func answerGenerator(diff: Int) {
        switch diff {
        case 0:
            randomizer(poolSet: easyArr)
        case 1:
            randomizer(poolSet: medArr)
        case 2:
            randomizer(poolSet: hardArr)
        default:
            print("Error- Randomizer(): Incorrect difficulty")
        }
    }
    
    func randomizer(poolSet: [String]) {
        for i in 0..<4 {
            answerArr[i] = poolSet[Int.random(in: 0..<poolSet.count)]
        }
    }
    
    //Utility
    func printAnswerArr() {
        for i in 0..<4 {
            print(answerArr[i])
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
