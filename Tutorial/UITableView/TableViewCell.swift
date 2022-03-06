//
//  TableViewCell.swift
//  Tutorial
//
//  Created by BH on 2022/03/06.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    lazy var blueView: UIView = {
        let view = UIView()
        view.backgroundColor = .blue
        return view
    }()
    
    lazy var label : UILabel = {
        let label = UILabel()
        label.text = "TableViewCell Test"
        label.textColor = UIColor.gray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addContentView()
        autoLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addContentView() {
        contentView.addSubview(blueView)
        contentView.addSubview(label)
    }
    
    private func autoLayout() {
        
        blueView.snp.makeConstraints {
            $0.leading.equalTo(30)
            $0.centerY.equalToSuperview()
            $0.size.width.height.equalTo(100)
        }
        
        label.snp.makeConstraints {
            $0.leading.equalTo(blueView.snp.trailing).offset(20)
            $0.top.equalTo(blueView.snp.centerY)
        }
    }
    
}
