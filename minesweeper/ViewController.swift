//
//  ViewController.swift
//  minesweeper
//
//  Created by Blake Parkinson on 10/5/14.
//  Copyright (c) 2014 blakeparkinson. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let BOARD_SIZE:Int = 10
    var board:Board
    var squareButtons:[SquareButton] = []
    
    required init(coder aDecoder: NSCoder)
    {
        self.board = Board(size: BOARD_SIZE)
        super.init(coder: aDecoder)
    }
    
    @IBOutlet weak var boardView: UIView!
    @IBOutlet weak var movesLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func newGamePressed() {
        println("new game");
    }


}

