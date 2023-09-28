//
//  UILabelView.swift
//  Swift_Components
//
//  Created by 이성호 on 2023/09/27.
//

import UIKit

import SnapKit

protocol UILabelViewDelegate: AnyObject {
    func nextButtonDidTap()
}

// FIXME: iOS 16.4 기준이고 iOS 17의 기능은 추가 할 예정

final class UILabelView: UIView {
    
    // MARK: - text, font, textColor, baselineAdjustment: 텍스트의 베이스라인위치 조절, allowsDefaultTighteningForTruncation: 레이블에 너비에 맞게 약간 축소(거의 안됨)
    private let label1: UILabel = {
        let label = UILabel()
        label.text = "1번 레이블입니다"
        label.font = UIFont.systemFont(ofSize: 22)
        label.textColor = .blue
        label.backgroundColor = .lightGray
        label.baselineAdjustment = .alignCenters
        label.allowsDefaultTighteningForTruncation = true
        return label
    }()
    // MARK: - attributedText
    
    // MARK: - highlightedTextColor isHighlighted, isUserInteractionEnabled, isEnabled, adjustsFontSizeToFitWidth
    
    private let label2: UILabel = {
        let label = UILabel()
        label.text = "2번 레이블"
        label.backgroundColor = .lightGray
        // highlightedTextColor: isHighlighted 가 true 일때 색, false 라면 기본 textColor
        label.highlightedTextColor = .blue
        label.isHighlighted = false
        label.textColor = .red
        label.isUserInteractionEnabled = true
        label.isEnabled = true
        // adjustsFontSizeToFitWidth: 레이블의 너비에 맞게 텍스트의 폰트를 줄여준다. minimumScaleFactor이랑 같이 쓰이고, 최대 몇 펴 센트까지 줄일건지 나타냄
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.2
        return label
    }()
    
    // MARK: - numberOfLines: 레이블의 높이가 텍스트에 맞게 변경됨
    private let label3: UILabel = {
        let label = UILabel()
        label.text = "광장히 긴텍스트입니다광장히 긴텍스트입니다광장히 긴텍스트입니다광장히 긴텍스트입니다광장히 긴텍스트입니다광장히 긴텍스트입니다광장히 긴텍스트입니다광장히 긴텍스트입니다광장히 긴텍스트입니다광장히 긴텍스트입니다광장히 긴텍스트입니다광장히 긴텍스트입니다광장히 긴텍스트입니다광장히 긴텍스트입니다"
        label.backgroundColor = .lightGray
        // numberOfLines: 레이블의 높이가 텍스트에 맞게 변경됨
        label.numberOfLines = 0
        return label
    }()
    // MARK: - lineBreakStrategy: 끝에 자르는거
    private let label4: UILabel = {
        let label = UILabel()
        label.text = "광장히 긴텍스트입니다광장히 긴텍스트입니다광장히 긴텍스트입니다광장히 긴텍스트입니다광장히 긴텍스트입니다광장히 긴텍스트입니다광장히 긴텍스트입니다광장히 긴텍스트입니다광장히 긴텍스트입니다광장히 긴텍스트입니다광장히 긴텍스트입니다광장히 긴텍스트입니다광장히 긴텍스트입니다광장히 긴텍스트입니다"
        label.backgroundColor = .lightGray
        label.numberOfLines = 1
        label.lineBreakMode = .byClipping
        return label
    }()
    // MARK: - textRect
    private let label5: MyLabel = {
        let label = MyLabel()
        label.text = "5번 레이블입니다"
        label.font = UIFont.systemFont(ofSize: 22)
        label.textColor = .blue
        label.backgroundColor = .lightGray
        label.textAlignment = .center
        return label
    }()
    // MARK: - preferredMaxLayoutWidth: 레이블의 최대 너비를 정하는 속성
    private let label6: UILabel = {
        let label = UILabel()
        label.text = "광장히 긴텍스트입니다광장히 긴텍스트입니다광장히 긴텍스트입니다광장히 긴텍스트입니다광장히 긴텍스트입니다광장히 긴텍스트입니다광장히 긴텍스트입니다광장히 긴텍스트입니다광장히 긴텍스트입니다광장히 긴텍스트입니다광장히 긴텍스트입니다광장히 긴텍스트입니다광장히 긴텍스트입니다광장히 긴텍스트입니다"
        label.backgroundColor = .lightGray
        label.numberOfLines = 3
        label.preferredMaxLayoutWidth = 200
        label.lineBreakMode = .byTruncatingTail
        label.showsExpansionTextWhenTruncated = true
        return label
    }()
    private let nextButton: CommonButton = {
        let button = CommonButton(type: .system)
        button.setTitle("다음", for: .normal)
        button.tintColor = .white
        return button
    }()
    
