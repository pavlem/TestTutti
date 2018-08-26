//
//  DrawVC.swift
//  Tutti
//
//  Created by Pavle Mijatovic on 8/26/18.
//  Copyright © 2018 Pavle Mijatovic. All rights reserved.
//

import UIKit

class DrawVC: UIViewController {
    
    let drawingEngine = DrawingEngine()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let msg1 = Msg(msg: MsgsGoToPoint, point: CGPoint(x: 120, y: 120))
        let msg2 = Msg(msg: MsgsDrawLineToPoint, point: CGPoint(x: 150, y: 200))
        let msg3 = Msg(msg: MsgsDrawLineToPoint, point: CGPoint(x: 150, y: 100))
        let msg4 = Msg(msg: MsgsDrawLineToPoint, point: CGPoint(x: 250, y: 50))
        let msg5 = Msg(msg: MsgsDoNothing, point: CGPoint(x: 200, y: 50))
        let msg6 = Msg(msg: MsgsGoToPoint, point: CGPoint(x: 300, y: 300))
        let msg7 = Msg(msg: MsgsDrawLineToPoint, point: CGPoint(x: 200, y: 200))

        let msgs = [msg1, msg2, msg3, msg4, msg5, msg6, msg7]

        DispatchQueue.global(qos: .background).async {
            for msgLo in msgs {
                sleep(1)
                DispatchQueue.main.async {
                    self.drawingEngine.drawOn(view: self.view, withMessage: msgLo)
                }
            }
        }
    }
}
