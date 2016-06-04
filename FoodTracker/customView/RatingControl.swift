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
    var rating = 0 {
        didSet {
            setNeedsLayout()
        }
    }
    let spacing = 5
    let starCount = 5
    var ratingButtons = [UIButton] ()

    //MARK: Initialization
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        let filledStarImage = UIImage(named: "filledStar")
        let emptyStarImage = UIImage(named: "emptyStar")
        
        for _ in 0..<starCount {
            let button = UIButton(frame: CGRect(x:0, y:0, width: 44, height: 44))
            
//            button.backgroundColor = UIColor.redColor()
            
            button.setImage(emptyStarImage, forState: .Normal)
            button.setImage(filledStarImage, forState: .Selected)
            button.setImage(filledStarImage, forState: [.Highlighted, .Selected])
            
            button.addTarget(self, action: #selector(RatingControl.ratingButtonTapped(_:)), forControlEvents: .TouchDown)
            
            button.adjustsImageWhenHighlighted = false
            
            ratingButtons += [button]
            
            addSubview(button)
        }
        
        updateButtonSelectedState()
    }
    
    override func layoutSubviews() {
        // Set the button's width and height to a square the size of the frame's height.
        let buttonSize = Int(frame.size.height)
        var buttonFrame = CGRect(x: 0, y: 0, width: buttonSize
            , height: buttonSize)
        
        // Offset each button's origin by the length of the button plus some spacing.
        for(index, button) in ratingButtons.enumerate() {
            buttonFrame.origin.x = CGFloat(index * (buttonSize + spacing))
            button.frame = buttonFrame
        }
        
        updateButtonSelectedState()
    }
    
    override func intrinsicContentSize() -> CGSize {
        let buttonSize = Int(frame.size.height)
        let width = (buttonSize * starCount) + (spacing * (starCount - 1))
        return CGSize(width: width, height: 44)
    }
    
    //MARK: Actions
    func ratingButtonTapped(button: UIButton)  {
        rating = ratingButtons.indexOf(button)! + 1
        updateButtonSelectedState()
    }
    
    func updateButtonSelectedState() {
        for(index, button) in ratingButtons.enumerate() {
            // If the index of a button is less than the rating, that button should be selected.
            button.selected = index < rating
        
        }
    }
}
