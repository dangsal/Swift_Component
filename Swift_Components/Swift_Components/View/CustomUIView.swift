//
//  CustomUIView.swift
//  Swift_Components
//
//  Created by 이성호 on 10/5/23.
//

import UIKit

import SnapKit

final class CustomUIView: UIView {
    
    // MARK: - isUserInteractionEnabled, tag, userInterfaceLayoutDirection
    // canBecomeFocused, isFocused: appleTV나 tvOS에서 많이 쓰임. 사용자의 포커스가 이동해서 해당뷰로 이동할수 있다면 true 반환
    // userInterfaceLayoutDirection: 레이아웃 방향을 나타냄(다국어, 다국적 지원)
    // registerForTraitChanges: 인터페이스 traits의 변경사항을 관찰하고 처리하기 위해 사용.
    private let customView1: UIView = {
        let view = UIView()
        view.backgroundColor = .red
        view.isUserInteractionEnabled = true
        view.tag = 1
        
        return view
    }()
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
        self.addSubview(self.customView1)
        self.customView1.snp.makeConstraints {
            $0.top.equalTo(self.safeAreaLayoutGuide.snp.top).inset(20)
            $0.leading.equalTo(self.safeAreaLayoutGuide.snp.leading).inset(20)
            $0.width.height.equalTo(100)
        }
    }
}

#if canImport(SwiftUI) && DEBUG
import SwiftUI

struct UIView_Preview: PreviewProvider{
    static var previews: some View {
        UIViewPreview {
            let view = CustomUIView()
            return view
        }.previewLayout(.sizeThatFits)
    }
}
#endif
