//
//  DrawSwiftVC.swift
//  Tutti
//
//  Created by Pavle Mijatovic on 8/26/18.
//  Copyright © 2018 Pavle Mijatovic. All rights reserved.
//

import UIKit

class DrawSwiftVC: UIViewController {
    
    // MARK: - Properties
    @IBOutlet weak var drawingCanvas: UIView!
    @IBOutlet weak var infoLbl: UILabel!
    private let drawingEngine = DrawingEngine()
    private var arrayOfMsg = [Msg]()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        startQueueing()
    }
    
    private func startQueueing() {
        DispatchQueue.global(qos: .background).async {
            for i in 0..<48 {
                
                var message: UnsafeMutablePointer<Msg>?
                requestNextMove(&message)
                print(message!.pointee)
                let mssg = message!.pointee
                self.arrayOfMsg.append(mssg)
                freeMsg(message)
                
                if self.arrayOfMsg.count == 1 {
                    self.startDrawing()
                }
                
                print("====================")
                print("Finished point: \(i)")
            }
            
            DispatchQueue.main.async {
                self.infoLbl.text = "Finished"
            }
        }
    }
    
    private func startDrawing() {
        DispatchQueue.main.async {
            self.draw()
        }
    }
    
    private func draw() {
        let msg = self.arrayOfMsg.first
        self.arrayOfMsg.remove(at: 0)
        print("queue: \(self.arrayOfMsg.count)")
        
        self.infoLbl.text = self.drawingEngine.getInfoTxtForMsg(msg: msg!)
        self.drawingEngine.drawOn(view: self.drawingCanvas, withMessage: Msg(msg: msg!.msg, point:  msg!.point), completion: { (isAnimationFinished) in
            if isAnimationFinished && self.arrayOfMsg.count > 0 {
                self.draw()
            }
        })
    }
}
