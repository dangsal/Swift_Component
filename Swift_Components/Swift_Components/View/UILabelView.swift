//
//  UILabelView.swift
//  Swift_Components
//
//  Created by 이성호 on 2023/09/27.
//

import UIKit

final class UILabelView: UIView {
    
    // MARK: - ui component
    
    // MARK: - init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.configureUI()
        self.setupLayout()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureUI() {
        self.backgroundColor = .blue
    }
    
    private func setupLayout() {
        
    }
}
