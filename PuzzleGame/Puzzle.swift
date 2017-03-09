//
//  Puzzle.swift
//  PuzzleGame
//
//  Created by Sekorm on 2017/3/9.
//  Copyright © 2017年 YL. All rights reserved.
//

import UIKit

enum Direction {
    case DirectionUp
    case DirectionDown
    case DirectionLeft
    case DirectionRight
}

class Puzzle: NSObject {
    
    var  col : NSInteger!
    var  row : NSInteger!
    private(set) var  image : UIImage!
    
    init(image: UIImage, withCol col: NSInteger, withRow row: NSInteger){
        super.init()
        self.col = col
        self.row = row
        self.image = image
    }
    
    func move(direction : Direction) {
        
        switch direction {
        case .DirectionUp:
            row = row - 1
            break
        case .DirectionDown:
            row = row + 1
            break
        case .DirectionLeft:
            col = col - 1
            break
        case .DirectionRight:
            col = col + 1
            break
        }
    }
}
