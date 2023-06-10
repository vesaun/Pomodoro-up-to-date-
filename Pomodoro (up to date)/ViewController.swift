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
        view.backgroundColor = UIColor(white: 0.94, alpha: 1.0)
        drawBgShape()
        drawTimeLeftShape()
        addTimeLabel()
        // here you define the fromValue, toValue and duration of your animation
        strokeIt.fromValue = 0
        strokeIt.toValue = 1
        strokeIt.duration = timeLeft
        // add the animation to your timeLeftShapeLayer
        timeLeftShapeLayer.add(strokeIt, forKey: nil)
        // define the future end time by adding the timeLeft to now Date()
        endTime = Date().addingTimeInterval(timeLeft)
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(updateTime), userInfo: nil, repeats: true)
    }
    
    @IBOutlet weak var timer_display: UILabel!
    
    @IBOutlet weak var button: UIButton!
    
    var time_remaining =  10 * 60
    var timer = Timer()
    var isPaused = true
    var pause = UIImage(named: "pause_button.png")
    var play = UIImage(named: "play_button.png")
    
    //Vesaun's progress bar
    //---------------------------------------//
    
    let timeLeftShapeLayer = CAShapeLayer()
    let bgShapeLayer = CAShapeLayer()
    var timeLeft: TimeInterval = 10 * 60
    var endTime: Date?
    var timeLabel =  UILabel()
    // here you create your basic animation object to animate the strokeEnd
    let strokeIt = CABasicAnimation(keyPath: "strokeEnd")

    func drawBgShape() {
        bgShapeLayer.path = UIBezierPath(arcCenter: CGPoint(x: view.frame.midX , y: view.frame.midY), radius:
            100, startAngle: -90.degreesToRadians, endAngle: 270.degreesToRadians, clockwise: true).cgPath
        bgShapeLayer.strokeColor = UIColor.white.cgColor
        bgShapeLayer.fillColor = UIColor.clear.cgColor
        bgShapeLayer.lineWidth = 15
        view.layer.addSublayer(bgShapeLayer)
    }
    func drawTimeLeftShape() {
        timeLeftShapeLayer.path = UIBezierPath(arcCenter: CGPoint(x: view.frame.midX , y: view.frame.midY), radius:
            100, startAngle: -90.degreesToRadians, endAngle: 270.degreesToRadians, clockwise: true).cgPath
        timeLeftShapeLayer.strokeColor = UIColor.red.cgColor
        timeLeftShapeLayer.fillColor = UIColor.clear.cgColor
        timeLeftShapeLayer.lineWidth = 15
        view.layer.addSublayer(timeLeftShapeLayer)
    }
    
    func addTimeLabel() {
        timeLabel = UILabel(frame: CGRect(x: view.frame.midX-50 ,y: view.frame.midY-25, width: 100, height: 50))
        timeLabel.textAlignment = .center
        timeLabel.text = timeLeft.time
        view.addSubview(timeLabel)
    }
    
    @objc func updateTime() {
        if timeLeft > 9*60 {
            timeLeft = endTime?.timeIntervalSinceNow ?? 0
            timeLabel.text = timeLeft.time
        } else {
            timeLabel.text = "00:00"
            timer.invalidate()
        }
    }

    
    
    //---------------------------------------//
    
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
            button.setImage(pause, for: .normal)
        }
        else
        {
            endTimer()
            isPaused = true
            button.setImage(play, for: .normal)
        }
    }
    
    
    
}

extension TimeInterval {
    var time: String {
        return String(format:"%02d:%02d", Int(self/60),  Int(ceil(truncatingRemainder(dividingBy: 60))) )
    }
}
extension Int {
    var degreesToRadians : CGFloat {
        return CGFloat(self) * .pi / 180
    }
}
    

    


