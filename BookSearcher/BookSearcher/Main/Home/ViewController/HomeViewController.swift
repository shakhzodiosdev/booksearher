//
//  ViewController.swift
//  BookSearcher
//
//  Created by Shakhzod Bobokhonov on 6/16/21.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var tableView : UITableView!
    @IBOutlet weak var searchBar : UISearchBar!

    let dataFetcher = NetworkDataFetcher()
    
    var books = [Item]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        appearanceSettings()
    }
    


}

//MARK: - UITableViewDelegate
extension HomeViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}



//MARK: - UITableViewDataSource
extension HomeViewController : UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if books.count == 0 {
            tableView.setEmptyMessage("Search for book to get more information")
        }else{
            tableView.restore()
        }
        return books.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: HomeTableViewCell.self)) as! HomeTableViewCell
        
        cell.selectionStyle = .none
        
        let data = books[indexPath.row]
        cell.configureCell(data: data)
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let str = UIStoryboard.init(name: "Detail", bundle: nil)
        let vc = str.instantiateViewController(withIdentifier: String(describing: DetailController.self)) as! DetailController
        vc.item = books[indexPath.row]
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}



//MARK: - UI Setup
extension HomeViewController {
    
    func appearanceSettings(){
        
        title = "Book Search"
        
        tableView.separatorStyle = .none
        tableView.register(UINib(nibName: String(describing: HomeTableViewCell.self), bundle: nil), forCellReuseIdentifier: String(describing: HomeTableViewCell.self))
        tableView.keyboardDismissMode = .onDrag
        
        searchBar.delegate = self
        
        //by default CancelButton is hidden
        self.searchBar.showsCancelButton = false
    }
}


//MARK: - UISearchBarDelegate
extension HomeViewController : UISearchBarDelegate{
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
      
        self.searchBar.showsCancelButton = searchText.isEmpty ? false : true

            let urlString = Constants.BASE_URL + searchText
        let _ = dataFetcher.fetchBooks(urlString: urlString, completion: { books in
            self.books = books ?? []
            self.tableView.reloadData()
        })
    }

    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
       
        self.searchBar.resignFirstResponder()
        self.searchBar.showsCancelButton = false
    }
}
