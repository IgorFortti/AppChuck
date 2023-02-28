//
//  CategoryTableViewCell.swift
//  AppChuck
//
//  Created by Igor Fortti on 28/02/23.
//

import UIKit

class CategoryTableViewCell: UITableViewCell {
    
    static let identifier: String = "CategoryTableViewCell"
    
    var screen: CategoryTableViewCellScreen = CategoryTableViewCellScreen()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configScreen()
     }

     required init?(coder aDecoder: NSCoder) {
       super.init(coder: aDecoder)
    }
   
    public func configScreen() {
        contentView.addSubview(screen)
        screen.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            screen.topAnchor.constraint(equalTo: contentView.topAnchor),
            screen.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            screen.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            screen.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
        ])
    }
    
    public func setupCell(data: String){
        screen.titleLabel.text = data
    }
    
}
