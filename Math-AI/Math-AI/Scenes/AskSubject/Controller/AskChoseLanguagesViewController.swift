//
//  AskChoseLanguagesViewController.swift
//  Math-AI
//
//  Created by Fatih on 18.06.2024.
//

import Foundation
import UIKit
protocol AskChoseLanguagesViewControllerProtocol {
    func didSelectLanguage(language: String)
}
class AskChoseLanguagesViewController: UIViewController {
    
    //MARK: - Properties
    var askChoseLanguagesView = AskChoseLanguagesView()
    var askSubjectViewModel = AskSubjectViewModel()
    var delegate: AskChoseLanguagesViewControllerProtocol?
    
    //MARK: - Life Cycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setupDelegate()
        setupRegister()
    }
    
    override func loadView() {
        super.loadView()
        view = askChoseLanguagesView
    }
}

//MARK: - SetupUI
extension AskChoseLanguagesViewController {
    
    func setupDelegate() {
        askChoseLanguagesView.askSubjectlanguagesCollectionView.dataSource = self
        askChoseLanguagesView.askSubjectlanguagesCollectionView.delegate = self
    }
    
    func setupRegister() {
        askChoseLanguagesView.askSubjectlanguagesCollectionView.register(AskChoseLanguagesCell.self, forCellWithReuseIdentifier: AskChoseLanguagesCell.identifier)
    }
    
}

//MARK: - Configure CollectionView

extension AskChoseLanguagesViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        askSubjectViewModel.languages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AskChoseLanguagesCell.identifier, for: indexPath) as! AskChoseLanguagesCell
        let model = askSubjectViewModel.languages[indexPath.item].languags
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
        let model = askSubjectViewModel.languages[indexPath.item].languags
        delegate?.didSelectLanguage(language: model)
        dismiss(animated: true, completion: nil)
    }
    
    
}

