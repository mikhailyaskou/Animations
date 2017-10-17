//
//  YMAAnimatedRoadViewController.swift
//  Animations
//
//  Created by Mikhail Yaskou on 16.10.17.
//  Copyright © 2017 Mikhail Yaskou. All rights reserved.
//

import UIKit

class YMAAnimatedRoadViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let planeLayer = CALayer()
        planeLayer.contents = UIImage(named: "Airplane")?.cgImage
        planeLayer.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
        self.view.layer.addSublayer(planeLayer)
       
        let path = CGMutablePath()
        path.move(to: CGPoint(x: 50, y: 50))
        path.addCurve(to: CGPoint(x: 150, y: 150), control1: CGPoint(x: 50, y: 120), control2: CGPoint(x: 75, y: 145))
        path.addQuadCurve(to: CGPoint(x: 300, y: 100), control: CGPoint(x:255, y: 155))
        path.addQuadCurve(to: CGPoint(x: 400, y: 100), control: CGPoint(x:380, y: 10))
        path.addQuadCurve(to: CGPoint(x: 370, y: 500), control: CGPoint(x:425, y: 427))
        path.addQuadCurve(to: CGPoint(x: 50, y: 300), control: CGPoint(x:200, y: 700))
        path.addQuadCurve(to: CGPoint(x: 10, y: 50), control: CGPoint(x:0, y: 170))
        path.addQuadCurve(to: CGPoint(x: 50, y: 50), control: CGPoint(x:30, y: -50))

        let shapeLayer = CAShapeLayer()
        shapeLayer.path = path
        shapeLayer.lineWidth = 3.0
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.strokeColor = UIColor.black.cgColor
        self.view.layer.addSublayer(shapeLayer)

        let animation = CAKeyframeAnimation(keyPath: "position")
        animation.calculationMode = kCAAnimationLinear
        animation.path = path
        animation.rotationMode = kCAAnimationRotateAuto
        animation.repeatCount = Float.greatestFiniteMagnitude
        animation.duration = 3.0
        planeLayer.add(animation, forKey: "KeyFrameMovement")
    }

}
