//
//  ViewController.swift
//  SearchBar
//
//  Created by Ankit Maurya  on 07/12/24.
//

import UIKit

class ViewController: UIViewController {
    
    private let searchBarView: SearchBarView = {
        let view = SearchBarView()
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupUI()
    }
    
    private func setupUI() {
        view.addSubview(searchBarView)
        setupConstraints()
    }
    
    private func setupConstraints() {
        searchBarView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            searchBarView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            searchBarView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            searchBarView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            searchBarView.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
}

