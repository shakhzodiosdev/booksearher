//
//  HomeTableViewCell.swift
//  BookSearcher
//
//  Created by Shakhzod Bobokhonov on 6/16/21.
//

import UIKit

class HomeTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var bookImageView: UIImageView!
    
  
    
    override func awakeFromNib() {
        super.awakeFromNib()

    }

    func configureCell ( data : Item){
        self.titleLabel.text = data.volumeInfo.title
        if let authors = data.volumeInfo.authors {
            self.authorLabel.text = "Authors: " + authors.joined(separator: ", ")
        }
        self.bookImageView.imageFromServerURL(data.volumeInfo.imageLinks.thumbnail, placeHolder: UIImage(named: ""))
    }
    
}
