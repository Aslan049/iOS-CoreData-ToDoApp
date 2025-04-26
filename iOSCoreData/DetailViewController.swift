//
//  DetailViewController.swift
//  iOSCoreData
//
//  Created by Aslan Korkmaz on 26.04.2025.
//

import UIKit

class DetailViewController: UIViewController {
    
    var titleText: String?
    var detailText: String?
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.textColor = .black
        label.numberOfLines = 0
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var detailLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.textColor = .black
        label.numberOfLines = 0
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "To-Do Detail"
        view.backgroundColor = .white
        view.addSubview(titleLabel)
        view.addSubview(detailLabel)
        titleLabel.text = titleText
        detailLabel.text = detailText
        constraints()
        
        //print("Title: \(titleText ?? "No Title")")
        //print("Detail: \(detailText ?? "No Detail")")
        
    }
    
    func constraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            detailLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 50),
            detailLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            detailLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
        ])
    }
}

