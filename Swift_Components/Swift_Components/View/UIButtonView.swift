//
//  UIButtonView.swift
//  Swift_Components
//
//  Created by 이성호 on 2023/09/28.
//

import UIKit

import SnapKit

final class UIButtonView: UIView {
    // MARK: - ConfigurationUpdateHandler, UIButtonPointerStyleProvider, systemButton, setNeedsUpdateConfiguration, updateConfiguration, configurationUpdateHandler, automaticallyUpdatesConfiguration, preferredMenuElementOrder, setAttributedTitle
    
    // MARK: - ButtonType, Role, tintColor, isPointerInteractionEnabled, setTitle, setTitleColor, setPreferredSymbolConfiguration
    // ButtonType(custom, system, detailDisclosure, infoLight, infoDark, contactAdd, close, roundedRect: 버튼의 타입정의
    // Role(normal, primary, cancel, destructive): 버튼의 역할지정, Accessibility 및 사용자 경험 개선도움
    // tintColor: 버튼안에 색, superView의 tintColor 상속받음
    // isPointerInteractionEnabled, isHovered: iOS에서는 hover가 필요없지만, macOS,PadOS에서 사용
    // setPreferredSymbolConfiguration: 버튼의 image 의 configuration 을 변경
    private lazy var button1: UIButton = {
        let button = UIButton(type: .system)
        button.role = .destructive
        button.backgroundColor = .lightGray
        button.setTitle("버튼", for: .normal)
        button.tintColor = .black
        button.setTitleColor(.red, for: .normal)
//        button.isPointerInteractionEnabled = true
//        button.setImage(configureSymbol(), for: .normal)
        button.setImage(UIImage(systemName: "star"), for: .normal)
        button.setPreferredSymbolConfiguration(UIImage.SymbolConfiguration(pointSize: 20, weight: .bold), forImageIn: .normal)
        return button
    }()
    // MARK: - menu, showsMenuAsPrimaryAction, changesSelectionAsPrimaryAction
    // menu: 버튼을 꾹 눌렀을때 나타나는 컨텍스트 메뉴 설정
    // showsMenuAsPrimaryAction: true 면 그냥 터치해도 메뉴 나오고 false 면 꾹눌러야함
    // changesSelectionAsPrimaryAction: 버튼에 토글 느낌이 나게 함
    private lazy var button2: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .brown
        button.setTitle("메뉴 입니다.", for: .normal)
        button.menu = setupMenu()
        button.showsMenuAsPrimaryAction = false
        button.changesSelectionAsPrimaryAction = true
        return button
    }()
    
    // MARK: - setImage, setBackgroundImage
    private let button3: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "heart"), for: .normal)
        button.setBackgroundImage(UIImage(systemName: "circle"), for: .normal)
        button.tintColor = .systemGray
        return button
    }()
    // MARK: - titleLabel, imageView, subtitleLabel, TitleAlignment(contentVerticalAlignment, contentHorizontalAlignment), CornerStyle
    private let button4: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("타이틀레이블", for: .normal)
        button.tintColor = .systemGray
        button.backgroundColor = .green
        button.contentVerticalAlignment = .top
        button.contentHorizontalAlignment = .leading
        return button
    }()
    
    // MARK: - init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.configureUI()
        self.setupLayout()
        self.setupButtonAction()
        
        print(self.button2Text())
        print(self.button3Image())
        
        self.currentTitle()
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
        self.addSubview(self.button1)
        self.button1.snp.makeConstraints {
            $0.top.equalTo(self.safeAreaLayoutGuide.snp.top)
            $0.leading.equalTo(self.safeAreaLayoutGuide.snp.leading).inset(20)
            $0.width.equalTo(200)
            $0.height.equalTo(80)
        }
        
        self.addSubview(self.button2)
        self.button2.snp.makeConstraints {
            $0.top.equalTo(self.button1.snp.bottom).offset(10)
            $0.leading.equalTo(self.button1.snp.leading)
            $0.width.equalTo(200)
            $0.height.equalTo(80)
        }
        
        self.addSubview(self.button3)
        self.button3.snp.makeConstraints {
            $0.top.equalTo(self.button2.snp.bottom).offset(10)
            $0.leading.equalTo(self.button2.snp.leading)
            $0.width.equalTo(200)
            $0.height.equalTo(80)
        }
        
        self.addSubview(self.button4)
        self.button4.snp.makeConstraints {
            $0.top.equalTo(self.button3.snp.bottom).offset(10)
            $0.leading.equalTo(self.button2.snp.leading)
            $0.width.equalTo(200)
            $0.height.equalTo(80)
        }
    }
    // MARK: - title, titleColor, titleShadowColor, image, backgroundImage
    private func button2Text() -> String {
        guard let text = self.button2.title(for: .normal) else { return "" }
        return text
    }
    
    private func button3Image() -> UIImage {
        guard let image = self.button3.image(for: .normal) else { return UIImage() }
        return image
    }
    // MARK: - currentTitle, currentTitleColor, currentTitleShadowColor, currentImage, currentBackgroundImage, currentPreferredSymbolConfiguration, currentAttributedTitle
    private func currentTitle() {
        if let currentText = button2.currentTitle {
            print("current title: \(currentText)")
        } else {
            print("currnet title: 설정 안되어있음")
        }
    }
    // MARK: - titleLabel
    private func setupButtonAction() {
        let action = UIAction { _ in
            // UI 변경 안됨. titleLabel 은 읽기 전용임.
            self.button4.titleLabel?.text = "눌렀다!"
            // 눌렀다 출려됨
            print(self.button4.titleLabel?.text)
        }
        self.button4.addAction(action, for: .touchUpInside)
    }
    
    private func configureSymbol() -> UIImage {
        let symbolConfiguration = UIImage.SymbolConfiguration(pointSize: 24, weight: .bold)
        guard let image = UIImage(systemName: "star.fill")?.withConfiguration(symbolConfiguration) else { return UIImage() }
        return image
    }
    
    private func setupMenu() -> UIMenu {
        let menu1 = UIAction(title: "Action1") { action in
            print("action1")
        }
        let menu2 = UIAction(title: "Action2") { action in
            print("action2")
        }
        let menu = UIMenu(title: "제목", children: [menu1, menu2])
        return menu
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
