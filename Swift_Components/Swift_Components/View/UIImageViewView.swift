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
    
    private let imageView1: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .lightGray
        imageView.image = UIImage(systemName: "heart")
        imageView.highlightedImage = UIImage(systemName: "heart.fill")
        imageView.tintColor = .red
        imageView.isUserInteractionEnabled = true
        return imageView
    }()
    private let imageView2: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .lightGray
        imageView.tintColor = .red
        imageView.isUserInteractionEnabled = true
        imageView.animationImages = [
            UIImage(systemName: "heart"),
            UIImage(systemName: "heart.fill")
        ].compactMap { $0  }
        imageView.animationDuration = 2.0
        imageView.animationRepeatCount = 2
        return imageView
    }()
    // MARK: - addSymbolEffect, removeSymbolEffect, removeAllSymbolEffects, setSymbolImage
    private let imageView3: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    // MARK: - init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupLayout()
        self.setupAction()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - func
    
    private func setupLayout() {
        self.addSubview(self.imageView1)
        self.imageView1.snp.makeConstraints {
            $0.top.equalTo(self.safeAreaLayoutGuide.snp.top)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(200)
        }
        
        self.addSubview(self.imageView2)
        self.imageView2.snp.makeConstraints {
            $0.top.equalTo(self.imageView1.snp.bottom).offset(20)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(200)
        }
        
        self.addSubview(self.imageView3)
        self.imageView3.snp.makeConstraints {
            $0.top.equalTo(self.imageView2.snp.bottom).offset(20)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(200)
        }
    }
    
    private func setupAction() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.didTapImageView1(_:)))
        self.imageView1.addGestureRecognizer(tapGesture)
        
        let tapGesture2 = UITapGestureRecognizer(target: self, action: #selector(self.didTapImageView2(_:)))
        self.imageView2.addGestureRecognizer(tapGesture2)
    }
    
    // MARK: - selector
    
    @objc func didTapImageView1(_ gesture: UITapGestureRecognizer) {
        if gesture.state == .ended {
            self.imageView1.isHighlighted.toggle()
        }
    }
    
    @objc func didTapImageView2(_ gesture: UITapGestureRecognizer) {
        self.imageView2.startAnimating()
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
