//
//  TopicsView.swift
//  Math-AI
//
//  Created by Fatih on 13.06.2024.
//

import Foundation
import UIKit

class TopicsView: UIView {
    //MARK: - Properties
    
    //MARK: - Init Methods
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    
    //MARK: - UI Elements
    let topicsTableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .insetGrouped)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.separatorColor = .black
        tableView.separatorStyle = .singleLine
        return tableView
    }()
}

//MARK: - UI Elements
extension TopicsView {
    func setupUI() {
        backgroundColor = .white
        addSubview(topicsTableView)
        
        NSLayoutConstraint.activate([
            topicsTableView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            topicsTableView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            topicsTableView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            topicsTableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}
