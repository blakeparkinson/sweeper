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
    
    var oneSecondTimer:NSTimer?
    
    let BOARD_SIZE:Int = 10
    var board:Board
    var squareButtons:[SquareButton] = []
    
    var moves:Int = 0 {
        didSet {
            self.movesLabel.text = "Moves: \(moves)"
            self.movesLabel.sizeToFit()
        }
    }
    var timeTaken:Int = 0  {
        didSet {
            self.timeLabel.text = "Time: \(timeTaken)"
            self.timeLabel.sizeToFit()
        }
    }
    
    
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
        if(!sender.square.isRevealed) {
            self.moves++
            sender.square.isRevealed = true
            sender.setTitle("\(sender.getLabelText())", forState: .Normal)
        }
        if sender.square.isMineLocation {
            self.minePressed()
        }
        self.oneSecondTimer = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: Selector("oneSecond"), userInfo: nil, repeats: true)
    }
    func getLabelText() -> String {
        // check the isMineLocation and numNeighboringMines properties to determine the text to display
        if !self.square.isMineLocation {
            if self.square.numNeighboringMines == 0 {
                // case 1: there's no mine and no neighboring mines
                return ""
            }else {
                // case 2: there's no mine but there are neighboring mines
                return "\(self.square.numNeighboringMines)"
            }
        }
        // case 3: there's a mine
        return "M"
    }
    
    func oneSecond() {
        self.timeTaken++
    }
    
    func endCurrentGame() {
        self.oneSecondTimer!.invalidate()
        self.oneSecondTimer = nil
    }
    
    func minePressed() {
        self.endCurrentGame()
        // show an alert when you tap on a mine
        var alertView = UIAlertView()
        alertView.addButtonWithTitle("New Game")
        alertView.title = "Yowzerrr!"
        alertView.message = "You hit on a mine brah."
        alertView.show()
        alertView.delegate = self
    }
    
    func alertView(View: UIAlertView!, clickedButtonAtIndex buttonIndex: Int) {
        //start new game when the alert is dismissed
        self.startNewGame()
    }
    
    func startNewGame() {
        //start new game
        self.resetBoard()
        self.timeTaken = 0
        self.moves = 0
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func newGamePressed() {
        println("new game")
        self.startNewGame()
    }


}

