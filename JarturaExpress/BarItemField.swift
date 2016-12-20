//
//  BarItemField.swift
//  JarturaExpress
//
//  Created by Carlos Gonzalez on 12/20/16.
//  Copyright © 2016 Carlos Gonzalez. All rights reserved.
//

import UIKit

class BarItemField : UITabBarItem {
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setTitleTextAttributes([NSForegroundColorAttributeName: UIColor.init(red: 254, green: 242, blue: 0, alpha: 1)], for: .selected)
        self.setTitleTextAttributes([NSForegroundColorAttributeName: UIColor.white], for: .normal)
    }

}
