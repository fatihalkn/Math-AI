//
//  CameraViewModel.swift
//  Math-AI
//
//  Created by Fatih on 10.06.2024.
//

import Foundation

class CameraViewModel {
    
    var scanOptionTitle: String = ""
    var scanOptions: [ScanOptions] = [.init(options: "Çevir"),
                                      .init(options: "Matematik"),
                                      .init(options: "Genel")]
}
