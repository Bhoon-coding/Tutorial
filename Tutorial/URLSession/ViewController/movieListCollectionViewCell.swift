//
//  movieListCollectionViewCell.swift
//  Tutorial
//
//  Created by BH on 2022/03/17.
//

import UIKit

import SnapKit

class movieListCollectionViewCell: UICollectionViewCell {
    
    // MARK: Properties
    
    static let identifier = "movieListCollectionViewCell"
    
    lazy var movieImageView: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    lazy var movieTitleLabel: UILabel = {
        let label = UILabel(frame: .zero)
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: Methods
    
    func setUpCell(with movies: Movie) {
        
        movieImageView.image = UIImage(named: movies.image)
        movieTitleLabel.text = movies.title
        
        contentView.addSubview(movieImageView)
        contentView.addSubview(movieTitleLabel)
//        movieTitleLabel.snp.makeConstraints {
//            $0.leading.top.equalToSuperview()
//        }
    }
}
