//
//  KnowledgeCompetitionLanguagesViewController.swift
//  Math-AI
//
//  Created by Fatih on 20.06.2024.
//

import Foundation
import UIKit

protocol KnowledgeCompetitionLanguagesViewControllerProtocol {
    func didSelectLanguage(language: String)
}

class KnowledgeCompetitionLanguagesViewController: UIViewController {
    
    //MARK: - Properties
    var knowLedgeViewModel = KnowledgeCompetitionViewModel()
    var knowLedgeCompetitionLanguagesView = KnowledgeCompetitionLanguageView()
    var delegate: KnowledgeCompetitionLanguagesViewControllerProtocol?
    
    
    //MARK: - Life Cycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setupDelegate()
        setupRegister()
    }
    
    override func loadView() {
        super.loadView()
        view = knowLedgeCompetitionLanguagesView
    }
}

//MARK: - SetupUI
extension KnowledgeCompetitionLanguagesViewController {
    
    func setupDelegate() {
        knowLedgeCompetitionLanguagesView.knowLedgeCompetitionLanguageCollectionView.dataSource = self
        knowLedgeCompetitionLanguagesView.knowLedgeCompetitionLanguageCollectionView.delegate = self
    }
    
    func setupRegister() {
        knowLedgeCompetitionLanguagesView.knowLedgeCompetitionLanguageCollectionView.register(KnowledgeCompetitionLanguageCell.self, forCellWithReuseIdentifier: KnowledgeCompetitionLanguageCell.identifier)
    }
    
}

//MARK: - Configure CollectionView

extension KnowledgeCompetitionLanguagesViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        knowLedgeViewModel.languages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: KnowledgeCompetitionLanguageCell.identifier, for: indexPath) as! KnowledgeCompetitionLanguageCell
        let model = knowLedgeViewModel.languages[indexPath.item].languages
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
        let model = knowLedgeViewModel.languages[indexPath.item].languages
        delegate?.didSelectLanguage(language: model)
        dismiss(animated: true, completion: nil)
    }
    
}