    // MARK: - property
    
    private weak var delegate: UILabelViewDelegate?
    
    // MARK: - init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.configureUI()
        self.setupLayout()
        self.setupButtonAction()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupButtonAction() {
        let nextButtonDidTap = UIAction { [weak self] _ in
            self?.delegate?.nextButtonDidTap()
        }
        
        nextButton.addAction(nextButtonDidTap, for: .touchUpInside)
    }
    
    private func configureUI() {
        self.backgroundColor = .white
    }
    
    private func setupLayout() {
        self.addSubview(self.label1)
        self.label1.snp.makeConstraints {
            $0.top.equalTo(self.safeAreaLayoutGuide.snp.top)
            $0.leading.equalTo(self.safeAreaLayoutGuide.snp.leading).inset(20)
            $0.width.equalTo(140)
            $0.height.equalTo(100)
        }
        
        self.addSubview(self.label2)
        self.label2.snp.makeConstraints {
            $0.top.equalTo(self.label1.snp.bottom).offset(10)
            $0.leading.equalTo(self.label1.snp.leading)
            $0.width.equalTo(20)
            $0.height.equalTo(20)
        }
        
        self.addSubview(self.label3)
        self.label3.snp.makeConstraints {
            $0.top.equalTo(self.label2.snp.bottom).offset(10)
            $0.leading.equalTo(self.label2.snp.leading)
            $0.trailing.equalTo(self.safeAreaLayoutGuide.snp.trailing).inset(20)
        }
        
        self.addSubview(self.label4)
        self.label4.snp.makeConstraints {
            $0.top.equalTo(self.label3.snp.bottom).offset(10)
            $0.leading.equalTo(self.label3.snp.leading)
            $0.trailing.equalTo(self.safeAreaLayoutGuide.snp.trailing).inset(20)
        }
        
        self.addSubview(self.label5)
        self.label5.snp.makeConstraints {
            $0.top.equalTo(self.label4.snp.bottom).offset(10)
            $0.leading.equalTo(self.label4.snp.leading)
            $0.trailing.equalTo(self.safeAreaLayoutGuide.snp.trailing).inset(20)
            $0.height.equalTo(150)
        }
        
        self.addSubview(self.label6)
        self.label6.snp.makeConstraints {
            $0.top.equalTo(self.label5.snp.bottom).offset(10)
            $0.leading.equalTo(self.label5.snp.leading)
            $0.trailing.equalTo(self.safeAreaLayoutGuide.snp.trailing).inset(20)
//            $0.height.equalTo(150)
        }
        
        self.addSubview(self.nextButton)
        self.nextButton.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.bottom.equalTo(self.safeAreaLayoutGuide.snp.bottom).inset(20)
            $0.height.equalTo(80)
        }
    }
    
    func configureDelegate(_ delegate: UILabelViewDelegate) {
        self.delegate = delegate
    }
}

final class MyLabel: UILabel {
    // 텍스트의 영역을 계산하고 조절하는 메소드
    override func textRect(forBounds bounds: CGRect, limitedToNumberOfLines numberOfLines: Int) -> CGRect {
        // 기본 텍스트 영역 계산
        var textRect = super.textRect(forBounds: bounds, limitedToNumberOfLines: numberOfLines)
        
        // 텍스트 가운데 정렬
        let xOffSet = (bounds.size.width - textRect.size.width) / 2
        let yOffSet = (bounds.size.height - textRect.size.height)
        
        textRect.origin.x = bounds.origin.x + xOffSet
        textRect.origin.y = bounds.origin.y + yOffSet
        
        return textRect
    }
    
    override func draw(_ rect: CGRect) {
        let rect = self.textRect(forBounds: rect, limitedToNumberOfLines: self.numberOfLines)
        super.drawText(in: rect)
    }
}

#if canImport(SwiftUI) && DEBUG
import SwiftUI

struct Preview: PreviewProvider{
    static var previews: some View {
        UIViewPreview {
            let view = UILabelView()
            return view
        }.previewLayout(.sizeThatFits)
    }
}
#endif
