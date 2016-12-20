//
//  SearchTextField.swift
//  JarturaExpress
//
//  Created by Carlos Gonzalez on 12/20/16.
//  Copyright © 2016 Carlos Gonzalez. All rights reserved.
//

import UIKit

class SearchTextField : UITextField{
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.textAlignment = .left
        self.enablesReturnKeyAutomatically = true
        self.textAlignment = .left
        self.enablesReturnKeyAutomatically = true
        //setting shadow
        self.layer.masksToBounds = false
        self.layer.shadowOpacity = 1.0
        self.layer.shadowRadius = 3.0
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOffset = CGSize(width: 1.0, height: 1.0)
        //adding image
        let iconImageView = UIImageView(image: #imageLiteral(resourceName: "magnifying-glass"))
        iconImageView.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        self.leftView = iconImageView
        self.leftViewMode = .always
    }
    override func leftViewRect(forBounds bounds: CGRect) -> CGRect {
        let leftBounds = CGRect(x: bounds.origin.x + 10, y: 10, width: 30, height: 30)
        return leftBounds ;
    }
}
