//
//  ViewController.swift
//  MasterMind
//
//  Created by Glenville Pecor on 4/4/19.
//  Copyright © 2019 Glenville Pecor. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var audio = AVAudioPlayer()

    override func viewDidLoad() {
        super.viewDidLoad()
        do{
            audio = try AVAudioPlayer(contentsOf: URL.init(fileURLWithPath: Bundle.main.path(forResource: "bensound-theelevatorbossanova", ofType: "mp3")!))
        }
        catch{
            print(error)
        }
        audio.play()
        
    }


}

