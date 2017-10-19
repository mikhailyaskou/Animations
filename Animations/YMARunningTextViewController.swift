//
//  YMARunningTextViewController.swift
//  Animations
//
//  Created by Mikhail Yaskou on 16.10.17.
//  Copyright © 2017 Mikhail Yaskou. All rights reserved.
//

import UIKit

class YMARunningTextViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let label = UILabel.init(frame: self.view.frame)
        label.text = "iMac Pro Power to the pro. iMac The vision is brighter than ever. MacBook Pro A touch of genius.";
        label.frame.size.width = 1600;
        label.frame.origin.x = self.view.bounds.maxX
        self.view.addSubview(label);
        runText(targetView: label, duration: 30)
    }
    
    private func runText(targetView: UIView, duration: Double) {
        UIView.animate(withDuration: duration, delay: 0.0, options: .curveLinear, animations: {
             targetView.frame.origin.x = 0 - targetView.bounds.size.width/2
        }) { finished in
            targetView.frame.origin.x = self.view.bounds.maxX
            self.runText(targetView: targetView, duration: duration)
        }
    }
    
}
