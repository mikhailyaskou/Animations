//
//  YMAJalousieEffectViewController.swift
//  Animations
//
//  Created by Mikhail Yaskou on 17.10.17.
//  Copyright © 2017 Mikhail Yaskou. All rights reserved.
//

import UIKit

class YMAJalousieEffectViewController: UIViewController {


    override func viewDidLoad() {
        super.viewDidLoad()
        //number of pieces jalousie
        let numberOfPieces = 10
        let image = UIImage(named: "iphonex.png")
        var slicedImages: [CGImage] = []
        let pieceWidth = image!.size.width / CGFloat(numberOfPieces)
        var x: CGFloat = 0;
        for _ in 1...numberOfPieces {
            let cropRect = CGRect(x: x, y: 0, width: pieceWidth, height: image!.size.height)
            slicedImages.append(image!.cgImage!.cropping(to: cropRect)!)
            x += pieceWidth;
        }

        let cropViewSize = self.view.bounds.size.width / CGFloat(numberOfPieces)
        var slicedLayers: [CALayer] = []
        x = 0;
        for index in 1...numberOfPieces {
            let layer = CALayer()
            layer.frame = CGRect(x: x, y: 0, width: cropViewSize, height: self.view.bounds.size.height)
            layer.contents = slicedImages[index - 1]
            x += cropViewSize
            slicedLayers.append(layer)
            animation(layer: layer)
        }
    }

    private func animation(layer: CALayer) {
        self.view.layer.addSublayer(layer)
        let theAnimation = CABasicAnimation(keyPath: "position");
        theAnimation.fromValue = [0, layer.position.y]
        theAnimation.toValue = [layer.position.x, layer.position.y]
        theAnimation.duration = 3;
        layer.add(theAnimation, forKey: "animatePosition")
    }

}

