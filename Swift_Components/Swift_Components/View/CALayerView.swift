//
//  CALayerView.swift
//  Swift_Components
//
//  Created by 이성호 on 10/11/23.
//

import UIKit

import SnapKit

final class CALayerView: UIView {
    
    // MARK: - ui component
    
    private let myView: UIView = {
        let view = UIView()
        view.backgroundColor = .red
        view.layer.cornerRadius = 10
        view.layer.masksToBounds = true
        view.layer.borderColor = UIColor.black.cgColor
        view.layer.borderWidth = 5
        
        view.layer.shouldRasterize = false
        view.layer.drawsAsynchronously = false
        return view
    }()
    private let myView2: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        // MARK: - 그림자 관련해서는 4개 다 써야함.
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOffset = CGSize(width: 30, height: 30)
        view.layer.shadowOpacity = 0.5
        view.layer.shadowRadius = 5.0
        
        return view
    }()
    
    // MARK: - init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.configureUI()
        self.setupLayout()
        self.addSubviewInMyview()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - func
    
    private func configureUI() {
        self.backgroundColor = .white
    }
    
    private func setupLayout() {
        self.addSubview(self.myView)
        self.myView.snp.makeConstraints {
            $0.top.leading.equalToSuperview().inset(50)
            $0.width.height.equalTo(150)
        }
        
        self.addSubview(self.myView2)
        self.myView2.snp.makeConstraints {
            $0.top.equalTo(self.myView.snp.bottom).offset(40)
            $0.leading.equalToSuperview().inset(20)
            $0.width.height.equalTo(300)
        }
    }
    
    private func addSubviewInMyview() {
        let layer1: CALayer = CALayer()
        layer1.frame = .init(x: 10, y: 10, width: 50, height: 50)
        layer1.backgroundColor = UIColor.green.cgColor
        self.myView.layer.addSublayer(layer1)
    }
    
    
}

#if canImport(SwiftUI) && DEBUG
import SwiftUI

struct CALayerViewPreview: PreviewProvider{
    static var previews: some View {
        UIViewPreview {
            let view = CALayerView()
            return view
        }.previewLayout(.sizeThatFits)
    }
}
#endif
