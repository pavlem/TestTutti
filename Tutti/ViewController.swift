//
//  ViewController.swift
//  Tutti
//
//  Created by Pavle Mijatovic on 8/18/18.
//  Copyright © 2018 Pavle Mijatovic. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let msg1 = Msg(msg: MsgsGoToPoint, point: CGPoint(x: 50, y: 50))
        let msg2 = Msg(msg: MsgsGoToPoint, point: CGPoint(x: 50, y: 60))
        let msg3 = Msg(msg: MsgsGoToPoint, point: CGPoint(x: 50, y: 70))
        let msg4 = Msg(msg: MsgsGoToPoint, point: CGPoint(x: 50, y: 80))
        
        var msgs = [msg1, msg2, msg3, msg4]
        
        let intPointer: UnsafeMutablePointer<Msg> = UnsafeMutablePointer<Msg>.allocate(capacity: 4)
        for i in 0..<4 {
            (intPointer + i).initialize(to: msgs[i])
        }
        print(intPointer.pointee)
        print(intPointer.advanced(by: 1).pointee)
        print(intPointer.advanced(by: 2).pointee)
        print(intPointer.advanced(by: 3).pointee)
        
        requestNextMove(&intPointer.advanced(by: 1))
        
        intPointer.deallocate()
    }
}

// MARK: - API methods
//===================================================================
//enum MsgAction {
//    MsgsGoToPoint,
//    MsgsDrawLineToPoint,
//    MsgsClearDrawing,
//    MsgsDoNothing
//};
//
//struct Msg
//{
//    enum MsgAction msg;
//    CGPoint point;
//};
//
///*
// Please note that this function can block the current thread for some time.
// It is also not thread save and should be properly garded.
// */
//void requestNextMove(struct Msg **msg);
//
///* free a message */
//void freeMsg(struct Msg *msg);
