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
    
    var answerSet: [String] = ["", "", "", ""]
    var answerLabelText: String = ""
    
    func printAnswerArr() {
        for i in 0..<4 {
            print(answerSet[i])
            answerLabelText += answerSet[i]
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        printAnswerArr()
        answerSetLabel.text = answerLabelText
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
