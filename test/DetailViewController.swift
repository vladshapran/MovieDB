//
//  DetailViewController.swift
//  test
//
//  Created by Vladislav Shapran on 30.11.2020.
//

import UIKit

class DetailViewController: UIViewController {
    
    
    var movie: Movie?
    
    @IBOutlet var image: UIImageView?
    @IBOutlet var descriptions: UILabel!
    @IBOutlet var releaseData: UILabel!

    override func viewDidLoad() {
        
        
        super.viewDidLoad()
        self.title = movie?.original_title
        descriptions.text = "Описание" + (movie?.overview ?? " ")
        releaseData.text = "Дата релиза: " + (movie?.release_date ?? " ")
        
        let url = URL(string: "https://image.tmdb.org/t/p/w500/"  + (movie?.backdrop_path ?? " " )) ?? nil
        if let data = try? Data(contentsOf: url!) {
            image?.image = UIImage(data: data)
        }
    }
    


}
