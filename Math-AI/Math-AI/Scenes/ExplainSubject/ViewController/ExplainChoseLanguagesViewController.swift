//
//  ExplainChoseLanguagesViewController.swift
//  Math-AI
//
//  Created by Fatih on 20.06.2024.
//

import Foundation
import UIKit

protocol ExplainChoseLanguagesViewControllerProtocol {
    func didSelectLanguages(language:String)
}

class ExplainChoseLanguagesViewController: UIViewController {
    
    //MARK: - Properties
    var explainLangugesView = ExplainLanguagesView()
    var explainViewModel = ExplainViewModel()
    var delegate: ExplainChoseLanguagesViewControllerProtocol?
    
    //MARK: - Life Cycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setupDelegate()
        setupRegister()
    }
    
    override func loadView() {
        super.loadView()
        view = explainLangugesView
    }
}

//MARK: - SetupUI
extension ExplainChoseLanguagesViewController {
    
    func setupRegister() {
        explainLangugesView.explainLanguagesCollectionView.register(ExplainChoseLanguagesCell.self, forCellWithReuseIdentifier: ExplainChoseLanguagesCell.identifier)
        
    }
    
    func setupDelegate() {
        explainLangugesView.explainLanguagesCollectionView.dataSource = self
        explainLangugesView.explainLanguagesCollectionView.delegate = self
        
    }
}

//MARK: - Configure CollectionView
extension ExplainChoseLanguagesViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return explainViewModel.languages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ExplainChoseLanguagesCell.identifier, for: indexPath) as! ExplainChoseLanguagesCell
        let model = explainViewModel.languages[indexPath.item].languages
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
        let model = explainViewModel.languages[indexPath.item].languages
        delegate?.didSelectLanguages(language: model)
        dismiss(animated: true, completion: nil)
    }
    
    
}
