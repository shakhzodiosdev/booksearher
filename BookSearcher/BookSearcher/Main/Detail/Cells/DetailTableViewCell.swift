//
//  DetailTableViewCell.swift
//  BookSearcher
//
//  Created by Shakhzod Bobokhonov on 6/17/21.
//

import UIKit

class DetailTableViewCell: UITableViewCell {
    
    @IBOutlet weak var detailImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var bookDescriptionLabel: UILabel!
    @IBOutlet weak var authorsLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
}
