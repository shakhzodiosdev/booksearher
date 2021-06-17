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
    
    let urlString = "https://www.googleapis.com/books/v1/volumes?q="
    
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
        return books.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HomeTableViewCell") as! HomeTableViewCell
        
        cell.selectionStyle = .none
        
        let data = books[indexPath.row]
        cell.configureCell(data: data)
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let str = UIStoryboard.init(name: "Detail", bundle: nil)
        let vc = str.instantiateViewController(withIdentifier: "DetailController") as! DetailController
        vc.item = books[indexPath.row]
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}



//MARK: - UI Setup
extension HomeViewController {
    
    func appearanceSettings(){
        title = "Book Search"
        tableView.separatorStyle = .none
        searchBar.delegate = self
        tableView.register(UINib(nibName: "HomeTableViewCell", bundle: nil), forCellReuseIdentifier: "HomeTableViewCell")
        
        //by default hide Cancel Button
        self.searchBar.showsCancelButton = false
    }
}


//MARK: - UISearchBarDelegate
extension HomeViewController : UISearchBarDelegate{
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        self.searchBar.showsCancelButton = true
        let urlString = self.urlString + searchText
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
