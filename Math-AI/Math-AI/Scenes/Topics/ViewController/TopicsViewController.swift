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
    var topicsHeaderView = TableViewHeaderView()
    var favoriteSubjectTypes: [SubjectItemType] = []
    var topicType: SubjectItemType?
    
    
    //MARK: - Life Cycle Methods
    override func loadView() {
        super.loadView()
        view = topicsView
        setupUI()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupRegister()
        setupDelegate()
        self.favoriteSubjectTypes = CoreDataModel.shared.fetchGetCoreData()
        updateEmptyStateLabel()
        setupNavigation()
        configureNavigationBar()
               
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    func updateFavoriteCollectionView() {
            self.favoriteSubjectTypes = CoreDataModel.shared.fetchGetCoreData()
            self.topicsHeaderView.favoriteCollectionView.reloadData()
            self.topicsView.topicsTableView.reloadData()
            updateEmptyStateLabel()
        }
        
    func setupRegister() {
        topicsView.topicsTableView.register(TopicsTableViewCell.self, forCellReuseIdentifier: TopicsTableViewCell.identifier)
        topicsHeaderView.favoriteCollectionView.register(TableHeaderViewCell.self, forCellWithReuseIdentifier: TableHeaderViewCell.identifier)
    }
    
    func setupDelegate() {
        topicsView.topicsTableView.dataSource = self
        topicsView.topicsTableView.delegate = self
        
        topicsHeaderView.favoriteCollectionView.dataSource = self
        topicsHeaderView.favoriteCollectionView.delegate = self
    }
    
    func updateEmptyStateLabel() {
        if favoriteSubjectTypes.isEmpty {
            topicsHeaderView.showEmptyStateLabel()
        } else {
            topicsHeaderView.hideEmptyStateLabel()
        }
    }
    
    func setupNavigation() {
        let topicsTitle = UIBarButtonItem(title: "Konular")
        navigationItem.leftBarButtonItem = topicsTitle
    }
    
    func configureNavigationBar() {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = .white
        appearance.titleTextAttributes = [.foregroundColor: UIColor.black]
        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.black]
        
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        navigationController?.navigationBar.compactAppearance = appearance
        navigationController?.navigationBar.tintColor = .black
    }
}

//MARK: - Configure TableView
extension TopicsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func setupUI() {
        topicsViewModel.configureTableViewItems()
        
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 0 {
            let header = topicsHeaderView
            tableView.sectionHeaderTopPadding = 20
            return header
        } else {
            return nil
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 {
            return 100
        } else {
            return 30
        }
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
        
        if favoriteSubjectTypes.contains(topicsItem.type) {
            cell.favoriteButton.setImage(.iconsMathSolverFavoriteFill, for: .normal)
        } else {
            cell.favoriteButton.setImage(.iconsMathSolverFavorite, for: .normal)
        }
        
        cell.delegate = self
        cell.topicType = topicsItem.type

        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 75
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let itemType = topicsViewModel.topics[indexPath.section].topics[indexPath.row].type
        switch itemType {
        case .ask:
            let itemTitle = topicsViewModel.topics[indexPath.section].topics[indexPath.row].title
            let vc = AskSubjectViewController()
            vc.title = itemTitle
            navigationController?.pushViewController(vc, animated: true)
        case .explain:
            print("soru")
        case .knowledgeCompetition:
            print("soru")
        case .attempt:
            print("soru")
        case .poem:
            print("soru")
        case .blog:
            print("soru")
        case .paragraph:
            print("soru")
        case .lyrics:
            print("soru")
        case .stroy:
            print("soru")
        case .writeCode:
            print("soru")
        case .checkCode:
            print("soru")
        case .optimizeCode:
            print("soru")
        case .explaneCode:
            print("soru")
        case .writeEmail:
            print("soru")
        case .emailSubject:
            print("soru")
        case .ımproveEmail:
            print("soru")
        case .simplify:
            print("soru")
        case .improve:
            print("soru")
        case .keepWriting:
            print("soru")
        case .shorten:
            print("soru")
        case .grammar:
            print("soru")
        case .translate:
            print("soru")
        case .summarizeText:
            print("soru")
        case .summarizeBook:
            print("soru")
        case .extractKeywords:
            print("soru")
        }
        
    }
    
    
    
}

//MARK: - Configure TableViewHeader CollectionView
extension TopicsViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return favoriteSubjectTypes.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TableHeaderViewCell.identifier, for: indexPath) as! TableHeaderViewCell
        let itemType = favoriteSubjectTypes[indexPath.item]
        cell.configure(with: itemType)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cellWidth: CGFloat = 60
        let cellHeight: CGFloat = 60
        return .init(width: cellWidth, height: cellHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath)
    }

}

//MARK: - TopicsTableViewCellProtocol
extension TopicsViewController: TopicsTableViewCellProtocol {
    func didTappedFavoriteButton(topicType: SubjectItemType) {
        
        if favoriteSubjectTypes.contains(topicType) {
            CoreDataModel.shared.deleteTopics(withTitle: topicType)
        } else {
            CoreDataModel.shared.saveTopics(topicType: topicType)
            
        }
        updateFavoriteCollectionView()
       
    }
}
