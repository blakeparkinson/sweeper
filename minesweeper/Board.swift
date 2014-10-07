//
//  Board.swift
//  minesweeper
//
//  Created by Blake Parkinson on 10/6/14.
//  Copyright (c) 2014 blakeparkinson. All rights reserved.
//

import Foundation

class Board {
    let size:Int
    var squares:[[Square]] = [] // a 2d array of square cells, indexed by [row][column]
    init(size:Int) {
        self.size = size
        
        for row in 0 ..< size {
            var squareRow:[Square] = []
            for col in 0 ..< size {
                let square = Square(row: row, col: col)
                squareRow.append(square)
            }
            squares.append(squareRow)
        }
    }
}