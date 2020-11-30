//
//  SecondDetailViewController.swift
//  test
//
//  Created by Vladislav Shapran on 30.11.2020.
//

import UIKit

class SecondDetailViewController: UIViewController {

    @IBOutlet var name: UILabel!
    @IBOutlet var genres: UILabel!
    var movie: Movie?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Detail Info"
        name.text = "Название фильма: " + (movie?.original_title ?? " ")
        
        genres.text = "Жанр: \(String(describing: movie?.genre_ids))"
        
        // Do any additional setup after loading the view.
    }
    

    

}
