//
//  SquareButton.swift
//  minesweeper
//
//  Created by Blake Parkinson on 10/6/14.
//  Copyright (c) 2014 blakeparkinson. All rights reserved.
//

import Foundation
import UIKit
class SquareButton : UIButton {
    
    let squareSize:CGFloat
    let squareMargin:CGFloat
    var square:Square
    init(squareModel:Square, squareSize:CGFloat, squareMargin:CGFloat) {
        self.square = squareModel
        self.squareSize = squareSize
        self.squareMargin = squareMargin
        let x = CGFloat(self.square.col) * (squareSize + squareMargin)
        let y = CGFloat(self.square.row) * (squareSize + squareMargin)
        let squareFrame = CGRectMake(x, y, squareSize, squareSize)
        super.init(frame: squareFrame)
    }
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}