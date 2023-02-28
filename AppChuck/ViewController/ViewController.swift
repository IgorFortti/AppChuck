//
//  ViewController.swift
//  AppChuck
//
//  Created by Igor Fortti on 28/02/23.
//

import UIKit

class ViewController: UIViewController {
    
    var screen: ViewControllerScreen?
    var viewModel: HomeViewModel = HomeViewModel(service: HomeService())
    
    override func loadView() {
        screen = ViewControllerScreen()
        view = screen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.delegate(delegate: self)
        viewModel.fetchRequest()
    }
}

extension ViewController: HomeViewModelProtocol {
 
    func success() {
        screen?.configTableViewDelegate(delegate: self, dataSource: self)
        screen?.tableView.reloadData()
    }
    
    func error(message: String) {
        print("Deu Ruim: \(message)")
    }
}

extension ViewController: UITableViewDelegate {  }

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRowsInSection
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CategoryTableViewCell.identifier, for: indexPath) as? CategoryTableViewCell
        cell?.setupCell(data: viewModel.loadCurrentCategory(indexPath: indexPath))
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        40
    }
}

