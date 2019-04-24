//
//  ResultsMenu.swift
//  MasterMind
//
//  Created by Christopher Torrecampo on 4/11/19.
//  Copyright © 2019 Glenville Pecor. All rights reserved.
//

import UIKit

class ResultsMenu: UIViewController {
    
    @IBOutlet weak var answerSetLabel: UILabel!
    @IBOutlet weak var timeTakenLabel: UILabel!
    @IBOutlet weak var difficultyLabel: UILabel!
    @IBOutlet weak var triesLabel: UILabel!
    @IBOutlet weak var livesLabel: UILabel!
    @IBOutlet weak var victoryLabel: UILabel!
    @IBOutlet weak var defeatLabel: UILabel!
    
    var answerSet: [String] = ["", "", "", ""]
    var answerLabelText: String = ""
    var timeLabelText: String = ""
    var difficultyLabelText: String = ""
    var triesLabelText: String = ""
    var livesLabelText: String = ""
    var victoryResult: Bool = false
    
    func printAnswerArr() {
        for i in 0..<4 {
            print(answerSet[i])
            answerLabelText += answerSet[i]
        }
    }
    
    func resultsPrinter() {
        if victoryResult == false {
            victoryLabel.isHidden = true
            defeatLabel.isHidden = false
        }
        else {
            victoryLabel.isHidden = false
            defeatLabel.isHidden = true
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        printAnswerArr()
        resultsPrinter()
        answerSetLabel.text = answerLabelText
        timeTakenLabel.text = timeLabelText
        difficultyLabel.text = difficultyLabelText
        triesLabel.text = triesLabelText
        livesLabel.text = livesLabelText
        // Do any additional setup after loading the view.
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
