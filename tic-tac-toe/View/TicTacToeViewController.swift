//
//  ViewController.swift
//  tic-tac-toe
//
//  Created by Esraa Gamal on 18/01/2022.
//

import UIKit

class TicTacToeViewController: UIViewController {

    @IBOutlet weak var xScoreLabel: UILabel!
    @IBOutlet weak var oScoreLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!

    let GameController = TicTacToeController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.layer.cornerRadius = 4

        xScoreLabel.text = "X : \(GameController.xScore)"
        oScoreLabel.text = "O : \(GameController.oScore)"
        
        let leftSwipe = UISwipeGestureRecognizer(target: self, action: #selector(handleSwiping(_:)))
        let rightSwipe = UISwipeGestureRecognizer(target: self, action: #selector(handleSwiping(_:)))
        leftSwipe.direction = .left
        rightSwipe.direction = .right
        collectionView.addGestureRecognizer(leftSwipe)
        collectionView.addGestureRecognizer(rightSwipe)
    }

    @objc func handleSwiping(_ gesture: UISwipeGestureRecognizer) {
        GameController.resetGame()
        collectionView.allowsSelection = true
        statusLabel.text = ""
        collectionView.reloadData()
    }
    
    func makeAMove(on index: Int) {
        let result = GameController.playTurn(at: index)
        if result != .onGoing {
            statusLabel.text = result.rawValue
            xScoreLabel.text = "X : \(GameController.xScore)"
            oScoreLabel.text = "O : \(GameController.oScore)"
            collectionView.allowsSelection = false
        }
        collectionView.reloadData()
    }
}

//MARK:- UICollectionView

extension TicTacToeViewController : UICollectionViewDelegate, UICollectionViewDataSource , UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SquareCell", for: indexPath) as? SquareCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.configureCell(with: GameController.squares[indexPath.row].status.rawValue)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return GameController.squares.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let itemSize = (collectionView.bounds.width / 3) - 4
        return CGSize(width: itemSize, height: itemSize)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 3, left: 3, bottom: 3, right: 3)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        makeAMove(on: indexPath.row)
    }
}
