//
//  CustomUIViewController.swift
//  Swift_Components
//
//  Created by 이성호 on 10/5/23.
//

import UIKit

final class CustomUIViewController: UIViewController {
    
    // MARK: - ui component
    
    private let customUIView: CustomUIView = CustomUIView()
    
    // MARK: - property
    
    // MARK: - init
    
    // MARK: - life cycle
    
    override func loadView() {
        super.loadView()
        self.view = self.customUIView
    }
    
    // MARK: - func
}
