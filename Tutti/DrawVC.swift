//
//  DrawVC.swift
//  Tutti
//
//  Created by Pavle Mijatovic on 8/26/18.
//  Copyright © 2018 Pavle Mijatovic. All rights reserved.
//

import UIKit

class DrawVC: UIViewController {
    
    // MARK: - Properties
    @IBOutlet weak var infoLbl: UILabel!
    let drawingEngine = DrawingEngine()

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        startDrawing()
    }
    
    // MARK: - Helper
    private func startDrawing() {
        let drawingAPIMoc = DrawingApiMoc()
        drawingAPIMoc.delegate = self
        drawingAPIMoc.requestNextMove()
    }
}

// MARK: - DrawingApiMocProtocol delegate
extension DrawVC: DrawingApiMocProtocol {
    func draw(msg: Msg) {
        DispatchQueue.main.async {
            self.infoLbl.text = self.getInfoTxtForMsg(msg: msg)
            self.drawingEngine.drawOn(view: self.view, withMessage: msg)
        }
    }
    
    private func getInfoTxtForMsg(msg: Msg) -> String {
        switch msg.msg {
        case MsgsGoToPoint:
            return "MsgsGoToPoint, point: \(msg.point)"
        case MsgsDrawLineToPoint:
            return "MsgsDrawLineToPoint, point: \(msg.point)"
        case MsgsClearDrawing:
            return "MsgsClearDrawing, point: \(msg.point)"
        case MsgsDoNothing:
            return "MsgsDoNothing, point: \(msg.point)"
        default:
            return "Default"
        }
    }
}
