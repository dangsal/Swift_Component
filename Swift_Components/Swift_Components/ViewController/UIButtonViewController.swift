//
//  UIButtonViewController.swift
//  Swift_Components
//
//  Created by 이성호 on 2023/09/28.
//

import UIKit

final class UIButtonViewController: UIViewController {
    
    private let uiButtonView: UIButtonView = UIButtonView()
    
    // MARK: - life cycle
    
    override func loadView() {
        super.loadView()
        self.view = self.uiButtonView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
    }
}
