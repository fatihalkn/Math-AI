//
//  LanguagesViewController.swift
//  Math-AI
//
//  Created by Fatih on 11.06.2024.
//

import Foundation
import UIKit

protocol LanguagesViewControllerProtocol {
    func didSelectLanguage(language: String)
}
class LanguagesViewController: UIViewController {
    
    //MARK: - Properties
    var languagesView = LanguagesView()
    var languagesViewModel = LanguagesViewModel()
    var delegate: LanguagesViewControllerProtocol?
    
    //MARK: - Life Cycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setupDelegate()
        setupRegister()
    }
    
    override func loadView() {
        super.loadView()
        view = languagesView
    }
}

//MARK: - SetupUI
extension LanguagesViewController {
    
    func setupDelegate() {
        languagesView.languagesCollectionView.dataSource = self
        languagesView.languagesCollectionView.delegate = self
    }
    
    func setupRegister() {
        languagesView.languagesCollectionView.register(LanguagesCollectionViewCell.self, forCellWithReuseIdentifier: LanguagesCollectionViewCell.identifier)
    }
}

//MARK: - Configure CollectionView

extension LanguagesViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        languagesViewModel.languages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: LanguagesCollectionViewCell.identifier, for: indexPath) as! LanguagesCollectionViewCell
        let model = languagesViewModel.languages[indexPath.item].languags
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
        let model = languagesViewModel.languages[indexPath.item].languags
        delegate?.didSelectLanguage(language: model)
        dismiss(animated: true, completion: nil)
    }
    
    
}
