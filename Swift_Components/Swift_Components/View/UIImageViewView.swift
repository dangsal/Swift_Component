//
//  UIImageView.swift
//  Swift_Components
//
//  Created by 이성호 on 10/4/23.
//

import UIKit

import SnapKit

final class UIImageViewView: UIView {
    
    // MARK: - ui component
    
    // MARK: - init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - func
    
    private func setupLayout() {
    }
}

#if canImport(SwiftUI) && DEBUG
import SwiftUI

struct UIImageViewView_Preview: PreviewProvider{
    static var previews: some View {
        UIViewPreview {
            let view = UIImageViewView()
            return view
        }.previewLayout(.sizeThatFits)
    }
}
#endif
