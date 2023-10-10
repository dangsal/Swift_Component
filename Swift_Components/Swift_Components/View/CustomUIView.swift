//
//  CustomUIView.swift
//  Swift_Components
//
//  Created by 이성호 on 10/5/23.
//

import UIKit

import SnapKit

final class CustomUIView: UIView {
    
    // MARK: - ios17 : updateTraitsIfNeeded
    
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
    // MARK: - gestureRecognizers: 뷰에 연결된 제스처 인식기 객체의 배열
    // addGestureRecognizer, removeGestureRecognizer,
    // gestureRecognizerShouldBegin -> Bool: 제스처 동작 활성화 조절
    // 사용자의 터치 동작을 인식하고 해당 동작에 대한 액션을 실행하는데 사용
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
    // alpha, isOpaque: 뷰가 투명한지 아닌지 반환(투명하지 않으면 true), clearsContextBeforeDrawing: drawing이 시작되기 전에 그래픽 컨텍스트를 지울지말지
    // contentMode: 뷰의 콘텐츠가 뷰의 프레임에 어떻게 맞추어져야하는지 결정하는 열거형
    private let customView5: UIView = {
        let view = UIView()
        view.backgroundColor = .red
        view.alpha = 0.1
        view.contentMode = .bottom
        return view
    }()
    // MARK: - addMotionEffect: 기기의 움직임에 따라 뷰의 움직임을 조절하거나 시각적 효과를 뷰여하는ㄷ 사용
    // addMotionEffect, removeMotionEffect, motionEffects 모션 조건을 걸때
    // MARK: - intrinsicContentSize: 기본 사이즈에서 변경 가능
    // invalidateIntrinsicContentSize: intrinsicContentSize 무시하고 재계산할때 호출
    // MARK: - init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupLayout()
        self.configureUI()
//        self.descendantView()
//        self.findSubviewWithTag()
        self.setupMasking()
        self.setupAnimation()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - func
    // MARK: - updateConstraintsIfNeeded: 레이아웃 조건 변경하고 재계산해서 업데이트
    // updateConstraints, needsUpdateConstraints, setNeedsUpdateConstraints
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
        
        self.addSubview(self.customView5)
        self.customView5.snp.makeConstraints {
            $0.top.equalTo(self.textField1.snp.bottom).offset(10)
            $0.leading.equalTo(self.customView3.snp.leading)
            $0.width.height.equalTo(150)
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
    
    // MARK: - mask: 뷰의 내용을 특정한 모양 또는 패턴으로 마스킹하고 표시할 수 있게 해줌
    // 마스크 레이어가 불투명한 영역은 뷰의 콘텐츠를 보여주고, 투명한 영역은 숨긴다.
    private func setupMasking() {
        let maskLayer = CAShapeLayer()
        let maskPath = UIBezierPath(ovalIn: CGRect(x: 20, y: 20, width: 100, height: 100))
        maskLayer.path = maskPath.cgPath
        
        self.customView5.layer.mask = maskLayer
    }
    
    // MARK: - setAnimationsEnabled: 애니메이션 활성화 또는 비활성화 할 때 사용된다. 이 메서드를 통해 애니메이션을 전역적으로 활성화하거나 비활성화 할 수 있다.
    // areAnimationsEnabled 현재 애니메이션이 활성화 되어있나를 나타냄
    // performWithoutAnimation: 애니메이션 없이 프로퍼티 변경 적용
    // inheritedAnimationDuration: 부모 뷰로부터 상속된 애니메이션 동작 시간
    private func setupAnimation() {
        UIView.setAnimationsEnabled(true)
        UIView.animate(withDuration: 2) {
            self.customView5.alpha = 1
        }
        if UIView.areAnimationsEnabled {
            print("enabled")
        } else {
            print("disabled")
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
