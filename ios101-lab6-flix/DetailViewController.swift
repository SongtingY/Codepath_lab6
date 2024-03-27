//
//  DetailViewController.swift
//  ios101-lab6-flix
//
//  Created by songting yang on 3/26/24.
//

import UIKit
import Nuke

class DetailViewController: UIViewController {
    
    @IBOutlet weak var backdropImageView: UIImageView!
    
    @IBOutlet weak var posterImageView: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var overviewLabel: UILabel!
    
    @IBOutlet weak var voteLabel: UILabel!
    
    @IBOutlet weak var releaseDateLabel: UILabel!
    
    var movie: Movie!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleLabel.text = movie.title
        overviewLabel.text = movie.overview
        
//        unwrap the optional vote average
        if let voteAverage = movie.voteAverage{
            voteLabel.text = "Vote average: \(voteAverage)"
        }else{
            voteLabel.text = ""
        }
        
        let dateFormatter = DateFormatter()
        
        dateFormatter.dateStyle = .medium
        
        if let releaseDate = movie.releaseDate{
            let releaseDateString = dateFormatter.string(from: releaseDate)
            releaseDateLabel.text = "Release Date: \(releaseDateString)"
        }else{
            releaseDateLabel.text = ""
        }
        
        if let posterPath = movie.posterPath, let imageUrl = URL(string: "https://image.tmdb.org/t/p/w500" + posterPath) {
            Nuke.loadImage(with: imageUrl, into: posterImageView)
        }
        
        if let backdropPath = movie.backdropPath, let imageUrl = URL(string: "https://image.tmdb.org/t/p/w500" + backdropPath) {
            Nuke.loadImage(with: imageUrl, into: backdropImageView)
        }
        navigationItem.largeTitleDisplayMode = .never
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
