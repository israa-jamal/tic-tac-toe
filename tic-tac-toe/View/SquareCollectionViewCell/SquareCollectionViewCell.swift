//
//  SquareCollectionViewCell.swift
//  tic-tac-toe
//
//  Created by Esraa Gamal on 18/01/2022.
//

import UIKit

class SquareCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var squareImageView : UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configureCell(with image : String) {
        squareImageView.image = UIImage(named: image)
    }
}
