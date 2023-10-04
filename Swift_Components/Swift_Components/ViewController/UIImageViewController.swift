//
//  UIImageViewController.swift
//  Swift_Components
//
//  Created by 이성호 on 10/4/23.
//

import UIKit

final class UIImageViewController: UIViewController {
    
    private let uiImageViewView: UIImageViewView = UIImageViewView()
    
    // MARK: - life cycle
    
    override func loadView() {
        super.loadView()
        self.view = self.uiImageViewView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
    }
}
