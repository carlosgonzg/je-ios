//
//  Shorcuts.swift
//  JarturaExpress
//
//  Created by Carlos Gonzalez on 12/20/16.
//  Copyright © 2016 Carlos Gonzalez. All rights reserved.
//

import UIKit

enum ShortcutIdentifier: String {
    case First
    case Second
    case Third
    case Fourth
    
    // MARK: Initializers
    
    init?(fullType: String) {
        guard let last = fullType.components(separatedBy: ".").last else { return nil }
        
        self.init(rawValue: last)
    }
    
    // MARK: Properties
    
    var type: String {
        return Bundle.main.bundleIdentifier! + ".\(self.rawValue)"
    }
}

/// Saved shortcut item used as a result of an app launch, used later when app is activated.
var launchedShortcutItem: UIApplicationShortcutItem?
