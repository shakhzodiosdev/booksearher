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
    @IBOutlet weak var shadowView: UIView!
    
  
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func configureCell ( data : Item){
        
        if let title = data.volumeInfo.title{
        self.titleLabel.text = title
        }
        
        if let authors = data.volumeInfo.authors {
        self.authorLabel.text = authors.count > 1 ? "Authors: " + authors.joined(separator: ", ") :  "Author: " + authors.joined(separator: ", ")
        }else{
        self.authorLabel.text = "Author: -"
        }
        
        guard let urlString = data.volumeInfo.imageLinks.smallThumbnail else { return }
        self.bookImageView.imageFromServerURL(urlString, placeHolder: UIImage(named: ""))
    }
    
}
