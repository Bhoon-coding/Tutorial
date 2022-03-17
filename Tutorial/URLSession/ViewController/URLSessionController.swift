//
//  MovieViewController.swift
//  Tutorial
//
//  Created by BH on 2022/03/16.
//

import UIKit

import SnapKit

class UrlSessionViewController: UIViewController {
    
    // MARK: Properties
    
    var movieLists: [Movie] = []

    lazy var movieListCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .white
        return collectionView
    }()
    
    // MARK: LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpUI()
        setUpLayout()
        getMovieData()
//        movieListCollectionView.reloadData()
        
    }
    
    // MARK: Methods
    
    func setUpUI() {
        
        view.addSubview(movieListCollectionView)
        
        movieListCollectionView.dataSource = self
        movieListCollectionView.delegate = self
        movieListCollectionView.register(movieListCollectionViewCell.self, forCellWithReuseIdentifier: movieListCollectionViewCell.identifier)
        
        
    }
    
    func setUpLayout() {
        
        movieListCollectionView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            movieListCollectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            movieListCollectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            movieListCollectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            movieListCollectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
        ])
    }
    
    func getMovieData() {
        MovieService.shared.fetchMovieData { (response) in
            switch response {
            case .success(let movieData):
                
                if let decodedData = movieData as? MovieModel {
                    self.movieLists = decodedData.items
                    print("통신성공: \(decodedData)")
                    DispatchQueue.main.async {
                        self.movieListCollectionView.reloadData()
                    }
                    return
                }
            case .failure(let movieData):
                print("fail", movieData)
            }
        }
    }

}

extension UrlSessionViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movieLists.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: movieListCollectionViewCell.identifier, for: indexPath) as! movieListCollectionViewCell
        
        let movieList = movieLists[indexPath.row]
        cell.setUpCell(with: movieList)
        cell.backgroundColor = .red
        return cell
    }
    
    
}

extension UrlSessionViewController: UICollectionViewDelegate {
    
}

extension UrlSessionViewController: UICollectionViewDelegateFlowLayout {
    
    private enum LayoutConstant {
        static let spacing: CGFloat = 16.0
        static let itemHeight: CGFloat = 300.0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = itemWidth(for: view.frame.width, spacing: 0)
        
        return CGSize(width: width, height: LayoutConstant.itemHeight)
    }
    
    func itemWidth(for width: CGFloat, spacing: CGFloat) -> CGFloat {
        let itemsInRow: CGFloat = 2
        
        let totalSpacing: CGFloat = 2 * spacing + (itemsInRow - 1) * spacing
        let finalWidth = (width - totalSpacing) / itemsInRow
        
        return finalWidth - 5.0
    }
}
