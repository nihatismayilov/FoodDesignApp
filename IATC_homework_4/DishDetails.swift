//
//  DishDetails.swift
//  IATC_homework_4
//
//  Created by Nihad Ismayilov on 24.04.22.
//

import UIKit
import SnapKit

class DishDetails: UIView {
    
    private lazy var numLabel: UILabel = {
        let label = UILabel()
        self.addSubview(label)
        label.textColor = UIColor.init(named: "nums")
        guard let customFont = UIFont(name: "Mulish-SemiBold", size: 16) else {
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
    
    private lazy var titleLabel: UILabel = {
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
        
        numLabel.snp.makeConstraints { make in
            make.top.equalTo(self.safeAreaLayoutGuide.snp.top).offset(10)
            make.left.equalTo(self.safeAreaLayoutGuide.snp.left).offset(16)
            make.right.equalTo(self.safeAreaLayoutGuide.snp.right).offset(-16)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(numLabel.snp.bottom).offset(2)
            make.centerX.equalTo(numLabel.snp.centerX)
        }
    }
    
    func getDescription(description: Description) {
        self.numLabel.text = String(description.num)
        self.titleLabel.text = description.title
    }
}
