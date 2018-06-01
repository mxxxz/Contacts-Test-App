//
//  IDGenerator.swift
//  Contacts Test Application
//
//  Created by Dmitry Grusha on 02.06.2018.
//  Copyright © 2018 Dmitry Grusha. All rights reserved.
//

import Foundation

class IDGenerator{
    class func random(_ n: Int) -> String
    {
        let a = "contact-"
        
        var s = ""
        
        for _ in 0..<n
        {
            let r = arc4random_uniform(10)
            
            s += String(r)
        }
        
        return a+s
    }
}
