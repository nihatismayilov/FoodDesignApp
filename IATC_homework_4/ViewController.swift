//
//  ViewController.swift
//  IATC_homework_4
//
//  Created by Nihad Ismayilov on 24.04.22.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    private lazy var mainScrollView: UIScrollView = {
        let view = UIScrollView()
        self.view.addSubview(view)
        
        return view
    }()
    
    private lazy var mainView: UIView = {
        let view = UIView()
        self.mainScrollView.addSubview(view)

        return view
    }()
    
    private lazy var foodImage: UIImageView = {
        let image = UIImageView()
        self.mainView.addSubview(image)
        image.image = UIImage.init(named: "ic_avocado_sandwich")
        
        return image
    }()
    
    private lazy var RatingView: RatingView = {
        let view = IATC_homework_4.RatingView()
        self.mainView.addSubview(view)
        
        return view
    }()
    
    private lazy var PriceView: PriceView = {
        let view = IATC_homework_4.PriceView()
        self.mainView.addSubview(view)
        
        return view
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        self.mainView.addSubview(label)
        label.textColor = UIColor.init(named: "RatingColor")
        guard let customFont = UIFont(name: "Mulish-Medium", size: 14) else {
            fatalError("""
                Failed to load the "Mulish-SemiBold" font.
                Make sure the font file is included in the project and the font name is spelled correctly.
                """
            )
        }
        label.font = UIFontMetrics.default.scaledFont(for: customFont)
        label.adjustsFontForContentSizeCategory = true
        label.numberOfLines = 3
        label.text = "You won't skip the most important meal of the day with this avocado toast recipe. Crispy, lacy eggs and creamy avocado top hot buttered toast."
        
        return label
    }()
    
    private lazy var dishDescriptionStack: UIStackView = {
        let view = UIStackView()
        self.mainView.addSubview(view)
        view.axis = .horizontal
        view.distribution = .equalSpacing
        view.spacing = 8
        view.backgroundColor = .white
        view.clipsToBounds = false
        view.layer.cornerRadius = 16
        
        return view
    }()
    
    let dishDescription: [Description] = [
        Description(num: 400, title: "kcal"),
        Description(num: 510, title: "grams"),
        Description(num: 30, title: "proteins"),
        Description(num: 56, title: "carbs"),
        Description(num: 24, title: "fats")]
    
    private lazy var IngredientsLabel: UILabel = {
        let label = UILabel()
        self.mainView.addSubview(label)
        label.textColor = UIColor.init(named: "IngredientColor")
        guard let customFont = UIFont(name: "Mulish-SemiBold", size: 16) else {
            fatalError("""
                Failed to load the "Mulish-SemiBold" font.
                Make sure the font file is included in the project and the font name is spelled correctly.
                """
            )
        }
        label.font = UIFontMetrics.default.scaledFont(for: customFont)
        label.adjustsFontForContentSizeCategory = true
        label.text = "Ingredients"
        
        return label
    }()
    
    private lazy var collectionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        
        let view = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        view.backgroundColor = UIColor.init(white: 0.96, alpha: 1.0)
        view.bounces = false
        view.showsHorizontalScrollIndicator = false
        self.mainView.addSubview(view)
        
        view.dataSource = self
        view.delegate = self
        view.register(IngredientsCollectionViewCell.self, forCellWithReuseIdentifier: "collectionCell")
        
        return view
    }()
    let ingredientImageArray = [UIImage.init(named: "ic_egg"), UIImage.init(named: "ic_avocado"), UIImage.init(named: "ic_spinach"), UIImage.init(named: "ic_egg"), UIImage.init(named: "ic_avocado"), UIImage.init(named: "ic_spinach"), UIImage.init(named: "ic_egg"), UIImage.init(named: "ic_avocado")]
    let ingredientNameArray = ["Egg", "Avocado", "Spinach", "Egg", "Avocado", "Spinach", "Egg", "Avocado"]
    
    private lazy var toppingLabel: UILabel = {
        let label = UILabel()
        self.mainView.addSubview(label)
        label.textColor = UIColor.init(named: "IngredientColor")
        guard let customFont = UIFont(name: "Mulish-SemiBold", size: 16) else {
            fatalError("""
                Failed to load the "Mulish-SemiBold" font.
                Make sure the font file is included in the project and the font name is spelled correctly.
                """
            )
        }
        label.font = UIFontMetrics.default.scaledFont(for: customFont)
        label.adjustsFontForContentSizeCategory = true
        label.text = "Add toppings"
        
        return label
    }()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        self.mainView.addSubview(tableView)
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(ExtraToppingTableViewCell.self, forCellReuseIdentifier: "extra_topping_cell")
        tableView.separatorStyle = .none
        tableView.allowsSelection = false
        
        return tableView
    }()
    let toppingTitleArray = ["Extra eggs", "Extra spinach", "Extra bread", "Extra tomato", "Extra cucumber", "Extra olives", "Extra pepper", "Extra avocado"]
    let toppingPriceArray = ["4.20", "2.80", "1.80", "2.10", "1.60", "3.50", "1.50", "5.40"]
    
    private lazy var requestLabel: UILabel = {
        let label = UILabel()
        self.view.addSubview(label)
        label.textColor = UIColor.init(named: "IngredientColor")
        guard let customFont = UIFont(name: "Mulish-SemiBold", size: 16) else {
            fatalError("""
                Failed to load the "Mulish-SemiBold" font.
                Make sure the font file is included in the project and the font name is spelled correctly.
                """
            )
        }
        label.font = UIFontMetrics.default.scaledFont(for: customFont)
        label.adjustsFontForContentSizeCategory = true
        label.text = "Add a request"
        
        return label
    }()
    
    private lazy var requestTextView: UITextView = {
        let text = UITextView()
        self.view.addSubview(text)
        text.textColor = .lightGray
        text.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        text.text = "Ex: Don't add onion"
        
        text.layer.borderWidth = 0.5
        text.layer.borderColor = UIColor.init(white: 0.85, alpha: 1.0).cgColor
        text.clipsToBounds = true
        text.layer.cornerRadius = 16
        text.delegate = self
        
        return text
    }()
    
    private lazy var counterLabel: UILabel = {
        let label = UILabel()
        self.view.addSubview(label)
        label.textColor = UIColor.init(named: "RatingColor")
        guard let customFont = UIFont(name: "Mulish-Regular", size: 12) else {
            fatalError("""
                Failed to load the "Mulish-SemiBold" font.
                Make sure the font file is included in the project and the font name is spelled correctly.
                """
            )
        }
        label.backgroundColor = .white
        label.font = UIFontMetrics.default.scaledFont(for: customFont)
        label.adjustsFontForContentSizeCategory = true
        label.text = "0/250"
        
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.init(white: 0.96, alpha: 1.0)
        
        mainScrollView.snp.makeConstraints { make in
            make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top)
            make.left.equalTo(self.view.safeAreaLayoutGuide.snp.left)
            make.right.equalTo(self.view.safeAreaLayoutGuide.snp.right)
            make.bottom.equalTo(self.requestLabel.snp.top).offset(-16)
        }
        
        mainView.snp.makeConstraints { make in
            make.centerX.equalTo(self.mainScrollView.snp.centerX)
            make.top.equalTo(self.mainScrollView.contentLayoutGuide.snp.top)
            make.left.equalTo(self.mainScrollView.contentLayoutGuide.snp.left)
            make.right.equalTo(self.mainScrollView.contentLayoutGuide.snp.right)
            make.bottom.equalTo(self.mainScrollView.contentLayoutGuide.snp.bottom)
        }
        
        foodImage.snp.makeConstraints { make in
            make.width.height.equalTo(170)
            make.top.equalTo(self.mainView.snp.top).offset(42)
            make.centerX.equalTo(self.mainScrollView.snp.centerX)
        }
        
        RatingView.snp.makeConstraints { make in
            make.top.equalTo(self.mainView.snp.top).offset(50)
            make.left.equalTo(self.foodImage.snp.right).offset(16)
        }
        
        PriceView.snp.makeConstraints { make in
            make.centerX.equalTo(self.mainScrollView.snp.centerX)
            make.top.equalTo(self.foodImage.snp.bottom).offset(64)
            make.left.equalTo(self.mainView.snp.left).offset(24)
        }
        
        descriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(self.PriceView.snp.bottom)
            make.left.equalTo(self.PriceView.snp.left)
            make.right.equalTo(self.PriceView.snp.right)
        }
        
        dishDescriptionStack.snp.makeConstraints { make in
            make.width.equalTo(330)
            make.height.equalTo(64)
            make.top.equalTo(self.descriptionLabel.snp.bottom).offset(32)
            make.centerX.equalTo(self.foodImage.snp.centerX)
            make.left.equalTo(self.descriptionLabel.snp.left)
        }
        
        IngredientsLabel.snp.makeConstraints { make in
            make.top.equalTo(self.dishDescriptionStack.snp.bottom).offset(32)
            make.left.equalTo(self.dishDescriptionStack.snp.left)
        }
        collectionView.snp.makeConstraints { make in
            make.height.equalTo(80)
            make.top.equalTo(self.IngredientsLabel.snp.bottom).offset(16)
            make.left.equalTo(self.dishDescriptionStack.snp.left)
            make.right.equalTo(self.dishDescriptionStack.snp.right)
        }
        
        toppingLabel.snp.makeConstraints { make in
            make.left.equalTo(self.dishDescriptionStack.snp.left)
            make.top.equalTo(self.collectionView.snp.bottom).offset(16)
        }
        
        tableView.snp.makeConstraints { make in
            make.height.equalTo(576)
            make.top.equalTo(self.toppingLabel.snp.bottom).offset(16)
            make.left.equalTo(self.collectionView.snp.left)
            make.right.equalTo(self.collectionView.snp.right)
            make.bottom.equalTo(self.mainView.snp.bottom)
        }
        
        requestTextView.snp.makeConstraints { make in
            make.height.equalTo(82)
            make.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.bottom).offset(-8)
            make.left.equalTo(self.view.safeAreaLayoutGuide.snp.left).offset(24)
            make.right.equalTo(self.view.safeAreaLayoutGuide.snp.right).offset(-24)
        }
        
        counterLabel.snp.makeConstraints { make in
            make.bottom.equalTo(self.requestTextView.snp.bottom).offset(-8)
            make.right.equalTo(self.requestTextView.snp.right).offset(-8)
        }
        
        requestLabel.snp.makeConstraints { make in
            make.bottom.equalTo(self.requestTextView.snp.top).offset(-8)
            make.left.equalTo(self.view.safeAreaLayoutGuide.snp.left).offset(24)
        }
        
        dishDescription.forEach { dish in
            let dishDetails = DishDetails()
            dishDetails.getDescription(description: dish)
            self.dishDescriptionStack.addArrangedSubview(dishDetails)
        }
    }
}

// MARK: - TextView Settings
extension ViewController: UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
        requestTextView.textColor = .darkText
        requestTextView.text = ""
    }
    func textViewDidChange(_ textView: UITextView) {
        if self.requestTextView.text!.count < 250 {
            counterLabel.textColor = UIColor.init(named: "RatingColor")
            self.counterLabel.text = "\(self.requestTextView.text!.count)/250"
        }
        else {
            self.counterLabel.textColor = .systemRed
            self.counterLabel.text = "250/250"
        }
    }
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        return textView.text.count + (text.count - range.length) <= 250
    }
}

// MARK: - Table Settings
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return toppingPriceArray.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "extra_topping_cell") as! ExtraToppingTableViewCell
        cell.getData(toppingTitleArray[indexPath.row], toppingPriceArray[indexPath.row])
        cell.backgroundColor = UIColor.init(white: 0.96, alpha: 1.0)
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(72)
    }
}

// MARK: - Collection Settings
extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return ingredientImageArray.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionCell", for: indexPath) as! IngredientsCollectionViewCell
        
        cell.getIngredients(ingredientImageArray[indexPath.row]!, ingredientNameArray[indexPath.row])
        
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100, height: 80)
    }
}
struct Description {
    let num: Int
    let title: String
}
