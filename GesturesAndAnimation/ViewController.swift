//
//  ViewController.swift
//  GesturesAndAnimation
//
//  Created by David Svensson on 2020-01-17.
//  Copyright © 2020 David Svensson. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var doubleTapRecognizer: UITapGestureRecognizer!
    @IBOutlet var singleTapRecognizer: UITapGestureRecognizer!
    @IBOutlet weak var gestureNameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // let tap wait for doubletap to fail
        singleTapRecognizer.require(toFail: doubleTapRecognizer)
    }
    
    // Handle single tap
    @IBAction func singleTap(_ sender: UITapGestureRecognizer) {
        showGesture(name: "Tap")
        
    }
    
    //handle double tap
    @IBAction func doubleTap(_ sender: UITapGestureRecognizer) {
        showGesture(name: "Double Tap")
    }
    
    
    
    func showGesture(name: String) {
        gestureNameLabel.text = name
        
        UIView.animate(withDuration: 1.0, animations: {self.gestureNameLabel.alpha = 1.0},
                       completion: makeLabelInviceble(finished:) )
    }
    

    func makeLabelInviceble(finished: Bool) {
        UIView.animate(withDuration: 1.0, animations: {self.gestureNameLabel.alpha = 0.0})
    }
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        if motion == .motionShake {
            showGesture(name: "Shake")
        }
    }
    
}

