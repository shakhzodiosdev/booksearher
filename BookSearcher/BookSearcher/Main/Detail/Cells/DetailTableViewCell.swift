//
//  DetailTableViewCell.swift
//  BookSearcher
//
//  Created by Shakhzod Bobokhonov on 6/17/21.
//

import UIKit

class DetailTableViewCell: UITableViewCell {
    
    @IBOutlet weak var detailImageView: UIImageView!
    @IBOutlet weak var bookDescriptionLabel: UILabel!
    @IBOutlet weak var authorsLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    
    func configureCell ( data : Item){
        
        if let authors = data.volumeInfo.authors {
        self.authorsLabel.text = authors.count > 1 ? "Authors: " + authors.joined(separator: ", ") :  "Author: " + authors.joined(separator: ", ")
        }
        
        if let description = data.volumeInfo.description {
            self.bookDescriptionLabel.text = description
        }else{
            self.bookDescriptionLabel.text = ""
        }
        
        guard let urlString = data.volumeInfo.imageLinks.thumbnail else { return }
        self.detailImageView.imageFromServerURL(urlString, placeHolder: UIImage(named: ""))
    }
}
