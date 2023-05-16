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
    

    


