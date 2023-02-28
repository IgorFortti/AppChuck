//
//  CategoryTableViewCell.swift
//  AppChuck
//
//  Created by Igor Fortti on 28/02/23.
//

import UIKit

class CategoryTableViewCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    
    static let identifier: String = String(describing: CategoryTableViewCell.self)
    
    static func nib() -> UINib {
        return UINib(nibName: identifier, bundle: nil)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    public func setupCell(data: String){
        self.titleLabel.text = data
    }
    
}
