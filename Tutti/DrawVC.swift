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

    @IBAction func removeAll(_ sender: UIButton) {
        
        for sublayer in view.layer.sublayers! where sublayer is CAShapeLayer {
            sublayer.removeFromSuperlayer()
        }
    }
}

// MARK: - DrawingApiMocProtocol delegate
extension DrawVC: DrawingApiMocProtocol {
    func draw(msg: Msg) {
        DispatchQueue.main.async {
            self.drawingEngine.drawOn(view: self.view, withMessage: msg)
        }
    }
}
