//
//  CustomView.swift
//  Tutti
//
//  Created by Pavle Mijatovic on 8/19/18.
//  Copyright © 2018 Pavle Mijatovic. All rights reserved.
//

import UIKit

class CustomView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = UIColor.darkGray
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
  
//        createTriangle()
//        drawTuttiAPI()
//        createTriangleCoreGraphics()
        
//        var arr: UnsafeMutablePointer<Msg>? = UnsafeMutablePointer<Msg>.allocate(capacity: 4)
//        arr![0] = Msg(msg: MsgsGoToPoint, point: CGPoint(x: 50, y: 50))
//        arr![1] = Msg(msg: MsgsGoToPoint, point: CGPoint(x: 50, y: 60))
//        arr![2] = Msg(msg: MsgsGoToPoint, point: CGPoint(x: 50, y: 70))
//        arr![3] = Msg(msg: MsgsGoToPoint, point: CGPoint(x: 50, y: 80))
//
//
//        var pMsg = Msg(msg: MsgsGoToPoint, point: CGPoint(x: 50, y: 50))
//
//        requestNextMove(&arr?.advanced(by: 1)
    }
    
    func drawTuttiAPI() {
        var msg1 = Msg(msg: MsgsGoToPoint, point: CGPoint(x: self.frame.width/2, y: 0))
        var msg2 = Msg(msg: MsgsDrawLineToPoint, point: CGPoint(x: 0, y: self.frame.size.height))
        var msg3 = Msg(msg: MsgsDrawLineToPoint, point: CGPoint(x: self.frame.size.width, y: self.frame.size.height))
        var msg4 = Msg(msg: MsgsDrawLineToPoint, point: CGPoint(x: self.frame.width/2, y: 0))
        
        var msgs = [msg1, msg2, msg3, msg4]
        
        let intPointer: UnsafeMutablePointer<Msg> = UnsafeMutablePointer<Msg>.allocate(capacity: 4)
        for i in 0..<4 {
            (intPointer + i).initialize(to: msgs[i])
        }
        print(intPointer.pointee); print(intPointer.advanced(by: 1).pointee); print(intPointer.advanced(by: 2).pointee); print(intPointer.advanced(by: 3).pointee)
        
        var value1: UnsafeMutablePointer<Msg>? = intPointer.advanced(by: 0)
        var value2: UnsafeMutablePointer<Msg>? = intPointer.advanced(by: 1)
        var value3: UnsafeMutablePointer<Msg>? = intPointer.advanced(by: 2)
        var value4: UnsafeMutablePointer<Msg>? = intPointer.advanced(by: 3)
        
        print(value1!); print(value2!); print(value3!); print(value4!)
        
        var values = [value1, value2, value3, value4]
        
        for i in 0..<values.count {
            var value = values[i]
            requestNextMove(&value)
            print(i)
        }
        
//        requestNextMove(&value1)
//        requestNextMove(&value2)
//        requestNextMove(&value3)
//        requestNextMove(&value4)

        //        struct Msg **messages = malloc(sizeof(struct Msg*));
//
//        for (int i = 0; i < 4; i++) {
//            requestNextMove(messages + 1);
//            struct Msg *message = messages[i];
//            int value = message->msg;
//            CGPoint point = message->point;
//            NSLog(@"%@, %@", @(value), @(point));
//        }
        
//        requestNextMove(&intPointer.advanced(by: 0))

        createTriangle()
        intPointer.deallocate()
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
    
    func createTriangleCoreGraphics() {
        if let context = UIGraphicsGetCurrentContext() {
            context.setStrokeColor(UIColor.gray.cgColor)
            context.setLineWidth(2)
            context.move(to: CGPoint(x: self.frame.width/2, y: 0.0))
            context.addLine(to: CGPoint(x: 0.0, y: self.frame.size.height))
            context.addLine(to: CGPoint(x: self.frame.size.width, y: self.frame.size.height))
            context.addLine(to: CGPoint(x: bounds.width, y: bounds.height - 10))
            context.closePath()
            context.strokePath()
        }
    }
}
