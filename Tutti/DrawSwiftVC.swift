//
//  DrawSwiftVC.swift
//  Tutti
//
//  Created by Pavle Mijatovic on 8/26/18.
//  Copyright © 2018 Pavle Mijatovic. All rights reserved.
//

import UIKit

class DrawSwiftVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        var messages: UnsafeMutablePointer<Msg>? = UnsafeMutablePointer<Msg>.allocate(capacity: 0)
        
        for i in 0..<5 {
            requestNextMove(&messages + i)
            let msg: Msg = messages![i]
            let s = MemoryLayout.size(ofValue: msg)
            print(s)
            print(msg)
            print("========")
//            freeMsg(&msg)
        }
        
        messages?.deallocate()
    }
}
