//
//  TopicsViewController.swift
//  Math-AI
//
//  Created by Fatih on 13.06.2024.
//

import Foundation
import UIKit

class TopicsViewController: UIViewController {
    
    //MARK: - Properties
    var topicsView = TopicsView()
    var topicsViewModel = TopicsViewModel()
    
    //MARK: - Life Cycle Methods
    override func loadView() {
        super.loadView()
        view = topicsView
        setupUI()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

//MARK: - Configure TableView
extension TopicsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func setupUI() {
        topicsViewModel.configureTableViewItems()
        setupRegister()
        setupDelegate()
    }
    
    
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let section = topicsViewModel.topics[section]
        return section.title
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return topicsViewModel.topics.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return topicsViewModel.topics[section].topics.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TopicsTableViewCell.identifier, for: indexPath) as! TopicsTableViewCell
        let topicsItem = topicsViewModel.topics[indexPath.section].topics[indexPath.row]
        cell.configure(with: topicsItem)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 75
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let itemType = topicsViewModel.topics[indexPath.section].topics[indexPath.row]
        itemType.handler()
    }
    
    
    func setupRegister() {
        topicsView.topicsTableView.register(TopicsTableViewCell.self, forCellReuseIdentifier: TopicsTableViewCell.identifier)
    }
    
    func setupDelegate() {
        topicsView.topicsTableView.dataSource = self
        topicsView.topicsTableView.delegate = self
    }
    
    
    
    
}
