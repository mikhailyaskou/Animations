//
//  YMAScaleCartButtonViewController.swift
//  Animations
//
//  Created by Mikhail Yaskou on 16.10.17.
//  Copyright © 2017 Mikhail Yaskou. All rights reserved.
//

import UIKit

class YMAScaleCartButtonViewController: UIViewController {

    @IBOutlet weak var item: UIButton!
    @IBOutlet weak var cart: UIImageView!
    
    @IBAction func itemTapped(_ sender: UIButton) {
        
        UIView.animate(withDuration: 0.6, animations: {
            sender.transform = CGAffineTransform(scaleX: 2, y: 2)
        },
                       completion:
            { _ in
                UIView.animate(withDuration: 0.6, animations: {
                    sender.center = self.cart.center
                },
                               completion:
                    { _ in
                        UIView.animate(withDuration: 0.6){
                            sender.transform = CGAffineTransform.identity
                            self.item.alpha = 0;
                        }
                })
        })
        
    }
    
}
