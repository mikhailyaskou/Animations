//
//  YMAPlanetsViewController.swift
//  Animations
//
//  Created by Mikhail Yaskou on 14.10.17.
//  Copyright © 2017 Mikhail Yaskou. All rights reserved.
//

import UIKit

class YMAPlanetsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let orbit1 = createOrbitView(diameter: 150, color: UIColor.red);
        self.view.addSubview(orbit1)
        orbit1.center = self.view.center
        let planet1: UIView = createPlanetView(color: UIColor.blue)
        addPlanetViewToOrbitView(orbit: orbit1, planet: planet1)
        rotateView(targetView: orbit1, duration: 6)

        let orbit2: UIView = createOrbitView(diameter: 100, color: UIColor.green);
        addOrbitViewToPlanetView(planet: planet1, orbit: orbit2)
        let planet2: UIView = createPlanetView(color: UIColor.black)
        addPlanetViewToOrbitView(orbit: orbit2, planet: planet2)
        rotateView(targetView: orbit2, duration: 3)

        let orbit3: UIView = createOrbitView(diameter: 50, color: UIColor.blue);
        addOrbitViewToPlanetView(planet: planet2, orbit: orbit3)
        let planet3: UIView = createPlanetView(color: UIColor.magenta)
        addPlanetViewToOrbitView(orbit: orbit3, planet: planet3)
        rotateView(targetView: orbit3, duration: 1)
    }

    private func createPlanetView(color: UIColor) -> UIView {
        let planetDiameter: CGFloat = 12
        return createCircleView(x: 0, y: 0, width: planetDiameter, height: planetDiameter, color: color, borderWidth: 6)
    }

    private func createOrbitView(diameter: CGFloat, color: UIColor) -> UIView {
        return createCircleView(x: 0, y: 0, width: diameter, height: diameter, color: color, borderWidth: 1);
    }

    private func addPlanetViewToOrbitView(orbit: UIView, planet: UIView) {
        planet.frame.origin.x = orbit.frame.size.width / 2 + planet.frame.size.width / 2;
        planet.frame.origin.y = -4;
        orbit.addSubview(planet);
    }

    private func addOrbitViewToPlanetView(planet: UIView, orbit: UIView) {
        orbit.frame.origin.x = 0 - orbit.frame.size.width / 2 + planet.frame.size.width / 2;
        orbit.frame.origin.y = orbit.frame.origin.x;
        planet.addSubview(orbit);
    }

    private func createCircleView(x: CGFloat, y: CGFloat, width: CGFloat, height: CGFloat, color: UIColor, borderWidth: CGFloat) -> UIView {
        var circleView = UIView()
        circleView = UIView.init(frame: CGRect(x: x, y: y, width: width, height: height))
        circleView.layer.cornerRadius = circleView.frame.size.width / 2
        circleView.layer.borderColor = color.cgColor
        circleView.layer.borderWidth = borderWidth
        return circleView
    }

    private func rotateView(targetView: UIView, duration: Double) {
        UIView.animate(withDuration: duration, delay: 0.0, options: .curveLinear, animations: {
            targetView.transform = targetView.transform.rotated(by: CGFloat(Double.pi))
        }) { finished in
            self.rotateView(targetView: targetView, duration: duration)
        }
    }

}

