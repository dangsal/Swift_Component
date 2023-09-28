//
//  CommonButton.swift
//  Swift_Components
//
//  Created by 이성호 on 2023/09/28.
//

import UIKit

import SnapKit

final class CommonButton: UIButton {
    
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
        self.backgroundColor = .systemBlue
    }
    
    private func setupLayout() {

    }
    
}

#if canImport(SwiftUI) && DEBUG
import SwiftUI

struct CommonButton_Preview: PreviewProvider{
    static var previews: some View {
        UIViewPreview {
            let view = CommonButton()
            return view
        }.previewLayout(.sizeThatFits)
    }
}
#endif
