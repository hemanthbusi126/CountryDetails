//
//  UIView+Ext.swift
//  CountryDetails
//
//  Created by Hemanth on 27/01/20.
//  Copyright © 2020 Hemanth. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    
    func pin(to superView: UIView)  {
        translatesAutoresizingMaskIntoConstraints = false
        topAnchor.constraint(equalTo: superView.topAnchor).isActive = true
        leadingAnchor.constraint(equalTo: superView.leadingAnchor).isActive = true
        trailingAnchor.constraint(equalTo: superView.trailingAnchor).isActive = true
        bottomAnchor.constraint(equalTo: superView.bottomAnchor).isActive = true
    }
}
