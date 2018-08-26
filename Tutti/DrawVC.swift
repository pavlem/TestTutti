//
//  DrawVC.swift
//  Tutti
//
//  Created by Pavle Mijatovic on 8/26/18.
//  Copyright © 2018 Pavle Mijatovic. All rights reserved.
//

import UIKit

class DrawVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        draw()
    }
    
    func draw() {
        var path: UIBezierPath!
        path = UIBezierPath()
        path.move(to: CGPoint(x: self.view.frame.width/2, y: 0.0))
        path.addLine(to: CGPoint(x: 0.0, y: self.view.frame.size.height))
        path.addLine(to: CGPoint(x: self.view.frame.size.width, y: self.view.frame.size.height))
        path.close()
        
        let pathLayer = CAShapeLayer()
        pathLayer.frame = self.view.bounds
        pathLayer.path = path.cgPath
        pathLayer.strokeColor = UIColor.red.cgColor
        pathLayer.fillColor = nil
        pathLayer.lineWidth = 2.0
        pathLayer.lineJoin = kCALineJoinBevel
        
        self.view.layer.addSublayer(pathLayer)
        
        let pathAnimation = CABasicAnimation(keyPath: "strokeEnd")
        pathAnimation.duration = 1.0
        pathAnimation.fromValue = NSNumber(value: 0.0)
        pathAnimation.toValue = NSNumber(value: 1.0)
        pathLayer.add(pathAnimation, forKey: "strokeEnd")
    }
}
