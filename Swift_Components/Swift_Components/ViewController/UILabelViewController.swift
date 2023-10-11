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
        self.setupDelegate()
    }
    
    // MARK: - func
    
    private func setupDelegate() {
        self.uiLabelView.configureDelegate(self)
    }
}

extension LabelViewController: CommonButtonDelegate {
    func didTapUIButton() {
        let viewController = UIButtonViewController()
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
    func didTapImageView() {
        let viewController = UIImageViewController()
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
    func didTapUIView() {
        let viewController = CustomUIViewController()
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
    func didTapCALayer() {
        let viewController = CALayerViewController()
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
    func didTapTableView() {
        let viewController = CustomTableViewController()
        self.navigationController?.pushViewController(viewController, animated: true)
    }
}
