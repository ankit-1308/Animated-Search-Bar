//
//  SearchBarView.swift
//  SearchBar
//
//  Created by Ankit Maurya  on 07/12/24.
//

import UIKit

class SearchBarView: UIView {
    
    private let searchContainer: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 20
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.darkGray.cgColor
        return view
    }()
    
    private let searchIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "magnifyingglass")
        imageView.tintColor = .darkGray
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let searchLabel: UILabel = {
        let label = UILabel()
        label.text = "Search \"Cars\""
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = .darkGray
        return label
    }()
    
    private let heartButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "heart"), for: .normal)
        button.tintColor = .darkGray
        return button
    }()
    
    private let notificationButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "bell"), for: .normal)
        button.tintColor = .darkGray
        return button
    }()
    
    private let words = ["Cars", "Properties", "Mobiles", "Bikes", "Jobs"]
    private var currentIndex = 0
    private var timer: Timer?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setupConstraints()
        startTextAnimation()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
        setupConstraints()
        startTextAnimation()
    }
    
    private func setupView() {
        addSubview(searchContainer)
        searchContainer.addSubview(searchIcon)
        searchContainer.addSubview(searchLabel)
        addSubview(heartButton)
        addSubview(notificationButton)
    }
    
    private func setupConstraints() {
        searchContainer.translatesAutoresizingMaskIntoConstraints = false
        searchIcon.translatesAutoresizingMaskIntoConstraints = false
        searchLabel.translatesAutoresizingMaskIntoConstraints = false
        heartButton.translatesAutoresizingMaskIntoConstraints = false
        notificationButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            searchContainer.leadingAnchor.constraint(equalTo: leadingAnchor),
            searchContainer.centerYAnchor.constraint(equalTo: centerYAnchor),
            searchContainer.heightAnchor.constraint(equalToConstant: 40),
            
            searchIcon.leadingAnchor.constraint(equalTo: searchContainer.leadingAnchor, constant: 8),
            searchIcon.centerYAnchor.constraint(equalTo: searchContainer.centerYAnchor),
            searchIcon.widthAnchor.constraint(equalToConstant: 20),
            searchIcon.heightAnchor.constraint(equalToConstant: 20),
            
            searchLabel.leadingAnchor.constraint(equalTo: searchIcon.trailingAnchor, constant: 8),
            searchLabel.trailingAnchor.constraint(equalTo: searchContainer.trailingAnchor, constant: -8),
            searchLabel.centerYAnchor.constraint(equalTo: searchContainer.centerYAnchor),
            
            heartButton.leadingAnchor.constraint(equalTo: searchContainer.trailingAnchor, constant: 16),
            heartButton.centerYAnchor.constraint(equalTo: centerYAnchor),
            heartButton.widthAnchor.constraint(equalToConstant: 24),
            heartButton.heightAnchor.constraint(equalToConstant: 24),
            
            notificationButton.leadingAnchor.constraint(equalTo: heartButton.trailingAnchor, constant: 16),
            notificationButton.trailingAnchor.constraint(equalTo: trailingAnchor),
            notificationButton.centerYAnchor.constraint(equalTo: centerYAnchor),
            notificationButton.widthAnchor.constraint(equalToConstant: 24),
            notificationButton.heightAnchor.constraint(equalToConstant: 24)
        ])
    }
    
    private func startTextAnimation() {
        timer = Timer.scheduledTimer(withTimeInterval: 2.0, repeats: true) { [weak self] _ in
            guard let self = self else { return }
            self.animateTextTransition()
        }
    }
    
    private func animateTextTransition() {
        guard !words.isEmpty else { return }
        currentIndex = (currentIndex + 1) % words.count
        let nextWord = "Search \"\(words[currentIndex])\""
        
        UIView.transition(with: searchLabel, duration: 0.5, options: .transitionCrossDissolve, animations: {
            self.searchLabel.text = nextWord
        }, completion: nil)
    }
    
    deinit {
        timer?.invalidate()
    }
}

