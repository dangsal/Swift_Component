//
//  UIButtonView.swift
//  Swift_Components
//
//  Created by 이성호 on 2023/09/28.
//

import UIKit

import SnapKit

final class UIButtonView: UIView {
    
    private let button1: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .systemBlue
        return button
    }()

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
    
    // MARK: - func
    
    private func configureUI() {
        self.backgroundColor = .white
    }
    
    private func setupLayout() {
        self.addSubview(button1)
        self.button1.snp.makeConstraints {
            $0.top.equalTo(self.safeAreaLayoutGuide.snp.top)
            $0.leading.equalTo(self.safeAreaLayoutGuide.snp.leading).inset(20)
            $0.width.equalTo(200)
            $0.height.equalTo(80)
        }
    }
    
}

#if canImport(SwiftUI) && DEBUG
import SwiftUI

struct UIButtonView_Preview: PreviewProvider{
    static var previews: some View {
        UIViewPreview {
            let view = UIButtonView()
            return view
        }.previewLayout(.sizeThatFits)
    }
}
#endif
