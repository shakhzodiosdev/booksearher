//
//  BookSearcherTests.swift
//  BookSearcherTests
//
//  Created by Shakhzod Bobokhonov on 6/16/21.
//

import XCTest
@testable import BookSearcher

class BookSearcherTests: XCTestCase {
    
    var sut  : HomeViewController!
    var sut2 : DetailController!
    
    let item = Item(volumeInfo: Book(title: nil, authors: nil, description: "read read", imageLinks: ImageLinks(thumbnail: "url", smallThumbnail: "url2")))

    override func setUpWithError() throws {

        let storyboard = UIStoryboard.init(name: "Home", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "HomeViewController")
        sut = vc as? HomeViewController
        sut.loadViewIfNeeded()
    }

    
    func testTableViewNotNilWhenViewIsLoaded(){
        XCTAssertNotNil(sut.tableView)
    }
    
    func testTableViewNumberOfRowsIsZeroWhenSearchBarIsEmpty() {
        sut.searchBar.text = ""
        XCTAssertEqual(sut.tableView.numberOfRows(inSection: 0), 0)
    }
    
    func testTableViewNumberOfRowsIsNotZeroWhenSearchBarIsNotEmpty() {
        sut.searchBar.text = "pro"
        XCTAssertEqual(sut.tableView.numberOfRows(inSection: 0), sut.books.count)
    }
    
    func testTableViewSectionZeroNumberOfRowsIsOne(){
        sut.books.append(item)
        XCTAssertEqual(sut.tableView.numberOfRows(inSection: 0), 1)
    }
    
    func testTableViewCellForRowAtIndexPathReturnsHomeTableViewCell(){
        sut.books.append(item)
        sut.tableView.reloadData()
        let  cell = sut.tableView.cellForRow(at: IndexPath(row: 0, section: 0))
        XCTAssertTrue(cell is HomeTableViewCell)
    }
  
}



