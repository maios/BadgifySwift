//
//  ViewController.swift
//  Demo
//
//  Created by Mai Mai on 2/6/18.
//  Copyright © 2018 maimaios. All rights reserved.
//

import UIKit
import BadgifySwift

class ViewController: UIViewController {
    
    private static let swiftColor = UIColor(red: 223/255, green: 92/255, blue: 67/255, alpha: 1)
    
    @IBOutlet private weak var badgedView: UIImageView!
    
    @IBOutlet weak var stepper: UIStepper!
    
    private let badgeView: BadgeView = {
        let view = BadgeView()
        view.badgeValue = 1
        view.backgroundColor = .white
        view.textColor = swiftColor
        view.badgeFont = .systemFont(ofSize: 14)
        view.minBadgeSize = CGSize(width: 25, height: 25)
        view.xOffset = 5
        view.yOffset = 5
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        badgedView.addSubview(badgeView)
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        badgeView.badgeValue = Int(sender.value)
    }
    
    @IBAction func segmentedControlValueChanged(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
            case 0:
                badgeView.badgeValue = 1
                stepper.isHidden = false
            case 1:
                badgeView.badgeImage = #imageLiteral(resourceName: "cc_logo")
                stepper.isHidden = true
            default: break
        }
    }
}

