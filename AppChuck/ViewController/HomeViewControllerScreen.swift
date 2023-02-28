//
//  HomeViewControllerScreen.swift
//  AppChuck
//
//  Created by Igor Fortti on 28/02/23.
//

import UIKit

class HomeViewControllerScreen: UIView {
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.separatorStyle = .singleLine
        tableView.separatorInset = .zero
        tableView.register(CategoryTableViewCell.self, forCellReuseIdentifier: CategoryTableViewCell.identifier)
        return tableView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        addElements()
        configConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addElements() {
        addSubview(tableView)
    }
    
    func configConstraints() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 10),
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
}
