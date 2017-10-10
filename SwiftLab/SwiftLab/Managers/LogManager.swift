//
//  LogManager.swift
//  SwiftLab
//
//  Created by julien gimenez on 10/10/2017.
//  Copyright © 2017 julien gimenez. All rights reserved.
//

import Foundation


func SLPrint(title : String, content : Any) -> ()
{
    #if DEBUG
        print("@@@@@@@@@@ \(title) : ", content)
    #endif
}
