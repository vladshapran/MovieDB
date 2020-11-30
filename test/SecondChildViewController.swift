//
//  SecondChildViewController.swift
//  test
//
//  Created by Vladislav Shapran on 30.11.2020.
//

import UIKit

class SecondChildViewController: UIViewController{
    
    let tableView = UITableView()
    let movieCell = "CustomTableViewCell"
    var favMovie = [Movie]()
    var delegate: FavouriteMovieDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Favourites"
        createTableView()
        
    }
    override func viewDidAppear(_ animated: Bool) {
        if let favouriteMoie = self.delegate?.favouriteMovies() {
            self.favMovie = favouriteMoie
        }
    }
    
    func createTableView() {
        view.addSubview(tableView)
        tableView.register(UINib.init(nibName: movieCell, bundle: nil), forCellReuseIdentifier: movieCell)
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
      
    }
}

extension SecondChildViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return favMovie.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomTableViewCell", for: indexPath) as! CustomTableViewCell
        cell.nameMovie.text = favMovie[indexPath.row].original_title
        
        return cell
    }
     func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
}
