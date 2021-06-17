//
//  DetailController.swift
//  BookSearcher
//
//  Created by Shakhzod Bobokhonov on 6/17/21.
//

import UIKit

class DetailController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var item : Item!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.appearanceSettings()
    }
    
}

//MARK: - UITableViewDelegate
extension DetailController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}



//MARK: - UITableViewDataSource
extension DetailController : UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: DetailTableViewCell.self)) as! DetailTableViewCell
        
        cell.selectionStyle = .none
        
        if let item = self.item {
        cell.configureCell(data: item)
        }
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
}



//MARK: - UI Setup
extension DetailController {
    
    func appearanceSettings(){
        title = item.volumeInfo.title
        
        tableView.showsVerticalScrollIndicator = false
        tableView.separatorStyle = .none
        tableView.register(UINib(nibName: String(describing: DetailTableViewCell.self), bundle: nil), forCellReuseIdentifier: String(describing: DetailTableViewCell.self))
    }
}

