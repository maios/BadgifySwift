//
//  ViewController.swift
//  Demo
//
//  Created by Mai Mai on 2/6/18.
//  Copyright © 2018 maimaios. All rights reserved.
//

import UIKit
import BadgifySwift

fileprivate let swiftColor = UIColor(red: 223/255, green: 92/255, blue: 67/255, alpha: 1)

class ViewController: UIViewController {
    
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
                self.badgeView.badgeValue = 1
                self.stepper.isHidden = false
            case 1:
                self.badgeView.badgeImage = #imageLiteral(resourceName: "cc_logo")
                self.stepper.isHidden = true
            default: break
        }
    }
}

