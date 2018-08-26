//
//  CustomViewRandMsgs.swift
//  Tutti
//
//  Created by Pavle Mijatovic on 8/25/18.
//  Copyright © 2018 Pavle Mijatovic. All rights reserved.
//

import UIKit

class CustomViewRandMsgs: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = UIColor.darkGray
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
    
        tuttiAPI()
        createTriangle()
    }
    
    func tuttiAPI() {
    
        var messages: UnsafeMutablePointer<Msg>? = UnsafeMutablePointer<Msg>.allocate(capacity: 5)

        for i in 0..<5 {
            requestNextMove(&messages + i)
            var msg: Msg = messages![i]
            print(msg)
            print("========")
            freeMsg(&msg)
        }
        
        messages?.deallocate()
    }
    
    func createTriangle() {
        var path: UIBezierPath!
        path = UIBezierPath()
        path.move(to: CGPoint(x: self.frame.width/2, y: 0.0))
        path.addLine(to: CGPoint(x: 0.0, y: self.frame.size.height))
        path.addLine(to: CGPoint(x: self.frame.size.width, y: self.frame.size.height))
        path.close()
        
        let pathLayer = CAShapeLayer()
        pathLayer.frame = self.bounds
        pathLayer.path = path.cgPath
        pathLayer.strokeColor = UIColor.red.cgColor
        pathLayer.fillColor = nil
        pathLayer.lineWidth = 2.0
        pathLayer.lineJoin = kCALineJoinBevel
        
        self.layer.addSublayer(pathLayer)
        
        let pathAnimation = CABasicAnimation(keyPath: "strokeEnd")
        pathAnimation.duration = 1.0
        pathAnimation.fromValue = NSNumber(value: 0.0)
        pathAnimation.toValue = NSNumber(value: 1.0)
        pathLayer.add(pathAnimation, forKey: "strokeEnd")
    }
}
