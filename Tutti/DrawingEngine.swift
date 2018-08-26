//
//  DrawingEngine.swift
//  Tutti
//
//  Created by Pavle Mijatovic on 8/26/18.
//  Copyright © 2018 Pavle Mijatovic. All rights reserved.
//

import Foundation
import UIKit

class DrawingEngine {
    
    static let shared = DrawingEngine()

    // MARK: - API
    var initalPoint = CGPoint(x: 100.0, y: 100.0)

    func drawOn(view: UIView, withMessage msg: Msg) {
        var path: UIBezierPath!
        path = UIBezierPath()
        path.move(to: self.initalPoint)
        
        switch msg.msg {
        case MsgsGoToPoint:
            initalPoint = msg.point
            path.move(to: self.initalPoint)
        case MsgsDrawLineToPoint:
            path.addLine(to: msg.point)
            initalPoint = msg.point
        case MsgsClearDrawing:
            print("MsgsClearDrawing")
        case MsgsDoNothing:
            print("MsgsDoNothing")
        default:
            print("default - MsgsDoNothing")
        }
    
        let pathLayer = getPathLayer(forView: view, andPath: path)
        view.layer.addSublayer(pathLayer)
        let pathAnimation = setAnimation()
        pathLayer.add(pathAnimation, forKey: "strokeEnd")
        
    }
    
    private func getPathLayer(forView view: UIView, andPath path: UIBezierPath) -> CAShapeLayer {
        let pathLayer = CAShapeLayer()
        pathLayer.frame = view.bounds
        pathLayer.path = path.cgPath
        pathLayer.strokeColor = UIColor.red.cgColor
        pathLayer.fillColor = nil
        pathLayer.lineWidth = 2.0
        pathLayer.lineJoin = kCALineJoinBevel
        return pathLayer
    }
    
    private func setAnimation() -> CABasicAnimation {
        let pathAnimation = CABasicAnimation(keyPath: "strokeEnd")
        pathAnimation.duration = 0.5
        pathAnimation.fromValue = NSNumber(value: 0.0)
        pathAnimation.toValue = NSNumber(value: 1.0)
        return pathAnimation
    }
}
