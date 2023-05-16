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
    @IBOutlet weak var timer_display: UILabel!
    
    @IBOutlet weak var button: UIButton!
    var time_remaining =  10 * 60
    var timer = Timer()
    var isPaused = true
    
    func startTimer()
    {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(countdown), userInfo: nil, repeats: true)
        
    }
    
    func endTimer()
    {
        timer.invalidate()
    }
    
    @objc func countdown()
    {
        if time_remaining > 0
        {
            time_remaining -= 1
        }
        else
        {
            endTimer()
        }
            let _minutes = String(time_remaining / 60)
            let _seconds = String(time_remaining % 60)
            timer_display.text = _minutes + ":" + _seconds
        
        
    }
    
    @IBAction func playPause(_ sender: Any)
    {
        if isPaused == true
        {
            startTimer()
            isPaused = false
        }
        else
        {
            endTimer()
            isPaused = true
        }
    }
    
    
    
    }
    

    


