//
//  ViewController.swift
//  minesweeper
//
//  Created by Blake Parkinson on 10/5/14.
//  Copyright (c) 2014 blakeparkinson. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var boardView: UIView!
    @IBOutlet weak var movesLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    
    let BOARD_SIZE:Int = 10
    var board:Board
    var squareButtons:[SquareButton] = []
    
    
    required init(coder aDecoder: NSCoder)
    {
        self.board = Board(size: BOARD_SIZE)
        super.init(coder: aDecoder)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.initializeBoard()
        self.startNewGame()
    }
    
    func initializeBoard() {
        for row in 0 ..< board.size {
            for col in 0 ..< board.size {
                
                let square = board.squares[row][col]
                
                let squareSize:CGFloat = self.boardView.frame.width / CGFloat(BOARD_SIZE)
                
                let squareButton = SquareButton(squareModel: square, squareSize: squareSize);
                squareButton.setTitle("[x]", forState: .Normal)
                squareButton.setTitleColor(UIColor.darkGrayColor(), forState: .Normal)
                squareButton.addTarget(self, action: "squareButtonPressed:", forControlEvents: .TouchUpInside)
                self.boardView.addSubview(squareButton)
                
                self.squareButtons.append(squareButton)
            }
        }
    }
    
    func resetBoard() {
        // resets the board with new mine locations & sets isRevealed to false for each square
        self.board.resetBoard()
        // iterates through each button and resets the text to the default value
        for squareButton in self.squareButtons {
            squareButton.setTitle("[x]", forState: .Normal)
        }
    }
    
    func startNewGame() {
        //start new game
        self.resetBoard()
    }
    
    func squareButtonPressed(sender: SquareButton) {
        println("Pressed row:\(sender.square.row), col:\(sender.square.col)”)
            sender.setTitle("", forState: .Normal)
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func newGamePressed() {
        println("new game");
    }


}

