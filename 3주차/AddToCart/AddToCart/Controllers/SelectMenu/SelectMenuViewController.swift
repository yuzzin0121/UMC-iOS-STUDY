//
//  SelectMenuViewController.swift
//  AddToCart
//
//  Created by 조유진 on 2023/10/03.
//

import UIKit

class SelectMenuViewController: UIViewController {
    // 스크롤뷰
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
      
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    // 스크롤뷰에 들어갈 도화지~
    private let contentView: UIView = {
        let contentView = UIView()
        contentView.backgroundColor = .buttonGray
        contentView.translatesAutoresizingMaskIntoConstraints = false
        return contentView
    }()
    
    // 음식 이미지뷰
    private let foodImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "엽기떡볶이")
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    // 음식 설명뷰 시작
    private let descriptionView: UIView = { // 도화지~
        let view = UIView()
        view.backgroundColor = .white
        
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    // 인기 엽기 메뉴
    private let foodMenu: UILabel = {
        let label = UILabel()
        let attributedString = NSMutableAttributedString(string: "")
        let fontSize = UIFont.boldSystemFont(ofSize: 24)
        
        let imageAttachment = NSTextAttachment()
        imageAttachment.image = UIImage(named: "인기")
        imageAttachment.bounds = CGRect(x: 0, y: -12, width: 40, height: 40)
        
        let text = " 엽기메뉴"
        let attributes: [NSAttributedString.Key : Any] = [
            NSAttributedString.Key.foregroundColor: UIColor.black,
            NSAttributedString.Key.font: fontSize
        ]
        attributedString.append(NSAttributedString(attachment: imageAttachment))
        attributedString.append(NSAttributedString(string: text, attributes: attributes))
        label.attributedText = attributedString
        label.sizeToFit()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    // 메뉴 설명
    private let menuDescriptionLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 17)
        label.textColor = UIColor.secondaryLabel
        label.lineBreakMode = .byCharWrapping
        let labelText = "분모자떡볶이 선택 시, 떡이 분모자로 변경되어 제공됩니다."
        let attributedString = NSMutableAttributedString(string: labelText)
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 4
        attributedString.addAttribute(.paragraphStyle, value: paragraphStyle, range: NSMakeRange(0, labelText.count))
        
        label.attributedText = attributedString
        
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // 말풍선 아이콘
    private let reviewIcon: UIImageView = {
        let reviewIcon = UIImageView()
        reviewIcon.image = UIImage(named: "말풍선")
        reviewIcon.contentMode = .scaleAspectFit
        reviewIcon.translatesAutoresizingMaskIntoConstraints = false
        return reviewIcon
    }()
    
    // 리뷰 보러가기
    private let reviewButton: UIButton = {
        let reviewButton = UIButton()
        reviewButton.setTitle("메뉴 리뷰 184개 ", for: .normal)
        reviewButton.titleLabel?.font = .boldSystemFont(ofSize: 20)
        reviewButton.setTitleColor(.black, for: .normal)
        reviewButton.setImage(UIImage(systemName: "chevron.right"), for: .normal)
        reviewButton.semanticContentAttribute = .forceRightToLeft
        reviewButton.contentVerticalAlignment = .center
        reviewButton.contentHorizontalAlignment = .center
        reviewButton.tintColor = .black
        reviewButton.translatesAutoresizingMaskIntoConstraints = false
        return reviewButton
    }()
    
    // 가격 레이블
    private let priceLabel: UILabel = {
        let priceLabel = UILabel()
        priceLabel.font = UIFont.boldSystemFont(ofSize: 22)
        priceLabel.text = "가격"
        
        priceLabel.translatesAutoresizingMaskIntoConstraints = false
        return priceLabel
    }()
    
    // 가격값 레이블
    private let priceValueLabel: UILabel = {
        let priceValueLabel = UILabel()
        priceValueLabel.font = UIFont.boldSystemFont(ofSize: 22)
        priceValueLabel.text = "14,000원"
        
        priceValueLabel.translatesAutoresizingMaskIntoConstraints = false
        return priceValueLabel
    }()
    // 가격 스택뷰
    private let priceStackView: UIStackView = {
        let priceStackView = UIStackView()
        priceStackView.axis = .horizontal
        priceStackView.distribution = .equalCentering
        priceStackView.alignment = .fill
        priceStackView.translatesAutoresizingMaskIntoConstraints = false
        
        return priceStackView
    }()
    
    // 음식 설명뷰 끝

    // 상세 선택 테이블뷰
    private let tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.isScrollEnabled = false
        tableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        tableView.separatorStyle = .none
        let selectionNib = UINib(nibName: "SelectionCell", bundle: nil)
        tableView.register(selectionNib, forCellReuseIdentifier: "SelectionCell")
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    // 장바구니에 담기 하단바
    private let addCartBar: UIView = {
        let addCartBar = UIView()
        addCartBar.backgroundColor = .white
        addCartBar.layer.maskedCorners = [.layerMinXMinYCorner,.layerMinXMaxYCorner]
        addCartBar.layer.borderWidth = 1
        addCartBar.layer.borderColor = UIColor.buttonBorderGray.cgColor
        addCartBar.translatesAutoresizingMaskIntoConstraints = false
        return addCartBar
    }()
    
    private let hstackView: UIStackView = {
        let hstackView = UIStackView()
        hstackView.axis = .horizontal
        hstackView.distribution = .equalSpacing
        hstackView.alignment = .fill
        hstackView.spacing = 3
        hstackView.backgroundColor = .white
        hstackView.translatesAutoresizingMaskIntoConstraints = false
        return hstackView
    }()
    
    // 배달최소주문금액
    private let minimumPriceLabel: UILabel = {
        let label = UILabel()
     
        let textLabel = UILabel()
        label.numberOfLines = 0
        textLabel.numberOfLines = 0
        textLabel.text = "배달최소주문금액 \n14,000원"
        textLabel.textColor = UIColor.darkGray
        let attributedString = NSMutableAttributedString(string: textLabel.text!)
        attributedString.addAttribute(.foregroundColor, value: UIColor.darkGray, range: (textLabel.text! as NSString).range(of: "배달최소주문금액"))
        attributedString.addAttribute(.font, value: UIFont.systemFont(ofSize: CGFloat(14)), range: (textLabel.text! as NSString).range(of: "배달최소주문금액"))
        attributedString.addAttribute(.font, value: UIFont.boldSystemFont(ofSize: CGFloat(15)), range: (textLabel.text! as NSString).range(of: "14,000원"))
        label.attributedText = attributedString
        label.sizeToFit()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // 장바구니에 담기 버튼
    private let addToCartButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .mint
        button.tintColor = .white
        button.setTitle("원 담기", for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 18)
        button.layer.cornerRadius = 4
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    // 장바구니 담기 하단바 끝
    
    private var currentPrice: Int = 14000   // 현재 금액
    let formatter = NumberFormatter()   // 14000 -> 14,000 으로 만들어 줄 포매터
    
    var selections: [Selection] = []
    var selectionItems1: [SelectionItem] = []
    var selectionItems2: [SelectionItem] = []
    var selectionItems3: [SelectionItem] = []
    var selectionItems4: [SelectionItem] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        tableView.dataSource = self
        tableView.delegate = self

        configureUI()   // 네비게이션바 설정
        addSubviews()   // view에 추가
        setLayout()     // 레이아웃 설정
        setData()
        
        // 현재 담은 메뉴의 가격
        let priceString = (convertIntToPriceString(price: currentPrice) ?? "1,4000") + "원 담기"
        addToCartButton.setTitle(priceString, for: .normal)
    }
    
    func setData() {
        
        selectionItems1.append(contentsOf: [
            SelectionItem(isEssential: true, isChecked: true, selectionMenu: "엽기떡볶이", priceValue: "+0원"),
            SelectionItem(isEssential: true, isChecked: false, selectionMenu: "엽기오뎅", priceValue: "+0원"),
            SelectionItem(isEssential: true, isChecked: false, selectionMenu: "엽기반반", priceValue: "+0원"),
            SelectionItem(isEssential: true, isChecked: false, selectionMenu: "엽기분모자떡볶이", priceValue: "+3,000원")
        ])
        selectionItems2.append(contentsOf: [
            SelectionItem(isEssential: true, isChecked: true, selectionMenu: "착한맛", priceValue: "+0원"),
            SelectionItem(isEssential: true, isChecked: false, selectionMenu: "초보맛", priceValue: "+0원"),
            SelectionItem(isEssential: true, isChecked: false, selectionMenu: "뎔매운맛", priceValue: "+0원"),
            SelectionItem(isEssential: true, isChecked: false, selectionMenu: "오리지널", priceValue: "+0원"),
            SelectionItem(isEssential: true, isChecked: false, selectionMenu: "매운맛", priceValue: "+0원")
        ])
        
        selectionItems3.append(contentsOf: [
            SelectionItem(isEssential: false, isChecked: false, selectionMenu: "떡 추가", priceValue: "+1,000원"),
            SelectionItem(isEssential: false, isChecked: false, selectionMenu: "오뎅 추가", priceValue: "+1,0000원"),
            SelectionItem(isEssential: false, isChecked: false, selectionMenu: "우삼겹 추가", priceValue: "+3,0000원"),
            SelectionItem(isEssential: false, isChecked: false, selectionMenu: "통유부(4개) 추가", priceValue: "+1,000원"),
            SelectionItem(isEssential: false, isChecked: false, selectionMenu: "퐁당치즈만두(7개) 추가", priceValue: "+2,000원"),
            SelectionItem(isEssential: false, isChecked: false, selectionMenu: "중국당면 추가", priceValue: "+2,500원"),
            SelectionItem(isEssential: false, isChecked: false, selectionMenu: "분모자 추가", priceValue: "+25,00원"),
        ])
        
        selectionItems4.append(contentsOf: [
            SelectionItem(isEssential: false, isChecked: false, selectionMenu: "모짜치즈 추가", priceValue: "+3,000원"),
            SelectionItem(isEssential: false, isChecked: false, selectionMenu: "햄(7개) 추가", priceValue: "+1,000원"),
            SelectionItem(isEssential: false, isChecked: false, selectionMenu: "베이컨 추가", priceValue: "+3,000원"),
            SelectionItem(isEssential: false, isChecked: false, selectionMenu: "계란(2개) 추가", priceValue: "+1,500원"),
            SelectionItem(isEssential: false, isChecked: false, selectionMenu: "메추리알(5개) 추가", priceValue: "+1,000원"),
            SelectionItem(isEssential: false, isChecked: false, selectionMenu: "우동사리 추가", priceValue: "+2,000원"),
            SelectionItem(isEssential: false, isChecked: false, selectionMenu: "당면사리 추가", priceValue: "+20,00원"),
        ])
        
        selections.append(contentsOf: [
            Selection(selectionKind: "메뉴 선택", isEssential: true, selectionItems: selectionItems1),
            Selection(selectionKind: "맛 선택", isEssential: true, selectionItems: selectionItems2),
            Selection(selectionKind: "토핑 추가 선택1", isEssential: false, selectionItems: selectionItems3),
            Selection(selectionKind: "토핑 추가 선택2", isEssential: false, selectionItems: selectionItems4)
        ])
    }
    
    // MARK: - navigation bar ui 설정
    func configureUI() {
        view.backgroundColor = .white
//        navigationItem.title = "동대문엽기떡볶이"
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.view.backgroundColor = .clear
        self.navigationController?.navigationBar.backgroundColor = .clear
        self.navigationController?.navigationBar.barTintColor = .clear
        navigationItem.setHidesBackButton(true, animated: true)
        let leftButton = UIBarButtonItem(image:UIImage(systemName: "arrow.backward"), style: .plain, target: nil, action: nil)
        leftButton.tintColor = .black
        leftButton.title = "동대문엽기떡볶이"
        navigationItem.leftBarButtonItem = leftButton
        
        let homeButton = UIBarButtonItem(image: UIImage(named: "홈"),
                                         style: .plain,
                                         target: nil,
                                         action: nil)
        let shareButton = UIBarButtonItem(image: UIImage(named: "공유"),
                                          style: .plain,
                                          target: nil,
                                          action: nil)
        let cartButton = UIBarButtonItem(image: UIImage(named: "장바구니"),
                                         style: .plain,
                                         target: self,
                                         action: #selector(pushToCart))
        
        
        homeButton.tintColor = .black
        shareButton.tintColor = .black
        cartButton.tintColor = .black
        
        navigationItem.rightBarButtonItems = [
            cartButton, shareButton, homeButton
        ]
    }

    // 장바구니 화면으로 넘어가기
    @objc func pushToCart() {
        let cartVC = CartViewController()
        self.navigationController?.pushViewController(cartVC, animated: true)
    }
    
    // 14000 -> "14,000" 으로 만들어준다.
    func convertIntToPriceString(price: Int?) -> String? {
        formatter.numberStyle = .decimal
        guard let price = price else {
            return nil
        }
        guard let formattedString = formatter.string(from: NSNumber(value: price)) else { return nil }
        return formattedString
    }
    
    // MARK: - 레이아웃 설정
    func addSubviews() {
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        
        contentView.addSubview(foodImageView)   // 음식 사진
        
        // 음식 설명 부분
        contentView.addSubview(descriptionView)
        [priceLabel, priceValueLabel].map {
            priceStackView.addArrangedSubview($0)
        }
        [foodMenu, menuDescriptionLabel, reviewIcon, reviewButton, priceStackView].map {
            descriptionView.addSubview($0)
        }
        // 음식 설명 부분 끝
  
        contentView.addSubview(tableView)   // 테이블뷰
        
        // 가격 하단바
        view.addSubview(addCartBar)
        [minimumPriceLabel, addToCartButton].map {
            hstackView.addArrangedSubview($0)
        }
        addCartBar.addSubview(hstackView)
        // 가격 하단바 끝
    }
    
    func setLayout() {  // 위치, 크기 설정
        let safe = view.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([   // 스크롤뷰
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: safe.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: safe.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: addCartBar.topAnchor)
        ])
        
        NSLayoutConstraint.activate([   // 콘텐트뷰
            contentView.topAnchor.constraint(equalTo: scrollView.contentLayoutGuide.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.contentLayoutGuide.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
        ])

        let contentViewHeight = contentView.heightAnchor.constraint(greaterThanOrEqualTo: view.heightAnchor)
        contentViewHeight.priority = .defaultLow
        contentViewHeight.isActive = true
        
        // 음식 이미지뷰
        NSLayoutConstraint.activate([
            foodImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            foodImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            foodImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            foodImageView.heightAnchor.constraint(equalToConstant: 200),
            foodImageView.widthAnchor.constraint(equalTo: contentView.widthAnchor)
        ])
        
        // 음식 설명 부분
        NSLayoutConstraint.activate([
            descriptionView.topAnchor.constraint(equalTo: foodImageView.bottomAnchor, constant: -4),
            descriptionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            descriptionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            descriptionView.heightAnchor.constraint(equalToConstant: 225)
        ])
        
        NSLayoutConstraint.activate([
            foodMenu.topAnchor.constraint(equalTo: descriptionView.topAnchor, constant: 18),
            foodMenu.leadingAnchor.constraint(equalTo: descriptionView.leadingAnchor, constant: 14)
        ])
        
        NSLayoutConstraint.activate([
            menuDescriptionLabel.topAnchor.constraint(equalTo: foodMenu.bottomAnchor, constant: 6),
            menuDescriptionLabel.leadingAnchor.constraint(equalTo: foodMenu.leadingAnchor, constant: 4),
            menuDescriptionLabel.trailingAnchor.constraint(equalTo: descriptionView.trailingAnchor, constant: -14)
        ])
        
        NSLayoutConstraint.activate([
            reviewIcon.topAnchor.constraint(equalTo: menuDescriptionLabel.bottomAnchor, constant: 18),
            reviewIcon.leadingAnchor.constraint(equalTo: foodMenu.leadingAnchor),
            reviewIcon.widthAnchor.constraint(equalToConstant: 32),
            reviewIcon.heightAnchor.constraint(equalToConstant: 32)
        ])
        
        NSLayoutConstraint.activate([
            reviewButton.topAnchor.constraint(equalTo: reviewIcon.topAnchor, constant: 2),
            reviewButton.leadingAnchor.constraint(equalTo: reviewIcon.trailingAnchor, constant: 8)
        ])
        
        NSLayoutConstraint.activate([
            priceStackView.topAnchor.constraint(equalTo: reviewIcon.bottomAnchor, constant: 12),
            priceStackView.leadingAnchor.constraint(equalTo: menuDescriptionLabel.leadingAnchor),
            priceStackView.trailingAnchor.constraint(equalTo: descriptionView.trailingAnchor, constant: -18)
        ])
        
        // 음식 설명뷰 끝
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: descriptionView.bottomAnchor, constant: 12),
            tableView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -12)
        ])
        
        
        // 가격 하단바
        NSLayoutConstraint.activate([
            addCartBar.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            addCartBar.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            addCartBar.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            addCartBar.heightAnchor.constraint(equalToConstant: view.height / 8)
        ])
        
        NSLayoutConstraint.activate([
            hstackView.leadingAnchor.constraint(equalTo: addCartBar.leadingAnchor, constant: 12),
            hstackView.trailingAnchor.constraint(equalTo: addCartBar.trailingAnchor, constant: -12),
            hstackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -12),
            hstackView.topAnchor.constraint(equalTo: addCartBar.topAnchor, constant: 12)
            
        ])
        
        NSLayoutConstraint.activate([
            addToCartButton.widthAnchor.constraint(equalToConstant: view.width / 1.55)
        ])
    }
}


extension SelectMenuViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        selections.count+1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "SelectionCell", for: indexPath) as? SelectionCell else {
            return UITableViewCell()
        }
        
        cell.selectionNameLabel.text = selections[indexPath.row].selectionKind
        cell.selectConditionLabel.text = selections[indexPath.row].isEssentialString
        cell.selection = selections[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(72 + (50 * (selections[indexPath.row].selectionItems?.count ?? 0)))
//        return 1000
    }
}

