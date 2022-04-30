//
//  RatingView.swift
//  IATC_homework_4
//
//  Created by Nihad Ismayilov on 24.04.22.
//

import UIKit
import SnapKit

class RatingView: UIView {
    
    private lazy var starImage: UIImageView = {
        let image = UIImageView()
        self.addSubview(image)
        image.image = UIImage.init(named: "ic_yllw_star")
        
        return image
    }()
    
    private lazy var ratingLabel: UILabel = {
        let label = UILabel()
        self.addSubview(label)
        label.textColor = UIColor.init(named: "RatingColor")
        guard let customFont = UIFont(name: "Mulish-SemiBold", size: 14) else {
            fatalError("""
                Failed to load the "Mulish-SemiBold" font.
                Make sure the font file is included in the project and the font name is spelled correctly.
                """
            )
        }
        label.font = UIFontMetrics.default.scaledFont(for: customFont)
        label.adjustsFontForContentSizeCategory = true
        label.text = "5.0"
        
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
        
        self.layer.cornerRadius = 12
        self.backgroundColor = .white
        
        self.snp.makeConstraints { make in
            make.width.equalTo(64)
            make.height.equalTo(24)
        }
        
        starImage.snp.makeConstraints { make in
            make.width.height.equalTo(20)
            make.centerY.equalTo(self.snp.centerY)
            make.left.equalTo(self.safeAreaLayoutGuide.snp.left).offset(9)
        }
        
        ratingLabel.snp.makeConstraints { make in
            make.centerY.equalTo(starImage.snp.centerY)
            make.left.equalTo(self.starImage.snp.right).offset(4)
        }
        
    }
}
