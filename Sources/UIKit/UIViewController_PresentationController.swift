//
//  UIViewController_PresentationController.swift
//  
//
//  Created by Javier Segura Perez on 17/9/21.
//

import Foundation

enum UIModalPresentationStyle
{
    case fullScreen
    case pageSheet // normal modal sheet in osx
    case formSheet // normal modal like floating window but horizontal and vertically centered
    case currentContext
    case custom
    case overFullScreen     // Similar to FullScreen but the view beneath doesnpt dissappear
    case overCurrentContext // Similuar like previus, but in current context
    case popover // the popover, almost like FormSheet but no centered
    case none
}

enum UIModalTransitionStyle
{
    case coverVertical
    case flipHorizontal
    case crossDisolve
}

public class UIPresentationController : NSObject
{
    open var _is_presented = false
}
