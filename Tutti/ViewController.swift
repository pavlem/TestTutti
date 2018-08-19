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
        
        let point1 = CGPoint(x: 50, y: 50)
        let point2 = CGPoint(x: 50, y: 60)
        let point3 = CGPoint(x: 50, y: 70)
        let point4 = CGPoint(x: 50, y: 80)

        var arr = UnsafeMutablePointer<Msg>.allocate(capacity: 4)
        arr[0] = Msg(msg: MsgsGoToPoint, point: CGPoint(x: 50, y: 50))
        arr[1] = Msg(msg: MsgsGoToPoint, point: CGPoint(x: 50, y: 60))
        arr[2] = Msg(msg: MsgsGoToPoint, point: CGPoint(x: 50, y: 70))
        arr[3] = Msg(msg: MsgsGoToPoint, point: CGPoint(x: 50, y: 80))

        defer {
            arr.deinitialize(count: 4)
            arr.deallocate()
        }
        
//        requestNextMove(&arr.advanced(by: 1))
//        requestNextMove(&arr)
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
