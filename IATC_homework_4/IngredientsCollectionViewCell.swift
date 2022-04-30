//
//  IngredientsCOllectionViewCell.swift
//  IATC_homework_4
//
//  Created by Nihad Ismayilov on 26.04.22.
//

import UIKit
import SnapKit

class IngredientsCollectionViewCell: UICollectionViewCell {
    private lazy var ingredientImage: UIImageView = {
        let image = UIImageView()

        return image
    }()
    
    private lazy var ingredientTitle: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.init(named: "RatingColor")
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
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.setupUI()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        self.contentView.backgroundColor = .white
        self.contentView.layer.cornerRadius = 16
        
        self.contentView.addSubview(ingredientImage)
        self.contentView.addSubview(ingredientTitle)
        
        ingredientImage.snp.makeConstraints { make in
            make.height.width.equalTo(30)
            make.centerX.equalTo(self.contentView.snp.centerX)
            make.top.equalTo(self.contentView.snp.top).offset(16)
        }
        ingredientTitle.snp.makeConstraints { make in
            make.centerX.equalTo(self.ingredientImage.snp.centerX)
            make.top.equalTo(self.ingredientImage.snp.bottom).offset(4)
        }
    }
    func getIngredients(_ image: UIImage,_ name: String) {
        self.ingredientImage.image = image
        self.ingredientTitle.text = name
    }
}

