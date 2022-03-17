//
//  MovieViewController.swift
//  Tutorial
//
//  Created by BH on 2022/03/16.
//

import UIKit

class UrlSessionViewController: UIViewController {
    
    // MARK: Properties
    
    var movieList: [Movie] = []

    // MARK: LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    // MARK: Methods
    
    func getMovieData() {
        MovieService.shared.fetchMovieData { (response) in
            switch response {
            case .success(let movieData):
                if let decodedData = movieData as? MovieModel {
                    self.movieList = decodedData.items
//                    DispatchQueue.main.async {
//                        <#code#>
//                    }
                    return
                }
            case .failure(let movieData):
                print("fail", movieData)
            }
        }
    }

}
