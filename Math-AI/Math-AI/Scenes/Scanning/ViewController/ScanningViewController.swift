//
//  ScanningViewController.swift
//  Math-AI
//
//  Created by Fatih on 10.06.2024.
//

import Foundation
import UIKit

class ScanningViewController: UIViewController {
    
    //MARK: - Properties
    var scanningView = ScanningView()
    var image: UIImage? {
        didSet {
            scanningView.selectedGalleryImageView.image = image
        }
    }
    //MARK: - Life Cycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func loadView() {
        super.loadView()
        view = scanningView
    }
}
