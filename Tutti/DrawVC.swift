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
    // Outlets
    @IBOutlet weak var infoLbl: UILabel!
    @IBOutlet weak var drawingCanvas: UIView!
    // Constants
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
            self.infoLbl.text = self.drawingEngine.getInfoTxtForMsg(msg: msg)
            self.drawingEngine.drawOn(view: self.drawingCanvas, withMessage: msg, completion: { (isAnimationFinished) in
            })
        }
    }
}
