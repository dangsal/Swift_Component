//
//  CALayerViewController.swift
//  Swift_Components
//
//  Created by 이성호 on 10/11/23.
//

import UIKit

final class CALayerViewController: UIViewController {
    
    // MARK: - ui component
    
    private let caLayerView: CALayerView = CALayerView()
    
    // MARK: - property
    
    // MARK: - init
    
    // MARK: - life cycle
    
    override func loadView() {
        super.loadView()
        self.view = self.caLayerView
    }
    
    // MARK: - func
}
