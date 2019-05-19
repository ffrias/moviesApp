//
//  ViewController.swift
//  moviesApp
//
//  Created by Federico Frias on 19/05/2019.
//  Copyright © 2019 ffrias. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var moviesTableView: UITableView!
    @IBOutlet weak var categoriesSegmentedController: UISegmentedControl!
    @IBOutlet weak var searchBar: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.updateMovies), name: NSNotification.Name(rawValue: APICli.getMoviesNotification), object: nil)
    
        moviesTableView.dataSource = self
        moviesTableView.delegate = self
        
        searchBar.delegate = self
        
        getMovies()
    }
    
    func getMovies(){
        APICli.sharedInstance.getMovies(category: .popular)
    }
    
    @objc func updateMovies(){
        moviesTableView.reloadData()
    }
    
    @IBAction func indexChanged(_ sender: Any) {
        switch categoriesSegmentedController.selectedSegmentIndex
        {
        case 0:
            APICli.sharedInstance.getMovies(category: .popular)
        case 1:
        APICli.sharedInstance.getMovies(category: .topRated)
        case 2:
            APICli.sharedInstance.getMovies(category: .upcoming)
        default:
            break
        }
    }
}

//MARK - Table View Delegate & DataSource
extension ViewController:UITableViewDelegate{
}

extension ViewController:UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return APICli.sharedInstance.movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = moviesTableView.dequeueReusableCell(withIdentifier: "MovieTableViewCell") as! MovieTableViewCell
        let title = APICli.sharedInstance.movies[indexPath.row].title
        let imgPath = APICli.sharedInstance.movies[indexPath.row].posterPath
        
        cell.loadData(title: title!, imgPath: imgPath!)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let movieSelected = APICli.sharedInstance.movies[indexPath.row]
        AppManager.sharedInstance.presentMovieDetailScreen(self, movie: movieSelected)
    }
}

//MARK: Search bar delegate
extension ViewController: UISearchBarDelegate{
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        APICli.sharedInstance.searchMovies(searchQuery: searchText)
        searchBar.showsCancelButton = true
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        self.searchBar.resignFirstResponder()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        APICli.sharedInstance.resetFilter()
        searchBar.text = ""
        searchBar.showsCancelButton = false
    }
}
