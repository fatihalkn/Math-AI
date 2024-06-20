//
//  KnowledgeCompetitionDifficultyViewController.swift
//  Math-AI
//
//  Created by Fatih on 20.06.2024.
//

import Foundation
import UIKit

protocol KnowledgeCompetitionDifficultyViewControllerProtocol {
    func didSelectDifficulty(difficulty: String)
}

class KnowledgeCompetitionDifficultyViewController: UIViewController {
    
    //MARK: - Properties
    var knowLedgeViewModel = KnowledgeCompetitionViewModel()
    var knowledgeCompetitionDifficultyView = KnowledgeCompetitionDifficultyView()
    var delegate: KnowledgeCompetitionDifficultyViewControllerProtocol?
    
    
    //MARK: - Life Cycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setupDelegate()
        setupRegister()
    }
    
    override func loadView() {
        super.loadView()
        view = knowledgeCompetitionDifficultyView
    }
}

//MARK: - SetupUI
extension KnowledgeCompetitionDifficultyViewController {
    
    func setupDelegate() {
        knowledgeCompetitionDifficultyView.knowLedgeCompetitionDifficultyCollectionView.dataSource = self
        knowledgeCompetitionDifficultyView.knowLedgeCompetitionDifficultyCollectionView.delegate = self
    }
    
    func setupRegister() {
        knowledgeCompetitionDifficultyView.knowLedgeCompetitionDifficultyCollectionView.register(KnowledgeCompetitionDifficultyCell.self, forCellWithReuseIdentifier: KnowledgeCompetitionDifficultyCell.identifier)
    }
    
}

//MARK: - Configure CollectionView

extension KnowledgeCompetitionDifficultyViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        knowLedgeViewModel.difficultyChoice.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: KnowledgeCompetitionDifficultyCell.identifier, for: indexPath) as! KnowledgeCompetitionDifficultyCell
        let model = knowLedgeViewModel.difficultyChoice[indexPath.item].difficulty
        cell.languages.text = model
        cell.layer.cornerRadius = 12
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cellWitdh: CGFloat = collectionView.frame.width - 40
        let cellHeigth: CGFloat = (collectionView.frame.height - 200) / 3
        return .init(width: cellWitdh, height: cellHeigth)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let model = knowLedgeViewModel.difficultyChoice[indexPath.item].difficulty
        delegate?.didSelectDifficulty(difficulty: model)
        dismiss(animated: true, completion: nil)
    }
    
}

    

