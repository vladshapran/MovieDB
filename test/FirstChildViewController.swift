//
//  ViewController.swift
//  test
//
//  Created by Vladislav Shapran on 30.11.2020.
//

import UIKit

protocol FavouriteMovieDelegate {
    func favouriteMovies() -> [Movie]
}


class FirstChildViewController: UIViewController, FavouriteMovieDelegate  {
    
    
      
    @IBOutlet var tableView: UITableView!
    
    var favouriteMovie = [Movie]()
    var movie: Result?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dowloandMovies()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.title = "List"
        let longPressRecognizer = UILongPressGestureRecognizer(target: self, action: #selector(longPressed(sender:)))
        self.view.addGestureRecognizer(longPressRecognizer)
        
    }
    func favouriteMovies() -> [Movie] {
        return self.favouriteMovie
    }
    
    @objc func longPressed(sender: UILongPressGestureRecognizer) {

        if sender.state == UIGestureRecognizer.State.began {

            let touchPoint = sender.location(in: self.tableView)
            if let indexPath = tableView.indexPathForRow(at: touchPoint) {
                favouriteMovie.append((movie?.results[indexPath.row])!)
                print(favouriteMovie)
            }
        }
    }
    func dowloandMovies(){
        let urlString = "https://api.themoviedb.org/3/movie/popular?api_key=505cc219eeba7ba5c8c15a6d0a5b3779&language=en-US&page=1"
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else { return}
            guard error == nil else { return}
        do {

            let dowloandMovie = try JSONDecoder().decode(Result.self, from: data)
            self.movie = dowloandMovie
    
            DispatchQueue.main.async {
                self.tableView?.reloadData()
            }
            
        } catch let error {
            print(error)
            }
        }.resume()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
           guard segue.identifier == "Demo" else { return }
           guard let destination = segue.destination as? DemoViewController else { return }
           destination.favMovie = favouriteMovie
       }
  //  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
  //      if let secVC = segue.destination as? DemoViewController {
  //              secVC.delegate = self
 //           }
  //      }

}

extension FirstChildViewController: UITableViewDelegate, UITableViewDataSource, UITabBarDelegate, UITabBarControllerDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movie?.results.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = movie?.results[indexPath.row].original_title
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailVC = storyboard?.instantiateViewController(identifier: "DetailVC") as! DetailViewController
        detailVC.movie = movie?.results[indexPath.row]
        self.navigationController?.pushViewController(detailVC, animated: true)
    }
}
