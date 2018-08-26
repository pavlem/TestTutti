//
//  CustomViewRandMsgs.swift
//  Tutti
//
//  Created by Pavle Mijatovic on 8/25/18.
//  Copyright © 2018 Pavle Mijatovic. All rights reserved.
//

import UIKit

class CustomViewRandMsgs: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = UIColor.darkGray
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
    
        tuttiAPI()
    }
    
    func tuttiAPI() {
    
        var messages: UnsafeMutablePointer<Msg>? = UnsafeMutablePointer<Msg>.allocate(capacity: 5)

        for i in 0..<5 {
            requestNextMove(&messages + i)
            var msg: Msg = messages![i]
            print(msg)
            print("========")
            freeMsg(&msg)
        }
        
        messages?.deallocate()
    }
}
