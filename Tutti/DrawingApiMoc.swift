//
//  DrawingApiMoc.swift
//  Tutti
//
//  Created by Pavle Mijatovic on 8/26/18.
//  Copyright © 2018 Pavle Mijatovic. All rights reserved.
//

import Foundation

protocol DrawingApiMocProtocol: class {
    func draw(msg: Msg)
}

class DrawingApiMoc {
    
    // MARK: - API
    weak var delegate: DrawingApiMocProtocol?
    
    func requestNextMove() {
        DispatchQueue.global(qos: .background).async {
            for message in self.msgs {
                let randomNumDouble  = Double.random(min: 0.5, max: 1.50)
                print("rand: \(randomNumDouble)")
                Thread.sleep(forTimeInterval: randomNumDouble)
                self.delegate?.draw(msg: message)
            }
        }
    }
    
    // MARK: - Properties:
    let msg1 = Msg(msg: MsgsGoToPoint, point: CGPoint(x: 100, y: 100))
    let msg2 = Msg(msg: MsgsDrawLineToPoint, point: CGPoint(x: 200, y: 200))
    let msg3 = Msg(msg: MsgsDrawLineToPoint, point: CGPoint(x: 200, y: 300))
    let msg4 = Msg(msg: MsgsDrawLineToPoint, point: CGPoint(x: 300, y: 300))
    let msg5 = Msg(msg: MsgsDoNothing, point: CGPoint(x: 200, y: 50))
    let msg6 = Msg(msg: MsgsGoToPoint, point: CGPoint(x: 300, y: 400))
    let msg7 = Msg(msg: MsgsDrawLineToPoint, point: CGPoint(x: 350, y: 400))
    let msg8 = Msg(msg: MsgsClearDrawing, point: CGPoint(x: 350, y: 400))
    let msg9 = Msg(msg: MsgsDrawLineToPoint, point: CGPoint(x: 200, y: 600))

    var msgs: [Msg] {
        return [msg1, msg2, msg3, msg4, msg5, msg6, msg7, msg8, msg9]
    }
}

public extension Double {
    public static var random: Double {
        return Double(arc4random()) / 0xFFFFFFFF
    }
    public static func random(min: Double, max: Double) -> Double {
        return Double.random * (max - min) + min
    }
}
