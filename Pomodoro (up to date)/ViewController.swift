//
//  ViewController.swift
//  Pomodoro (up to date)
//
//  Created by Vesaun Shrestha on 5/15/23.
//

import UIKit

class ViewController: UIViewController {
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBOutlet weak var play: UIButton!
    
    @IBOutlet weak var timer_display: UILabel!
    var secondsRemaining = 10*60 - 1
    
    @IBOutlet weak var inspo_messages: UITextField!
    
    let msgs = ["All our dreams can come true, if we have the courage to pursue them.” —Walt Disney", "The secret of getting ahead is getting started. —Mark Twain", "I’ve missed more than 9,000 shots in my career. I’ve lost almost 300 games. 26 times I’ve been trusted to take the game winning shot and missed. I’ve failed over and over and over again in my life, and that is why I succeed. —Michael Jordan", "Don’t limit yourself. Many people limit themselves to what they think they can do. You can go as far as your mind lets you. What you believe, remember, you can achieve. —Mary Kay Ash", "The best time to plant a tree was 20 years ago. The second best time is now. ―Chinese Proverb"]
    
    
    
    @IBAction func buttonPressed(_ sender: Any)
    {
        Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { (Timer) in
            if self.secondsRemaining > 0 {
                 
                let _minutes = String(self.secondsRemaining / 60)
                let _seconds = String(self.secondsRemaining % 60)
                self.secondsRemaining -= 1
                self.timer_display.text = _minutes + ":" + _seconds
            } else {
                Timer.invalidate()
            }
        }
    }
    
    }
    

    


