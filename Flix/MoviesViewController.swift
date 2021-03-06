//
//  MoviesViewController.swift
//  Flix
//
//  Created by Ahmed  Elshetany  on 8/30/21.
//

import UIKit
import AlamofireImage

class MoviesViewController: UIViewController , UITableViewDataSource, UITableViewDelegate{
    
    var movies = [[String:Any]]()
    @IBOutlet weak var TableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        TableView.dataSource = self
        TableView.delegate = self
        
        // Do any additional setup after loading the view.
        let url = URL(string: "https://api.themoviedb.org/3/movie/now_playing?api_key=a07e22bc18f5cb106bfe4cc1f83ad8ed")!
        let request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
        let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
        let task = session.dataTask(with: request) { (data, response, error) in
             // This will run when the network request returns
             if let error = error {
                    print(error.localizedDescription)
             } else if let data = data {
                    let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
                    //print(dataDictionary)
                    // TODO: Get the array of movies
                self.movies = dataDictionary["results"] as! [[String:Any]]
                    // TODO: Store the movies in a property to use elsewhere
                    // TODO: Reload your table view data
                self.TableView.reloadData()
             }
        }
        task.resume()
        
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell") as! MovieCell
        
        let movie = movies[indexPath.row]
        let title = movie["title"] as! String
        let overview = movie["overview"] as! String
        let baseUrl = "https://image.tmdb.org/t/p/w185"
        let posterPath = movie["poster_path"] as! String
        let url = URL(string: baseUrl + posterPath)!
        cell.title?.text = title
        cell.overview?.text = overview
        cell.poster?.af.setImage(withURL: url);
        
        return cell
    }
    
     //MARK: - Navigation

     //In a storyboard-based application, you will often want to do a little preparation before navigation
    //sender is the cell
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//         Get the new view controller using segue.destination.
//         Pass the selected object to the new view controller.
//        print ("loading up the details screen")
        
        //find the selected movie
        let cell = sender as! UITableViewCell
        let indexPath = TableView.indexPath(for: cell)!
        let movie = movies[indexPath.row]
        //pass the selected movie to the details view controller
        let detatilsViewController = segue.destination as! MovieDetailsViewController
        detatilsViewController.movie = movie
        
        TableView.deselectRow(at: indexPath, animated: true)
    }
    

}
