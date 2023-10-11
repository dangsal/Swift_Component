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
    func didTapImageView()
    func didTapUIView()
    func didTapCALayer()
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
        let uiButton = UIAction(title: "UIButton") { [weak self] _ in
            self?.delegate?.didTapUIButton()
        }
        let uiImageView = UIAction(title: "UIImageView") { [weak self] _ in
            self?.delegate?.didTapImageView()
        }
        let uiView = UIAction(title: "UIView") { [weak self] _ in
            self?.delegate?.didTapUIView()
        }
        let caLayer = UIAction(title: "CALayer") { [weak self] _ in
            self?.delegate?.didTapCALayer()
        }
        
        let menu = UIMenu(title: "어떤 컴포넌트로?", children: [uiButton, uiImageView, uiView, caLayer])
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
