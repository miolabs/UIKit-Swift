//
//  UIApplication.swift
//  
//
//  Created by Javier Segura Perez on 10/4/22.
//

import Foundation

public class UIApplication
{
    class var _shared : UIApplication? = nil
    
    class var shared: UIApplication { get {
        if _shared == nil { _shared = UIApplication() }
        return _shared!
    } }
}


func UIApplicationMain(_ argc: Int32, _ argv: UnsafeMutablePointer<UnsafeMutablePointer<CChar>?>, _ principalClassName: String?, _ delegateClassName: String?) -> Int32 {
    
}
