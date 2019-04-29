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
    
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var button4: UIButton!
    @IBOutlet weak var button5: UIButton!
    @IBOutlet weak var button6: UIButton!
    @IBOutlet weak var button7: UIButton!
    @IBOutlet weak var button8: UIButton!
    
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var label3: UILabel!
    @IBOutlet weak var label4: UILabel!
    
    @IBOutlet weak var image1: UIImageView!
    @IBOutlet weak var image2: UIImageView!
    @IBOutlet weak var image3: UIImageView!
    @IBOutlet weak var image4: UIImageView!
    
    @IBOutlet weak var livesLabel: UILabel!
    
    var i = 0
    var j = 0
    var k = 0
    var l = 0
    
    
    var checkArray: [String] = [""]
    
    let easyArr: [String] = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"]
    let medArr: [String] = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j"]
    let hardArr: [String] = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "a", "b", "c", "d", "e", "f", "g", "h", "i", "j"]
    var custArr: [String] = [""]
    
    var answerArr: [String] = ["", "", "", ""]
    
    var screenArr: [String] = ["", "", "", ""]
    var difficulty: Int = 0
    var difficultyLabel: String = ""
    var timeTaken: Float = 0.0
    var triesTaken: Int = 0
    var lives: Int = 5
    var curLives: Int = 5
    var completed: Int = 0
    var vicResult: Bool = false
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        livesLabel.text = "Lives: \(curLives) / \(lives)"

        //Populate answerArr
        answerGenerator(diff: difficulty)
        printAnswerArr()
        
        //Main Game Function call
        
    }
    func setAllRed(){
        image1.image = UIImage(named: "red")
        image2.image = UIImage(named: "red")
        image3.image = UIImage(named: "red")
        image4.image = UIImage(named: "red")
    }
    func setZeros(){
        label1.text = checkArray[0]
        label2.text = checkArray[0]
        label3.text = checkArray[0]
        label4.text = checkArray[0]
    }
    func answerGenerator(diff: Int) {
        switch diff {
        case 0:
            randomizer(poolSet: easyArr)
            difficultyLabel = "Easy"
        case 1:
            randomizer(poolSet: medArr)
            difficultyLabel = "Medium"
        case 2:
            randomizer(poolSet: hardArr)
            difficultyLabel = "Hard"
        case 3:
            randomizer(poolSet: custArr)
            difficultyLabel = "Custom"
        default:
            print("Error- Randomizer(): Incorrect difficulty")
        }
         checkArray = checkDif()
         setZeros()
    }
    
    func checkDif()->[String]{
        if difficulty == 0{
            return easyArr
        }
        else if difficulty == 1{
            return medArr
        }
        else if difficulty == 2 {
            return hardArr
        }
        else{
            return custArr
        }
    }
    func resetIfWin(){
        //var dif = checkDif()
        answerGenerator(diff: difficulty)
        setAllRed()
        
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
    
    func mainGameLoop() {
    
    }

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.destination is ResultsMenu {
            let vc = segue.destination as? ResultsMenu
            vc?.answerSet = answerArr
            vc?.timeLabelText = String(timeTaken)
            vc?.difficultyLabelText = difficultyLabel
            vc?.triesLabelText = String(triesTaken)
            vc?.livesLabelText = String(lives)
            vc?.victoryResult = vicResult
        }
    }
    
    func goUpL(_ counter: inout Int, label: UILabel, num: Int) {
        if counter == checkArray.count - 1{
            counter = 0
        }
        else{
        counter = counter + 1
        }

        label.text = checkArray[counter]
    }
    
    func goDownL(_ counter: inout Int, label: UILabel, num: Int) {
        if counter == 0{
            counter = checkArray.count - 1
        }
        else{
        counter = counter - 1
            
        }
        label.text = checkArray[counter]
    }
    
    @IBAction func oddButtonPressed(_ sender: UIButton) {
        
        switch sender.tag{
        case button1.tag:
            goUpL(&i, label: label1, num: 0)
        case button3.tag:
            goUpL(&j, label: label2, num: 1)
        case button5.tag:
            goUpL(&k, label: label3,num: 2)
        case button7.tag:
            goUpL(&l, label: label4, num: 3)
        default:
            print("O")
        }
    }
    
    @IBAction func evenButtonPressed(_ sender: UIButton) {
        
        switch sender.tag{
        case button2.tag:
            goDownL(&i, label: label1, num: 0)
        case button4.tag:
            goDownL(&j, label: label2, num: 1)
        case button6.tag:
            goDownL(&k, label: label3, num: 2)
        case button8.tag:
            goDownL(&l, label: label4, num: 3)
        default:
            print("E")
        }
    }
    
    func checkColor(){
        //var labelArr: [UIImageView] = [image1,image2,image3,image4]
        var imgNum : UIImageView?
        for x in 0...3{
            switch x{
            case 0:
                imgNum = image1
            case 1:
                imgNum = image2
            case 2:
                imgNum = image3
            case 3:
                imgNum = image4
            default:
                print("???")
            }
            
            if (answerArr[x] == screenArr[x]){
                imgNum?.image = UIImage(named: "green")
            }
            else if(answerArr.contains(screenArr[x])){
                imgNum?.image = UIImage(named: "yellow")
            }
            else{
                imgNum?.image = UIImage(named: "red")
            }
        }
    }
    
    func isAllGreen()->Bool{
        if answerArr == screenArr {
            return true
        }
        else{
            return false
        }
    }
    
    @IBAction func checkAnswer(_ sender: UIImageView) {
        triesTaken += 1
       
        
        
        screenArr = [label1.text,label2.text,label3.text,label4.text] as! [String]
        print(screenArr)
        checkColor()
        var winner = isAllGreen()
        if winner == true {
            livesLabel.text = "Lives: \(curLives) / \(lives) Tries:\(triesTaken) Completed:\(completed)"
            if curLives >= lives {
                vicResult = true
                completed = completed + 1
                resetIfWin()
                
            }
            
            print("WINNER")
        }
        else {
            vicResult = false
            curLives = curLives - 1
            if curLives == 0{
                self.performSegue(withIdentifier: "segue", sender: nil)
            }
            livesLabel.text = "Lives: \(curLives) / \(lives)"
            print(curLives)
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
     
     else if(screenArr.contains(answerArr[x])){
     imgNum?.image = UIImage(named: "yellow")
    */

}
