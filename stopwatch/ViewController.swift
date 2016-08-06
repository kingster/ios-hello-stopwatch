//
//  ViewController.swift
//  stopwatch
//
//  Created by Kinshuk  Bairagi on 06/08/16.
//  Copyright © 2016 Kinshuk. All rights reserved.
//

import UIKit


class ViewController: UIViewController, StopWatchDelegate {

    @IBOutlet weak var timeLabel: UILabel!
    var timer : NSTimer?
    var stopwatch = StopWatch()
    
    @IBOutlet weak var button: UIButton!
    
    @IBAction func buttonTapped(sender: AnyObject) {
        
        if self.timer != nil {
            self.timer?.invalidate()
            self.stopwatch.stop(NSDate())
            self.timer = nil
        } else {
            self.timer = NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: #selector(tick), userInfo: nil, repeats: true)
            self.stopwatch.start(NSDate())
        }
        
    }
    
    func tick()  {
       self.stopwatch.tick(NSDate())
    }
    
    func stopWatchDidStart() {
        self.button.backgroundColor = UIColor.greenColor()
        self.button.setTitle("Stop", forState: .Normal)
    }
    func stopWatchDidStop() {
        self.button.backgroundColor = UIColor.redColor()
        self.button.setTitle("Start", forState: .Normal)
    }

    
    func stopWatchTick(let string:String){
        self.timeLabel.text = string
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.stopwatch.delegate = self
        self.button.layer.cornerRadius = self.button.frame.width/2
        self.button.backgroundColor = UIColor.redColor()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

