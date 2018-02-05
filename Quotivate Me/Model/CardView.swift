//
//  CardView.swift
//  Quotivate Me
//
//  Created by Siddique on 04/02/18.
//  Copyright © 2018 Siddique. All rights reserved.
//
import UIKit

class CardView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
   
//    @IBOutlet weak var view: UIView!
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }

    func setup() {
        
        // Shadow
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.25
        layer.shadowOffset = CGSize(width: 0, height: 1.5)
        layer.shadowRadius = 4.0
        layer.shouldRasterize = true
        layer.rasterizationScale = UIScreen.main.scale
        
        
        // Corner Radius
        layer.cornerRadius = 10.0;
        
    }
    
    
    
}

