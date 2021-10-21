//
//  ViewController.swift
//  Traffic Lights
//
//  Created by Илья Маркелов on 19.10.2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var redLabel: UILabel!
    @IBOutlet var yellowLabel: UILabel!
    @IBOutlet var greenLabel: UILabel!
    @IBOutlet var actionButton: UIButton!
    
    enum Colors {
        case red, yellow, green
    }
    
    private var currentColor = Colors.red
    private var activeColorOn = 1
    private var activeColorOff = 0.3
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        actionButton.layer.cornerRadius = 10
        
//        redLabel.layer.masksToBounds = true
        redLabel.layer.cornerRadius = redLabel.frame.height / 2
        redLabel.clipsToBounds = true
        
        yellowLabel.layer.masksToBounds = true
        yellowLabel.layer.cornerRadius = yellowLabel.frame.height / 2

        greenLabel.layer.masksToBounds = true
        greenLabel.layer.cornerRadius = greenLabel.frame.height / 2
    }

    @IBAction func moveColor() {
        actionButton.setTitle("NEXT", for: .normal)
            
        switch currentColor {
        case .red:
            greenLabel.alpha = activeColorOff
            redLabel.alpha = CGFloat(activeColorOn)
            currentColor = .yellow
        case .yellow:
            redLabel.alpha = activeColorOff
            yellowLabel.alpha = CGFloat(activeColorOn)
            currentColor = .green
        case .green:
            yellowLabel.alpha = activeColorOff
            greenLabel.alpha = CGFloat(activeColorOn)
            currentColor = .red
        }
    }
}

