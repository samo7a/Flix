//
//  MovieDetailsViewController.swift
//  Flix
//
//  Created by Ahmed  Elshetany  on 9/15/21.
//

import UIKit
import AlamofireImage

class MovieDetailsViewController: UIViewController {
    
    
    @IBOutlet weak var details: UILabel!
    @IBOutlet weak var header: UILabel!
    @IBOutlet weak var backDrop: UIImageView!
    @IBOutlet weak var poster: UIImageView!
    
    var movie : [String:Any]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(movie["title"] ?? "Unknown Value")
        // Do any additional setup after loading the view.
        header.text = movie["title"] as? String
        header.sizeToFit()
        details.text = movie["overview"] as? String
        details.sizeToFit()
        
        let baseUrl = "https://image.tmdb.org/t/p/w185"
        let baseUrl2 = "https://image.tmdb.org/t/p/w780"
        let posterPath = movie["poster_path"] as! String
        let url = URL(string: baseUrl + posterPath)!
        
        poster?.af.setImage(withURL: url);
        
        let backPath = movie["backdrop_path"] as! String
        let url2 = URL(string: baseUrl2 + backPath)!
        
        backDrop?.af.setImage(withURL: url2);

        
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
