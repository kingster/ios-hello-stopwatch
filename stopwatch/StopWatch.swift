//
//  StopWatch.swift
//  stopwatch
//
//  Created by Kinshuk  Bairagi on 06/08/16.
//  Copyright © 2016 Kinshuk. All rights reserved.
//

import Foundation


protocol StopWatchDelegate : AnyObject {
    func stopWatchTick(let string:String)
    func stopWatchDidStart()
    func stopWatchDidStop()
}

class StopWatch {
    
    var elapsedTimeSoFar : NSTimeInterval = 0
    var startTime : NSTimeInterval = 0
    weak var delegate:StopWatchDelegate?
    
    func start(date:NSDate) {
        self.startTime = date.timeIntervalSinceReferenceDate
        self.delegate?.stopWatchDidStart()
        updateDelegate(date)
    }
    
    func  elapsed(date:NSDate) -> NSTimeInterval {
        return date.timeIntervalSinceReferenceDate - self.startTime
    }
    
    func displayString(time:NSTimeInterval) -> String {
        return "\(round(time * 10) / 10) sec"
    }
    
    func tick(date:NSDate) {
       updateDelegate(date)
    }
    
    func stop(date:NSDate) {
        updateDelegate(date)
        self.delegate?.stopWatchDidStop()
        elapsedTimeSoFar = elapsedTimeSoFar + elapsed(date)
    }
    
    func updateDelegate(date:NSDate) {
         self.delegate?.stopWatchTick(displayString(elapsed(date)+elapsedTimeSoFar))
    }
    
}