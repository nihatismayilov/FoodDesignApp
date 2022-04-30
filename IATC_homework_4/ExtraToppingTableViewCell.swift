//
//  Newfie.swift
//  IATC_homework_4
//
//  Created by Nihad Ismayilov on 26.04.22.
//

import UIKit
import SnapKit

class ExtraToppingTableViewCell: UITableViewCell {
    
    var choosen = false
    
    private lazy var checkImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage.init(named: "ic_check_box")
        
        return image
    }()
    
    private lazy var toppingLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.init(named: "IngredientColor")
        guard let customFont = UIFont(name: "Mulish-Medium", size: 16) else {
            fatalError("""
                Failed to load the "Mulish-SemiBold" font.
                Make sure the font file is included in the project and the font name is spelled correctly.
                """
            )
        }
        label.font = UIFontMetrics.default.scaledFont(for: customFont)
        label.adjustsFontForContentSizeCategory = true
        
        return label
    }()
    
    private lazy var dollarImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage.init(named: "ic_dollar")
        
        return image
    }()
    
    private lazy var priceLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.init(named: "PriceColor")
        guard let customFont = UIFont(name: "Mulish-Bold", size: 16) else {
            fatalError("""
                Failed to load the "Mulish-SemiBold" font.
                Make sure the font file is included in the project and the font name is spelled correctly.
                """
            )
        }
        label.font = UIFontMetrics.default.scaledFont(for: customFont)
        label.adjustsFontForContentSizeCategory = true
        
        
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        self.contentView.addSubview(checkImage)
        self.contentView.addSubview(toppingLabel)
        self.contentView.addSubview(dollarImage)
        self.contentView.addSubview(priceLabel)
        
        self.contentView.backgroundColor = .white
        self.contentView.layer.cornerRadius = 16
        
        let gesture = UITapGestureRecognizer(target: self, action: #selector(selectTopping))
        contentView.addGestureRecognizer(gesture)
        
        self.contentView.snp.makeConstraints { make in
            make.height.equalTo(56)
            make.left.equalToSuperview()
            make.right.equalToSuperview()
        }
        
        self.checkImage.snp.makeConstraints { make in
            make.width.height.equalTo(25)
            make.centerY.equalTo(self.contentView.snp.centerY)
            make.left.equalTo(self.contentView.snp.left).offset(16)
            make.top.equalTo(self.contentView.snp.top).offset(14)
        }
        
        self.toppingLabel.snp.makeConstraints { make in
            make.left.equalTo(self.checkImage.snp.right).offset(10)
            make.centerY.equalTo(self.checkImage.snp.centerY)
        }
        
        self.priceLabel.snp.makeConstraints { make in
            make.right.equalTo(self.contentView.snp.right).offset(-16)
            make.centerY.equalTo(self.checkImage.snp.centerY)
        }
        
        self.dollarImage.snp.makeConstraints { make in
            make.width.equalTo(5)
            make.height.equalTo(15)
            make.right.equalTo(self.priceLabel.snp.left)
            make.centerY.equalTo(self.priceLabel.snp.centerY)
        }
        
    }
    func getData(_ topping: String,_ price: String) {
        self.toppingLabel.text = topping
        self.priceLabel.text = String(price)
    }
    
    @objc func selectTopping() {
        if checkImage.image == UIImage.init(named: "ic_check_box") {
            checkImage.image = UIImage.init(named: "ic_check_box_fill")
        } else {
            checkImage.image = UIImage.init(named: "ic_check_box")
        }
    }
}
