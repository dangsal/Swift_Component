//
//  ViewController.swift
//  Swift_Components
//
//  Created by 이성호 on 2023/09/27.
//

import UIKit

import SnapKit

class LabelViewController: UIViewController {
    
    // MARK: - ui component
    
    private let uiLabelView: UILabelView = UILabelView()

    // MARK: - life cycle
    
    override func loadView() {
        self.view = uiLabelView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}

