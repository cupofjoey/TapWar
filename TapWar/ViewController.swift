//
//  ViewController.swift
//  TapWar
//
//  Created by Joseph (Joe) Hill on 3/30/17.
//  Copyright © 2017 Dumb Unicorn. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var greenView: UIView!
    
    @IBOutlet weak var redView: UIView!
    
    @IBOutlet weak var topScoreLabel: UILabel!
    
    @IBOutlet weak var bottomScoreLabel: UILabel!
    
    @IBOutlet weak var countdownLabel: UILabel!
    
    //match scores
    
    var topScore = 0 {
        didSet {
            topScoreLabel?.text = "\(topScore)"
        }
    }
    

    
    var bottomScore = 0 {
        didSet {
            bottomScoreLabel?.text = "\(bottomScore)"
        }
    }
    
    let maxScore = 20
    
    var gameOn = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

