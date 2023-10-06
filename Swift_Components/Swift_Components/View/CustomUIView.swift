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
    private let customView2: UIView = {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        view.backgroundColor = .blue
        return view
    }()
    private let customView3: UIView = {
        let view = UIView()
        view.backgroundColor = .green
        return view
    }()
    private let customView4: UIView = {
        let view = UIView()
        view.backgroundColor = .brown
        return view
    }()
    private let textField1: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .gray
        return textField
    }()
    
    // MARK: - init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupLayout()
        self.configureUI()
        self.descendantView()
        self.findSubviewWithTag()
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
        
        self.addSubview(self.customView2)
        self.customView2.snp.makeConstraints {
            $0.top.equalTo(self.customView1.snp.bottom).offset(-30)
            $0.leading.equalTo(self.customView1.snp.leading)
            $0.width.height.equalTo(50)
        }
        
        self.addSubview(self.customView3)
        self.customView3.snp.makeConstraints {
            $0.top.equalTo(self.customView1.snp.bottom).offset(-10)
            $0.leading.equalTo(self.customView1.snp.leading).offset(20)
            $0.width.height.equalTo(50)
        }
        
        self.addSubview(self.textField1)
        self.textField1.snp.makeConstraints {
            $0.top.equalTo(self.customView3.snp.bottom).offset(40)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(60)
        }
        // MARK: - keyboardLayoutGuide: 키보드 상단에 따라 위치가 조정됨
        self.addSubview(self.customView4)
        self.customView4.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(80)
            $0.bottom.equalTo(self.keyboardLayoutGuide.snp.top).offset(-20)
        }
        // bringSubviewToFront: 뷰를 앞으로 가져옴 (subviews배열의 마지막)
//        self.bringSubviewToFront(self.customView1)
        // sendSubviewToBack: 뷰를 뒤로 보냄 (subviews배열의 첫번째)
//        self.sendSubviewToBack(self.customView2)
        // insertSubview: 해당뷰를 원하는 위치에 둔다.
//        self.insertSubview(self.customView1, at: 2)
        // exchangeSubview: 원하는 두 뷰의 위치를 바꾼다.
//        let redViewIndex = self.subviews.firstIndex(of: self.customView1)!
//        let greenViewIndex = self.subviews.firstIndex(of: self.customView3)!
//        self.exchangeSubview(at: redViewIndex, withSubviewAt: greenViewIndex)
    }
    
    private func configureUI() {
        self.backgroundColor = .white
    }
    
    // MARK: - subview 상태 관리를 위한 메소드
    // 서브뷰가 뷰에 추가될 때 호출되는 메소드, 서브뷰가 추가될때 애니메이션을 실행하거나, 추가된 서브뷰에 대한 특별한 초기화 작업을 진행할 수 있다.
    override func didAddSubview(_ subview: UIView) {
        super.didAddSubview(subview)
        print("Subview added to CustomView: \(subview)")
    }
    // 서브뷰가 제거되기 전에 특정 동작을 수행할 수 있다. 애니메이션 실행, 서브뷰에 대한 정리 작업
    override func willRemoveSubview(_ subview: UIView) {
        super.willRemoveSubview(subview)
        print("Subview will be removed from CustomUIView: \(subview)")
    }
    // 뷰가 다른 부모 뷰로 이동될때 특정 동작을 수행할 수 있다.
    override func willMove(toSuperview newSuperview: UIView?) {
        super.willMove(toSuperview: newSuperview)
        if let newSuperview = newSuperview {
            print("View will move to a new superview: \(newSuperview)")
        } else {
            print("View will be removed from its superview.")
        }
    }
    // 뷰가 다른 부모 뷰로 이동한 직후 수행
    override func didMoveToSuperview() {
        super.didMoveToSuperview()
    }
    // MARK: - isDescendant: 특정 뷰가 superView인지 확인 가능
    private func descendantView() {
        let isSuperView: Bool = customView1.isDescendant(of: self)
        print(isSuperView)
    }
    
    // MARK: - viewWithTag: 특정 태그를 갖는 서브뷰가 있는지 찾는데 사용
    private func findSubviewWithTag() {
        if let subviewWithTag = self.viewWithTag(1) {
            print("있음")
        } else {
            print("없음")
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
