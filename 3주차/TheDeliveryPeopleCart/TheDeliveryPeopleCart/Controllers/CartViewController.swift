//
//  CartViewController.swift
//  TheDeliveryPeopleCart
//
//  Created by 조유진 on 2023/10/03.
//

import UIKit

class CartViewController: UIViewController {
    let segmentedControl: UISegmentedControl = {
        let control = UnderlineSegmentedControl(items: ["배달/포장", "배민스토어", "대용량특가", "전국별미"])
        // 폰트 크기를 조정하려면
        let font = UIFont.systemFont(ofSize: 16) // 원하는 폰트 크기로 변경
        control.setTitleTextAttributes([NSAttributedString.Key.font: font], for: .normal)
//        control.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.buttonTextGray], for: .normal)
        let boldFont = UIFont.boldSystemFont(ofSize: 16)
        control.setTitleTextAttributes([NSAttributedString.Key.font: boldFont], for: .selected)
//        control.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.black], for: .selected)
        
        control.translatesAutoresizingMaskIntoConstraints = false
        return control
      }()
    
    
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    private let contentView: UIView = {
        let contentView = UIView()
        
        contentView.translatesAutoresizingMaskIntoConstraints = false
        return contentView
    }()
    
    private let infoHeaderView: UIView = {
        let view = UIView()
        view.backgroundColor = .gray
        
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let infoStackView: UIStackView = {
        let stackView = UIStackView()
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    // 엽기떡볶이 한성대점
    private let storeLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.lineBreakMode = .byCharWrapping
        let attributedString = NSMutableAttributedString(string: "")
        let fontSize = UIFont.boldSystemFont(ofSize: 18)
        
        let imageAttachment = NSTextAttachment()
        imageAttachment.image = UIImage(named: "엽떡아이콘")
        imageAttachment.bounds = CGRect(x: 0, y: -6, width: 22, height: 22)
        
        let text = " 엽기떡볶이 한성대점"
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
    
    // 엽기떡볶이 한성대점
    private let timeLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.lineBreakMode = .byCharWrapping
        let attributedString = NSMutableAttributedString(string: "")
        let fontSize = UIFont.systemFont(ofSize: 14)
        
        let imageAttachment = NSTextAttachment()
        imageAttachment.image = UIImage(named: "time")
        imageAttachment.bounds = CGRect(x: 0, y: -4, width: 18, height: 18)
        
        let text = " 39~54분 후 도착"
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
    
    
    private let bottomOrderView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.maskedCorners = [.layerMinXMinYCorner,.layerMinXMaxYCorner]
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.buttonBorderGray.cgColor
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    // 장바구니에 담기 버튼
    private let orderStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .equalCentering
        stackView.backgroundColor = .mint
        
        stackView.layer.cornerRadius = 4
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private let countLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 28, height: 28))
        label.text = "1"
        label.textAlignment = .center
        label.font = .boldSystemFont(ofSize: 14)
        label.backgroundColor = .white // 배경색을 설정해서 모서리 둥근 효과가 잘 보이도록 함
        label.clipsToBounds = true
        label.layer.masksToBounds = true
        label.textColor = .mint
        label.layer.cornerRadius = label.frame.height / 2 // 원하는 모서리 둥근 정도 설정
        
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private let orderMessage: UILabel = {
        let label = UILabel()
        label.text = "배달 주문하기"
        label.font = UIFont.boldSystemFont(ofSize: 22)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let totalPriceLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 26))
        label.text = "14,000원"
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var currentPrice: Int = 14000   // 현재 금액
    let formatter = NumberFormatter()   // 14000 -> 14,000 으로 만들어 줄 포매터

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setNavigationUI()
        addSubviews()
        setLayout()
        
        let priceString = (convertIntToPriceString(price: currentPrice) ?? "1,4000") + "원"
        totalPriceLabel.text = priceString
    }
    
    func addSubviews(){
        view.addSubview(scrollView)
        view.addSubview(segmentedControl)
        scrollView.addSubview(contentView)
        contentView.addSubview(infoHeaderView)
        view.addSubview(bottomOrderView)
        bottomOrderView.addSubview(orderStackView)
        
        [countLabel, orderMessage, totalPriceLabel].map {
            orderStackView.addArrangedSubview($0)
        }
        
        infoHeaderView.addSubview(infoStackView)
        [storeLabel, timeLabel].map {
            infoStackView.addArrangedSubview($0)
        }
    }
    
    func setLayout() {
        let safeLayout = view.safeAreaLayoutGuide
        let contentLayout = scrollView.contentLayoutGuide
        
        self.segmentedControl.addTarget(self, action: #selector(didChangeValue(segment:)), for: .valueChanged)
            
        self.segmentedControl.selectedSegmentIndex = 0
        self.didChangeValue(segment: self.segmentedControl)
        
        NSLayoutConstraint.activate([
            segmentedControl.topAnchor.constraint(equalTo: safeLayout.topAnchor),
            segmentedControl.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            segmentedControl.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            segmentedControl.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        // 스크롤뷰
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: segmentedControl.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: contentLayout.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: contentLayout.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: contentLayout.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: contentLayout.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
        ])
        let contentViewHeight = contentView.heightAnchor.constraint(greaterThanOrEqualTo: view.heightAnchor)
        contentViewHeight.priority = .defaultLow
        contentViewHeight.isActive = true
        
        NSLayoutConstraint.activate([
            infoHeaderView.topAnchor.constraint(equalTo: contentView.topAnchor),
            infoHeaderView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            infoHeaderView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            infoHeaderView.heightAnchor.constraint(equalToConstant: 100)
        ])
        
        NSLayoutConstraint.activate([
            infoStackView.centerYAnchor.constraint(equalTo: infoHeaderView.centerYAnchor),
            infoStackView.centerXAnchor.constraint(equalTo: infoHeaderView.centerXAnchor),
            infoStackView.widthAnchor.constraint(equalToConstant: infoHeaderView.width - 12),
            infoStackView.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        
        // 하단바
        NSLayoutConstraint.activate([
            bottomOrderView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            bottomOrderView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            bottomOrderView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            bottomOrderView.heightAnchor.constraint(equalToConstant: 110)
        ])
        
        NSLayoutConstraint.activate([
            orderStackView.leadingAnchor.constraint(equalTo: bottomOrderView.leadingAnchor, constant: 10),
            orderStackView.trailingAnchor.constraint(equalTo: bottomOrderView.trailingAnchor, constant: -10),
            orderStackView.topAnchor.constraint(equalTo: bottomOrderView.topAnchor, constant: 12),
            orderStackView.bottomAnchor.constraint(equalTo: bottomOrderView.safeAreaLayoutGuide.bottomAnchor, constant: -12),
            orderStackView.widthAnchor.constraint(equalToConstant: bottomOrderView.width - 20),
            orderStackView.heightAnchor.constraint(equalToConstant: 74)
        ])
        
        NSLayoutConstraint.activate([
            countLabel.leadingAnchor.constraint(equalTo: orderStackView.leadingAnchor, constant: 24),
            countLabel.widthAnchor.constraint(equalToConstant: 28),
            countLabel.heightAnchor.constraint(equalToConstant: 28)
        ])
        
        NSLayoutConstraint.activate([
            totalPriceLabel.centerYAnchor.constraint(equalTo: orderStackView.centerYAnchor),
            totalPriceLabel.trailingAnchor.constraint(equalTo: orderStackView.trailingAnchor, constant: -24),
            totalPriceLabel.widthAnchor.constraint(equalToConstant: 84),
            totalPriceLabel.heightAnchor.constraint(equalToConstant: 16)
        ])
        
        
        
    }
    
    func setNavigationUI() {
        navigationItem.setHidesBackButton(true, animated: true)
        navigationItem.title = "장바구니"
        let leftButton = UIBarButtonItem(image:UIImage(systemName: "arrow.backward"), style: .plain, target: self, action: #selector(back(_:)))
        leftButton.tintColor = .black
        leftButton.title = "장바구니"
        navigationItem.leftBarButtonItem = leftButton
        self.navigationController?.navigationBar.tintColor = .black
        self.navigationController?.navigationBar.topItem?.title = ""
        
        let homeButton = UIBarButtonItem(image: UIImage(named: "홈"),
                                         style: .plain,
                                         target: nil,
                                         action: nil)
        let shareButton = UIBarButtonItem(image: UIImage(named: "인원추가"),
                                          style: .plain,
                                          target: nil,
                                          action: nil)
        
        
        homeButton.tintColor = .black
        shareButton.tintColor = .black
        
        navigationItem.rightBarButtonItems = [
            shareButton, homeButton
        ]
    }
    
    @objc func back(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    var shouldHideFirstView: Bool? {
        didSet {
          guard let shouldHideFirstView = self.shouldHideFirstView else { return }
          self.contentView.isHidden = shouldHideFirstView
//          self.secondView.isHidden = !self.firstView.isHidden
        }
      }

    @objc private func didChangeValue(segment: UISegmentedControl) {
        self.shouldHideFirstView = segment.selectedSegmentIndex != 0
        
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
}
