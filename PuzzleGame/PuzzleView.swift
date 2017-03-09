//
//  PuzzleView.swift
//  PuzzleGame
//
//  Created by Sekorm on 2017/3/9.
//  Copyright © 2017年 YL. All rights reserved.
//

import UIKit

class PuzzleView: UIImageView {

    var puzzle : Puzzle?{
    
        didSet{
            self.image = puzzle?.image
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.layer.borderWidth = 1.0/UIScreen.main.scale
        self.layer.borderColor = UIColor.lightGray.cgColor
        self.isUserInteractionEnabled = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
