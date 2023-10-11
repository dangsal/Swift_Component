//
//  CustomTableView.swift
//  Swift_Components
//
//  Created by 이성호 on 10/12/23.
//

import UIKit

import SnapKit

final class CustomTableView: UIView {
    
    // MARK: - init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.configureUI()
        self.setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - func
    
    private func configureUI() {
        self.backgroundColor = .white
    }
    
    private func setupLayout() {
        
    }
}
