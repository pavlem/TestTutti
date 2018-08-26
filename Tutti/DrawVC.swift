//
//  DrawVC.swift
//  Tutti
//
//  Created by Pavle Mijatovic on 8/26/18.
//  Copyright © 2018 Pavle Mijatovic. All rights reserved.
//

import UIKit

class DrawVC: UIViewController {
    
//    var path: UIBezierPath!

    var initalPoint = CGPoint(x: 100.0, y: 100.0)

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let points = [CGPoint(x: 120, y: 120), CGPoint(x: 150, y: 200), CGPoint(x: 150, y: 100), CGPoint(x: 250, y: 50)]
        
        DispatchQueue.global(qos: .background).async {
            
            for (index, point) in points.enumerated() {
                sleep(1)
                
                DispatchQueue.main.async {
                    var path: UIBezierPath!
                    path = UIBezierPath()
                    path.move(to: self.initalPoint)
                    
//                    if index == 2 {
//                        self.initalPoint = point
//                        path.move(to: self.initalPoint)
//                    } else {
//                        path.addLine(to: point)
//                        self.initalPoint = point
//                    }
                    
                    path.addLine(to: point)
                    self.initalPoint = point
                    
                    let pathLayer = CAShapeLayer()
                    pathLayer.frame = self.view.bounds
                    pathLayer.path = path.cgPath
                    pathLayer.strokeColor = UIColor.red.cgColor
                    pathLayer.fillColor = nil
                    pathLayer.lineWidth = 2.0
                    pathLayer.lineJoin = kCALineJoinBevel
                    
                    self.view.layer.addSublayer(pathLayer)
                    let pathAnimation = CABasicAnimation(keyPath: "strokeEnd")
                    pathAnimation.duration = 0.5
                    pathAnimation.fromValue = NSNumber(value: 0.0)
                    pathAnimation.toValue = NSNumber(value: 1.0)
                    pathLayer.add(pathAnimation, forKey: "strokeEnd")
                    
                }
            }
            
            
            

            

        }
    }
}
