//
//  RatingControl.swift
//  FoodTracker
//
//  Created by ServesyOfficial on 6/4/16.
//  Copyright © 2016 servesy. All rights reserved.
//

import UIKit

class RatingControl: UIView {
    
    //MARK: Properties
    var rating = 0
    var ratingButtons = [UIButton] ()

    //MARK: Initialization
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        for _ in 0..<5 {
            let button = UIButton(frame: CGRect(x:0, y:0, width: 44, height: 44))
            button.backgroundColor = UIColor.redColor()
            
            button.addTarget(self, action: #selector(RatingControl.ratingButtonTapped(_:)), forControlEvents: .TouchDown)
            
            ratingButtons += [button]
            addSubview(button)
        }
    }
    
    override func layoutSubviews() {
        var buttonFrame = CGRect(x: 0, y: 0, width: 44, height: 44)
        
        for(index, button) in ratingButtons.enumerate() {
            buttonFrame.origin.x = CGFloat(index * (44 + 5))
            button.frame = buttonFrame
        }
    }
    
    override func intrinsicContentSize() -> CGSize {
        return CGSize(width: 240, height: 44)
    }
    
    //MARK: Actions
    func ratingButtonTapped(button: UIButton)  {
        print("Button pressed")
    }
}
