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
    var startingPoint = CGPoint(x: 100.0, y: 100.0)

    func drawOn(view: UIView, withMessage msg: Msg) {
        var path = UIBezierPath()
        path.move(to: self.startingPoint)
        handle(msg: msg, for: &path)
        let pathLayer = getPathLayer(forView: view, andPath: path)
        view.layer.addSublayer(pathLayer)
        let pathAnimation = setAnimation()
        pathLayer.add(pathAnimation, forKey: "strokeEnd")
    }
    
    // MARK: - Helper
    private func handle(msg: Msg, for path: inout UIBezierPath) {
        switch msg.msg {
        case MsgsGoToPoint:
            goToPoint(msg: msg, path: &path)
        case MsgsDrawLineToPoint:
            drawALineToAPoint(msg: msg, path: &path)
        case MsgsClearDrawing:
            clearDrawing()
        case MsgsDoNothing:
            doNothing()
        default:
            doNothing()
        }
    }
    
    private func goToPoint(msg: Msg, path: inout UIBezierPath) {
        print("MsgsGoToPoint")
        startingPoint = msg.point
        path.move(to: self.startingPoint)
    }
    
    private func drawALineToAPoint(msg: Msg, path: inout UIBezierPath) {
        print("MsgsDrawLineToPoint")
        path.addLine(to: msg.point)
        startingPoint = msg.point
    }
    
    private func doNothing() {
        print("MsgsDoNothing")
    }
    
    private func clearDrawing() {
        print("MsgsClearDrawing")
    }
    
    private func getPathLayer(forView view: UIView, andPath path: UIBezierPath) -> CAShapeLayer {
        let pathLayer = CAShapeLayer()
        pathLayer.frame = view.bounds
        pathLayer.path = path.cgPath
        pathLayer.strokeColor = UIColor.red.cgColor
        pathLayer.fillColor = nil
        pathLayer.lineWidth = 2.5
        pathLayer.lineJoin = kCALineJoinBevel
        return pathLayer
    }
    
    private func setAnimation() -> CABasicAnimation {
        let pathAnimation = CABasicAnimation(keyPath: "strokeEnd")
        pathAnimation.duration = 0.6
        pathAnimation.fromValue = NSNumber(value: 0.0)
        pathAnimation.toValue = NSNumber(value: 1.0)
        return pathAnimation
    }
}
