//
//  ScanningViewController.swift
//  Math-AI
//
//  Created by Fatih on 10.06.2024.
//

import Foundation
import UIKit
import CropViewController


class ScanningViewController: UIViewController {
    
    //MARK: - Properties
    var scanningView = ScanningView()
    
    var image: UIImage? {
        didSet {
            scanningView.selectedGalleryImageView.image = image
        }
    }
    
    var vcTitle: String? {
        didSet {
            self.navigationItem.title = self.vcTitle
        }
    }
    
    //MARK: - Life Cycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavigationBar()
        tabBarController?.tabBar.isHidden = true
        showCrop(image: scanningView.selectedGalleryImageView.image ?? .imagePlus)
        addTargets()
    }
    
    override func loadView() {
        super.loadView()
        view = scanningView
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupNavigation()
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
        navigationController?.navigationBar.tintColor = .main
    }
    
    func setupNavigation() {
        let backButton = UIBarButtonItem(image: UIImage(systemName: "chevron.backward"), style: .plain, target: self, action: #selector(backButtonTapped))
        navigationItem.leftBarButtonItem = backButton
    }
    
    @objc func backButtonTapped() {
            dismiss(animated: true, completion: nil)
        }
    
    func addTargets() {
        scanningView.cancelButton.addTarget(self, action: #selector(didTapCancelButton), for: .touchUpInside)
    }
    
    @objc func didTapCancelButton() {
        dismiss(animated: true, completion: nil)
    }
    
    func showCrop(image: UIImage) {
        let vc = CropViewController(croppingStyle: .default, image: image)
        vc.aspectRatioPreset = .presetSquare
        vc.aspectRatioLockEnabled = true
        vc.toolbarPosition = .bottom
        vc.doneButtonTitle = "Devam"
        vc.cancelButtonTitle = "İptal"
        vc.delegate = self
        present(vc, animated: true)
    }
}

//MARK: - CropViewControllerDelegate
extension ScanningViewController: CropViewControllerDelegate {
    func cropViewController(_ cropViewController: CropViewController, didFinishCancelled cancelled: Bool) {
        cropViewController.dismiss(animated: true)
    }
    
    func cropViewController(_ cropViewController: CropViewController, didCropToImage image: UIImage, withRect cropRect: CGRect, angle: Int) {
        cropViewController.dismiss(animated: true)
        scanningView.selectedGalleryImageView.image = image
        print("Crop Yapıldı")
    }
}
