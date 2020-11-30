//
//  DemoViewController.swift
//  test
//
//  Created by Vladislav Shapran on 30.11.2020.
//

import UIKit

class DemoViewController: UIViewController {
    @IBOutlet var tableView3: UITableView!

    var favMovie = [Movie]()
    
    var delegate: FavouriteMovieDelegate?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView3.register(UINib.init(nibName: "CustomTableViewCell", bundle: nil), forCellReuseIdentifier: "CustomTableViewCell")
        tableView3.delegate = self
        tableView3.dataSource = self
        
        let longPressRecognizer = UILongPressGestureRecognizer(target: self, action: #selector(longPressed(sender:)))
        self.view.addGestureRecognizer(longPressRecognizer)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if let favouriteMoie = self.delegate?.favouriteMovies() {
            self.favMovie = favouriteMoie
        }
    }

    @objc func longPressed(sender: UILongPressGestureRecognizer) {

        if sender.state == UIGestureRecognizer.State.began {

            let touchPoint = sender.location(in: self.tableView3)
            if let indexPath = tableView3.indexPathForRow(at: touchPoint) {
                favMovie.remove(at: indexPath.row)
                tableView3.reloadData()
            }
        }
    }

    
}
 
extension DemoViewController: UITableViewDelegate, UITableViewDataSource {
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailVC = storyboard?.instantiateViewController(identifier: "Demo") as! SecondDetailViewController
        detailVC.movie = favMovie[indexPath.row]
        self.navigationController?.pushViewController(detailVC, animated: true)
    }
    
}
