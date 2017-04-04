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
    
    @IBOutlet weak var bottomConstraint: UIView!
    
    @IBOutlet weak var topConstraint: UIView!
    
    var score = 0 {
        didSet {
            guard let viewHeight = view?.frame.height else {
                return
            }
//            let availableSpace: CGFloat = viewHeight - 2
//                * padding
//            topConstraint.constant =
//                max(min(viewHeight, CGFloat(score) /
//                    CGFloat(maxScore) *
//                    availableSpace +
//                    padding), 0)
//            
//            bottomConstraint.constant =
//                max(min(CGFloat(maxScore-score) /
//                    CGFloat(maxScore) *
//                    availableSpace +
//                    padding, viewHeight), 0)
            
            UIView.animate(withDuration: 0.3,
                           delay: 0,
                           options: .allowUserInteraction,
                           animations: {
                            self.view.layoutIfNeeded() }, completion: nil)
        }
        
        
        
        
    }
    
    func newGame() {
        
        // reset scores
        score = maxScore / 2
        
        // show scores and fade out
        topScoreLabel.alpha = 1
        bottomScoreLabel.alpha = 1
        UIView.animate(withDuration: 2) {
            self.topScoreLabel.alpha = 0
            self.bottomScoreLabel.alpha = 0
        }
        let stepTime: TimeInterval = 0.5
        self.countdownLabel.alpha = 1
        self.countdownLabel.text = "3"
        UIView.animate(withDuration: stepTime, animations: {
            self.countdownLabel.alpha = 0
        }, completion: { _ in
            self.countdownLabel.alpha = 1
            self.countdownLabel.text = "2"
            
            UIView.animate(withDuration: stepTime, animations: {
                self.countdownLabel.alpha = 0
            }, completion: { _ in
                self.countdownLabel.alpha = 1
                self.countdownLabel.text = "1"
                
                UIView.animate(withDuration: stepTime, animations: {
                    self.countdownLabel.alpha = 0
                }, completion: { _ in
                    self.countdownLabel.alpha = 1
                    self.countdownLabel.text = "GO!"
                    
                    UIView.animate(withDuration: stepTime, animations: {
                        self.countdownLabel.alpha = 0
                    }, completion: { _ in
                        self.gameOn = true
                    })
                })
            })
        })
    }
    
    @IBAction func didTapView(_ gestureRecognizer: UITapGestureRecognizer) {
        guard let sender = gestureRecognizer.view else {
            print("no view on gesture recognizer!")
            return
        }
        
        //ignore taps unless gameOn
        guard gameOn else { return }
        
        //update score difference
        if sender.tag == 0 {
            score += 1
        } else {
            score -= 1
        }
        
        //check if Green wins
        
        if score > maxScore {
            print("Top Wins")
            topScore += 1
            gameOn = false
            newGame()
        }
        
        //check if Red wins
        if score < 0 {
            print("Bottom Wins")
            bottomScore += 1
            gameOn = false
            newGame()
        }
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
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
    
    var padding: CGFloat = 70
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //reset match score
        topScore = 0
        bottomScore = 0
        
        //start a new game
        newGame()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

