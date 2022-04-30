//
//  PriceView.swift
//  IATC_homework_4
//
//  Created by Nihad Ismayilov on 24.04.22.
//

import UIKit
import SnapKit

class PriceView: UIView {
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        self.addSubview(label)
        label.textColor = UIColor.init(named: "NameColor")
        guard let customFont = UIFont(name: "Mulish-Bold", size: 20) else {
            fatalError("""
                Failed to load the "Mulish-SemiBold" font.
                Make sure the font file is included in the project and the font name is spelled correctly.
                """
            )
        }
        label.font = UIFontMetrics.default.scaledFont(for: customFont)
        label.adjustsFontForContentSizeCategory = true
        label.text = "Avocado and Egg Toast"
        label.numberOfLines = 2
        
        return label
    }()
    
    private lazy var dollarImage: UIImageView = {
        let image = UIImageView()
        self.addSubview(image)
        image.image = UIImage.init(named: "ic_dollar")
        
        return image
    }()
    
    private lazy var priceLabel: UILabel = {
        let label = UILabel()
        self.addSubview(label)
        label.textColor = UIColor.init(named: "PriceColor")
        guard let customFont = UIFont(name: "Mulish-ExtraBold", size: 24) else {
            fatalError("""
                Failed to load the "Mulish-SemiBold" font.
                Make sure the font file is included in the project and the font name is spelled correctly.
                """
            )
        }
        label.font = UIFontMetrics.default.scaledFont(for: customFont)
        label.adjustsFontForContentSizeCategory = true
        label.text = "10.00"
        
        return label
    }()
    
    //initWithFrame to init view from code
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    //initWithCode to init view from xib or storyboard
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }
    
    //common func to init our view
    private func setupView() {
//        self.backgroundColor = .red
        
        self.snp.makeConstraints { make in
            make.width.equalTo(414)
        }
        
        nameLabel.snp.makeConstraints { make in
            make.width.equalTo(160)
            make.height.equalTo(60)
            make.centerY.equalTo(self.snp.centerY)
            make.top.equalTo(self.safeAreaLayoutGuide.snp.top)
            make.left.equalTo(self.safeAreaLayoutGuide.snp.left)
        }
        
        priceLabel.snp.makeConstraints { make in
            make.centerY.equalTo(nameLabel.snp.centerY)
            make.right.equalTo(self.safeAreaLayoutGuide.snp.right)
        }
        
        dollarImage.snp.makeConstraints { make in
            make.width.equalTo(8)
            make.height.equalTo(15)
            make.centerY.equalTo(priceLabel.snp.centerY)
//            make.top.equalTo(priceLabel.snp.top)
            make.right.equalTo(priceLabel.snp.left)
        }
        
    }
}
