//
//  CommonButton.swift
//  Swift_Components
//
//  Created by 이성호 on 2023/09/28.
//

import UIKit

import SnapKit

protocol CommonButtonDelegate: AnyObject {
    func didTapUIButton()
}

final class CommonButton: UIButton {
    
    weak var delegate: CommonButtonDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.configureUI()
        self.menu = setupButtonMenu()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureUI() {
        self.backgroundColor = .systemBlue
    }

    private func setupButtonMenu() -> UIMenu {
        let uibutton = UIAction(title: "UILabel") { [weak self] _ in
            self?.delegate?.didTapUIButton()
        }
        
        let menu = UIMenu(title: "어떤 컴포넌트로?", children: [uibutton])
        return menu
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
