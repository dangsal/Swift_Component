//
//  CustomTableViewController.swift
//  Swift_Components
//
//  Created by 이성호 on 10/12/23.
//

import UIKit

final class CustomTableViewController: UIViewController {
    
    // MARK: - ui component
    
    private let customTableView: CustomTableView = CustomTableView()
    
    // MARK: - life cycle
    
    override func loadView() {
        super.loadView()
        self.view = self.customTableView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - func
}
