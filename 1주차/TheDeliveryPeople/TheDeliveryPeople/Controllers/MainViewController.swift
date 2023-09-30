//
//  ViewController.swift
//  TheDeliveryPeople
//
//  Created by 조유진 on 2023/09/16.
//

import UIKit

class MainViewController: UIViewController {
    
    // 상단 뷰 시작
    private let topView: UIView = {
        let topView = UIView()
        topView.backgroundColor = UIColor.mint
        return topView
    }()
    
    private let currentAddress: UIButton = {     // 우리집
        let currentAddress = UIButton()
        currentAddress.titleLabel?.adjustsFontForContentSizeCategory = true
        let arrowDownImage = UIImage(named: "arrow_drop_down")
        let imageSize = CGSize(width: 24, height: 24)
        let newImage = arrowDownImage?.resized(to: imageSize)
        currentAddress.setImage(newImage, for: .normal)
        currentAddress.setTitle("우리집", for: .normal)
        currentAddress.titleLabel?.font = UIFont.boldSystemFont(ofSize: CGFloat(18))
        currentAddress.setTitleColor(.white, for: .normal)
        currentAddress.semanticContentAttribute = .forceRightToLeft
        currentAddress.contentVerticalAlignment = .center
        currentAddress.contentHorizontalAlignment = .center
        return currentAddress
    }()
    
    private let menu: UIButton = {      // 메뉴 아이콘
        let menu = UIButton()
        menu.tintColor = .white
        menu.setImage(UIImage(named: "menu"), for: .normal)
        return menu
    }()
    
    private let alarm: UIButton = {     // 알림 아이콘
        let alarm = UIButton()
        alarm.tintColor = .white
        alarm.setImage(UIImage(named: "bell"), for: .normal)
        return alarm
    }()
    
    private let cart: UIButton = {      // 장바구니 아이콘
        let cart = UIButton()
        cart.frame = CGRect(x: 0, y: 0, width: 36, height: 36)
        cart.tintColor = .white
        cart.setImage(UIImage(named: "cart"), for: .normal)
        return cart
    }()
    // 상단 뷰 끝
    
    // 가운데 뷰 시작
    // 스크롤뷰
    private let scrollView: UIScrollView = {    // 스크롤뷰
        let scrollView = UIScrollView()
        scrollView.backgroundColor = UIColor.backgroundGray
        
        return scrollView
    }()
    
    private let searchView: UIView = {  // 검색 뷰
        let searchView = UIView()
        searchView.backgroundColor = .mint
        searchView.layer.cornerRadius = 18
        searchView.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        return searchView
    }()
    
    private let searchBox: UIView = {   // 검색 박스
        let searchBox = UIView()
        searchBox.backgroundColor = .white
        searchBox.layer.cornerRadius = 2
        searchBox.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner, .layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        searchBox.layer.shadowOffset = CGSize(width: 1, height: 1)
        searchBox.layer.shadowOpacity = 0.3
        searchBox.layer.masksToBounds = false
        
        return searchBox
    }()
    
    private let searchPlaceholder: UILabel = {  // 검색 아이콘 + 문구
        let searchPlaceholder = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 24.0))
        
        let attributes: [NSAttributedString.Key : Any] = [
            NSAttributedString.Key.foregroundColor: UIColor.secondaryLabel,
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16)
        ]
        let attributedString = NSMutableAttributedString(string: " 찾아라! 맛있는 음식과 맛집", attributes: attributes)

        let fontName = UIFont.systemFont(ofSize: 16)
        if let searchImage = UIImage(named: "검색아이콘") {
            let iconAttachment = NSTextAttachment()
            iconAttachment.image = searchImage
            let mid = fontName.descender + fontName.capHeight
            iconAttachment.bounds = CGRect(x: 0, y: fontName.descender - 12 / 2 + mid / 2, width: 24, height: 24)
            let iconString = NSAttributedString(attachment: iconAttachment)
            attributedString.insert(iconString, at: 0)
        }
        searchPlaceholder.attributedText = attributedString
        searchPlaceholder.sizeToFit()
        
        return searchPlaceholder
    }()
    
    
    // 배달, 배민스토어, 대용량특가
    
    private let deliveryView: UIView = {
        let deliveryView = UIView()
        deliveryView.backgroundColor = .white
        deliveryView.layer.cornerRadius = 16
        deliveryView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner, .layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        deliveryView.layer.shadowOffset = CGSize(width: 0, height: 0)
        deliveryView.layer.shadowOpacity = 0.06
        
        return deliveryView
    }()
    
    private let deliveryLabel: UILabel = {
        let deliveryLabel = UILabel()
        deliveryLabel.text = "배달"
        deliveryLabel.font = UIFont(name: "BMHANNAPro", size: 21)
        deliveryLabel.dynamicFont(fontSize: 21)
        
        return deliveryLabel
    }()
    private let deliveryDesLabel: UILabel = {
        let deliveryDesLabel = UILabel()
        deliveryDesLabel.numberOfLines = 0
        deliveryDesLabel.tintColor = .gray
        deliveryDesLabel.text = "세상은 넓고\n맛집은 많다"
        deliveryDesLabel.font = UIFont.systemFont(ofSize: 14, weight: .light)
        deliveryDesLabel.dynamicFont(fontSize: 14)
        
        return deliveryDesLabel
    }()
    private let deliveryImageView: UIImageView = {
        let deliveryImageView = UIImageView()
        deliveryImageView.image = UIImage(named: "배달냥")
        
        return deliveryImageView
    }()
    
    private let baeminStoreView: UIView = {
        let baeminStoreView = UIView()
        baeminStoreView.backgroundColor = .white
        baeminStoreView.layer.cornerRadius = 16
        baeminStoreView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner, .layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        baeminStoreView.layer.shadowOffset = CGSize(width: 0, height: 0)
        baeminStoreView.layer.shadowOpacity = 0.06
        
        return baeminStoreView
    }()
    
    private let baeminStoreLabel: UILabel = {
        let baeminStoreLabel = UILabel()
        baeminStoreLabel.text = "배민스토어"
        baeminStoreLabel.font = UIFont(name: "BMHANNAPro", size: 21)
        baeminStoreLabel.dynamicFont(fontSize: 21)
        
        return baeminStoreLabel
    }()
    private let baeminStoreDesLabel: UILabel = {
        let baeminStoreDesLabel = UILabel()
        baeminStoreDesLabel.numberOfLines = 0
        baeminStoreDesLabel.tintColor = .gray
        baeminStoreDesLabel.text = "배달은 지금\n옵니다"
        baeminStoreDesLabel.font = UIFont.systemFont(ofSize: 14, weight: .light)
        baeminStoreDesLabel.dynamicFont(fontSize: 14)
        
        return baeminStoreDesLabel
    }()
    private let baeminStoreImageView: UIImageView = {
        let baeminStoreImageView = UIImageView()
        baeminStoreImageView.image = UIImage(named: "배민스토어")
        baeminStoreImageView.layer.shadowOffset = CGSize(width: 0, height: 3)
        baeminStoreImageView.layer.shadowOpacity = 0.3
        return baeminStoreImageView
    }()
    
    
    private let largeSpecialPriceView: UIView = {
        let largeSpecialPriceView = UIView()
        largeSpecialPriceView.backgroundColor = .white
        largeSpecialPriceView.layer.cornerRadius = 16
        largeSpecialPriceView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner, .layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        largeSpecialPriceView.layer.shadowOffset = CGSize(width: 0, height: 0)
        largeSpecialPriceView.layer.shadowOpacity = 0.06
        
        return largeSpecialPriceView
    }()
    
    private let largeSpecialPriceLabel: UILabel = {
        let largeSpecialPriceLabel = UILabel()
        largeSpecialPriceLabel.text = "대용량특가"
        largeSpecialPriceLabel.font = UIFont(name: "BMHANNAPro", size: 21)
        largeSpecialPriceLabel.dynamicFont(fontSize: 21)
        
        return largeSpecialPriceLabel
    }()
    private let largeSpecialPriceDesLabel: UILabel = {
        let largeSpecialPriceDesLabel = UILabel()
        largeSpecialPriceDesLabel.numberOfLines = 0
        largeSpecialPriceDesLabel.tintColor = .gray
        largeSpecialPriceDesLabel.text = "많이 쓰는 상품\n더 저렴하게"
        largeSpecialPriceDesLabel.font = UIFont.systemFont(ofSize: 14, weight: .light)
        largeSpecialPriceDesLabel.dynamicFont(fontSize: 14)
        
        return largeSpecialPriceDesLabel
    }()
    private let largeSpecialPriceImageView: UIImageView = {
        let largeSpecialPriceImageView = UIImageView()
        largeSpecialPriceImageView.image = UIImage(named: "대용량특가")
        largeSpecialPriceImageView.layer.shadowOffset = CGSize(width: 0, height: 3)
        largeSpecialPriceImageView.layer.shadowOpacity = 0.3
        largeSpecialPriceImageView.layer.shadowRadius = 6
        return largeSpecialPriceImageView
    }()
    
    private let hstackView: UIStackView =  {
        let hstackView = UIStackView()
        hstackView.axis = .horizontal
        hstackView.alignment = .fill
        hstackView.distribution = .equalSpacing
        hstackView.spacing = 14
        
        return hstackView
    }()
    
    // 배달, 배민스토어, 대용량특가 끝
    
    
    // 알뜰, 한집배달 시작
    private let baemin1View: UIView = {
        let baemin1View = UIView()
        baemin1View.backgroundColor = .white
        baemin1View.layer.cornerRadius = 16
        baemin1View.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner, .layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        baemin1View.layer.shadowOffset = CGSize(width: 0, height: 0)
        baemin1View.layer.shadowOpacity = 0.06
        
        return baemin1View
    }()
    
    private let oneHomeDeliveryLabel: UILabel = {
        let oneHomeDeliveryLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 24.0))
        
//        let attributes: [NSAttributedString.Key : Any] = [
//            NSAttributedString.Key.foregroundColor: UIColor.black,
//            NSAttributedString.Key.font: UIFont(name: "BMHANNAPro", size: 21)
//        ]
        let textLabel = UILabel()
        textLabel.text = "알뜰,한집배달 배민1 원하는대로 골라 주문!"
        
        let attributedString = NSMutableAttributedString(string: textLabel.text!)
        attributedString.addAttribute(.foregroundColor, value: UIColor.black, range: (textLabel.text! as NSString).range(of: "알뜰,한집배달"))
        attributedString.addAttribute(.font, value: UIFont(name: "BMHANNAPro", size: 21), range: (textLabel.text! as NSString).range(of: "알뜰,한집배달"))
        
        attributedString.addAttribute(.foregroundColor, value: UIColor.black, range: (textLabel.text! as NSString).range(of: "배민1"))
        attributedString.addAttribute(.font, value: UIFont.boldSystemFont(ofSize: CGFloat(16)), range: (textLabel.text! as NSString).range(of: "배민1"))
        
        attributedString.addAttribute(.foregroundColor, value: UIColor.black, range: (textLabel.text! as NSString).range(of: "원하는대로 골라 주문!"))
        attributedString.addAttribute(.font, value: UIFont.systemFont(ofSize: CGFloat(16)), range: (textLabel.text! as NSString).range(of: "원하는대로 골라 주문!"))
        
        oneHomeDeliveryLabel.attributedText = attributedString
        oneHomeDeliveryLabel.sizeToFit()
        
        return oneHomeDeliveryLabel
    }()
    private let rightArrow: UIButton = {      // 메뉴 아이콘
        let rightArrow = UIButton()
        rightArrow.tintColor = .white
        rightArrow.setImage(UIImage(named: "right_arrow"), for: .normal)
        return rightArrow
    }()
    
    private let rowstackview1: UIStackView = {
        let rowstackview1 = UIStackView()
        rowstackview1.axis = .horizontal
        rowstackview1.alignment = .fill
        rowstackview1.distribution = .equalSpacing
        rowstackview1.spacing = 22
        
        return rowstackview1
    }()
    
    // 알뜰배달 시작
    private let frugalDeliveryView: UIView = {
        let frugalDeliveryView = UIView()
        frugalDeliveryView.backgroundColor = .buttonGray
        frugalDeliveryView.layer.cornerRadius = 26
        frugalDeliveryView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner, .layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        
        return frugalDeliveryView
    }()
    
    private let frugalImageView: UIImageView = {      // 메뉴 아이콘
        let frugalImageView = UIImageView(image: UIImage(named: "알뜰배달"))
        frugalImageView.layer.shadowOffset = CGSize(width: 0, height: 1)
        frugalImageView.layer.shadowOpacity = 0.3
        return frugalImageView
    }()
    private let frugalLabel: UILabel = {
        let frugalLabel = UILabel()
        frugalLabel.text = "알뜰배달"
        frugalLabel.textAlignment = .center
        frugalLabel.font = UIFont.systemFont(ofSize: 11)
        return frugalLabel
    }()
    private let frugalStackView: UIStackView = {
        let frugalStackView = UIStackView()
        frugalStackView.axis = .vertical
        frugalStackView.alignment = .fill
        frugalStackView.distribution = .equalSpacing
        frugalStackView.spacing = 4
        return frugalStackView
    }()
    
    // 알뜰배달 끝
    
    // 족발,보쌈 시작
    private let bossamView: UIView = {
        let bossamView = UIView()
        bossamView.backgroundColor = .buttonGray
        bossamView.layer.cornerRadius = 22
        bossamView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner, .layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        
        return bossamView
    }()
    
    private let bossamImageView: UIImageView = {      // 메뉴 아이콘
        let bossamImageView = UIImageView(image: UIImage(named: "족발"))
        bossamImageView.layer.shadowOffset = CGSize(width: 0, height: 1)
        bossamImageView.layer.shadowOpacity = 0.3
        return bossamImageView
    }()
    private let bossamLabel: UILabel = {
        let bossamLabel = UILabel()
        bossamLabel.text = "족발•보쌈"
        bossamLabel.setContentCompressionResistancePriority(.required, for: .vertical)
        bossamLabel.textAlignment = .center
        bossamLabel.font = UIFont.systemFont(ofSize: 11)
        return bossamLabel
    }()
    private let bossamStackView: UIStackView = {
        let bossamStackView = UIStackView()
        bossamStackView.axis = .vertical
        bossamStackView.alignment = .fill
        bossamStackView.distribution = .equalSpacing
        bossamStackView.spacing = 4
        return bossamStackView
    }()
    
    // 족발보쌈 끝
    
    // 돈까스,회 시작
    private let susiView: UIView = {
        let susiView = UIView()
        susiView.backgroundColor = .buttonGray
        susiView.layer.cornerRadius = 22
        susiView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner, .layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        
        return susiView
    }()
    
    private let susiImageView: UIImageView = {      // 메뉴 아이콘
        let susiImageView = UIImageView(image: UIImage(named: "susi"))
        susiImageView.layer.shadowOffset = CGSize(width: 0, height: 1)
        susiImageView.layer.shadowOpacity = 0.3
        return susiImageView
    }()
    private let susiLabel: UILabel = {
        let susiLabel = UILabel()
        susiLabel.text = "돈까스•회"
        susiLabel.textAlignment = .center
        susiLabel.font = UIFont.systemFont(ofSize: 11)
        return susiLabel
    }()
    private let susiStackView: UIStackView = {
        let susiStackView = UIStackView()
        susiStackView.axis = .vertical
        susiStackView.alignment = .fill
        susiStackView.distribution = .equalSpacing
        susiStackView.spacing = 4
        return susiStackView
    }()
    
    // 돈까스,회 끝
    
    // 피자 시작
    private let pizzaView: UIView = {
        let pizzaView = UIView()
        pizzaView.backgroundColor = .buttonGray
        pizzaView.layer.cornerRadius = 22
        pizzaView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner, .layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        
        return pizzaView
    }()
    
    private let pizzaImageView: UIImageView = {      // 메뉴 아이콘
        let pizzaImageView = UIImageView(image: UIImage(named: "피자"))
        pizzaImageView.layer.shadowOffset = CGSize(width: 0, height: 1)
        pizzaImageView.layer.shadowOpacity = 0.3
        return pizzaImageView
    }()
    private let pizzaLabel: UILabel = {
        let pizzaLabel = UILabel()
        pizzaLabel.text = "피자"
        pizzaLabel.textAlignment = .center
        pizzaLabel.font = UIFont.systemFont(ofSize: 12)
        return pizzaLabel
    }()
    private let pizzaStackView: UIStackView = {
        let pizzaStackView = UIStackView()
        pizzaStackView.axis = .vertical
        pizzaStackView.alignment = .fill
        pizzaStackView.distribution = .equalSpacing
        pizzaStackView.spacing = 4
        return pizzaStackView
    }()
    
    // 피자 끝
    
    // 중식 시작
    private let joongsickView: UIView = {
        let joongsickView = UIView()
        joongsickView.backgroundColor = .buttonGray
        joongsickView.layer.cornerRadius = 22
        joongsickView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner, .layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        
        return joongsickView
    }()
    
    private let joongsickImageView: UIImageView = {      // 메뉴 아이콘
        let joongsickImageView = UIImageView(image: UIImage(named: "중식"))
        joongsickImageView.layer.shadowOffset = CGSize(width: 0, height: 1)
        joongsickImageView.layer.shadowOpacity = 0.3
        return joongsickImageView
    }()
    private let joongsickLabel: UILabel = {
        let joongsickLabel = UILabel()
        joongsickLabel.text = "중식"
        joongsickLabel.textAlignment = .center
        joongsickLabel.font = UIFont.systemFont(ofSize: 12)
        return joongsickLabel
    }()
    private let joongsickStackView: UIStackView = {
        let joongsickStackView = UIStackView()
        joongsickStackView.axis = .vertical
        joongsickStackView.alignment = .fill
        joongsickStackView.distribution = .equalSpacing
        joongsickStackView.spacing = 4
        return joongsickStackView
    }()
    
    // 중식 끝
    
    
    private let rowstackview2: UIStackView = {
        let rowstackview2 = UIStackView()
        rowstackview2.axis = .horizontal
        rowstackview2.alignment = .fill
        rowstackview2.distribution = .equalSpacing
        rowstackview2.spacing = 24
        
        return rowstackview2
    }()
    
    // 치킨 시작
    private let chickenView: UIView = {
        let chickenView = UIView()
        chickenView.backgroundColor = .buttonGray
        chickenView.layer.cornerRadius = 22
        chickenView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner, .layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        
        return chickenView
    }()
    
    private let chickenImageView: UIImageView = {      // 메뉴 아이콘
        let chickenImageView = UIImageView(image: UIImage(named: "치킨"))
        chickenImageView.layer.shadowOffset = CGSize(width: 0, height: 1)
        chickenImageView.layer.shadowOpacity = 0.3
        return chickenImageView
    }()
    private let chickenLabel: UILabel = {
        let chickenLabel = UILabel()
        chickenLabel.text = "치킨"
        chickenLabel.textAlignment = .center
        chickenLabel.font = UIFont.systemFont(ofSize: 12)
        return chickenLabel
    }()
    private let chickenStackView: UIStackView = {
        let chickenStackView = UIStackView()
        chickenStackView.axis = .vertical
        chickenStackView.alignment = .fill
        chickenStackView.distribution = .equalSpacing
        chickenStackView.spacing = 4
        return chickenStackView
    }()
    
    // 치킨 끝
    
    // 족발,보쌈 시작
    private let buggerView: UIView = {
        let bossamView = UIView()
        bossamView.backgroundColor = .buttonGray
        bossamView.layer.cornerRadius = 22
        bossamView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner, .layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        
        return bossamView
    }()
    
    private let buggerImageView: UIImageView = {      // 메뉴 아이콘
        let buggerImageView = UIImageView(image: UIImage(named: "버거"))
        buggerImageView.layer.shadowOffset = CGSize(width: 0, height: 1)
        buggerImageView.layer.shadowOpacity = 0.3
        return buggerImageView
    }()
    private let buggerLabel: UILabel = {
        let buggerLabel = UILabel()
        buggerLabel.text = "버거"
        buggerLabel.textAlignment = .center
        buggerLabel.font = UIFont.systemFont(ofSize: 12)
        return buggerLabel
    }()
    private let buggerStackView: UIStackView = {
        let buggerStackView = UIStackView()
        buggerStackView.axis = .vertical
        buggerStackView.alignment = .fill
        buggerStackView.distribution = .equalSpacing
        buggerStackView.spacing = 4
        return buggerStackView
    }()
    
    // 버거 끝
    
    // 분식 시작
    private let bunsickView: UIView = {
        let bunsickView = UIView()
        bunsickView.backgroundColor = .buttonGray
        bunsickView.layer.cornerRadius = 22
        bunsickView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner, .layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        
        return bunsickView
    }()
    
    private let bunsickImageView: UIImageView = {      // 메뉴 아이콘
        let bunsickImageView = UIImageView(image: UIImage(named: "분식"))
        bunsickImageView.layer.shadowOffset = CGSize(width: 0, height: 1)
        bunsickImageView.layer.shadowOpacity = 0.3
        return bunsickImageView
    }()
    private let bunsickLabel: UILabel = {
        let bunsickLabel = UILabel()
        bunsickLabel.text = "분식"
        bunsickLabel.textAlignment = .center
        bunsickLabel.font = UIFont.systemFont(ofSize: 12)
        return bunsickLabel
    }()
    private let bunsickStackView: UIStackView = {
        let bunsickStackView = UIStackView()
        bunsickStackView.axis = .vertical
        bunsickStackView.alignment = .fill
        bunsickStackView.distribution = .equalSpacing
        bunsickStackView.spacing = 4
        return bunsickStackView
    }()
    
    // 분식 끝
    
    // 디저트 시작
    private let dessertView: UIView = {
        let dessertView = UIView()
        dessertView.backgroundColor = .buttonGray
        dessertView.layer.cornerRadius = 22
        dessertView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner, .layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        
        return dessertView
    }()
    
    private let dessertImageView: UIImageView = {      // 메뉴 아이콘
        let dessertImageView = UIImageView(image: UIImage(named: "디저트"))
        dessertImageView.layer.shadowOffset = CGSize(width: 0, height: 1)
        dessertImageView.layer.shadowOpacity = 0.3
        return dessertImageView
    }()
    private let dessertLabel: UILabel = {
        let dessertLabel = UILabel()
        dessertLabel.text = "디저트"
        dessertLabel.textAlignment = .center
        dessertLabel.font = UIFont.systemFont(ofSize: 12)
        return dessertLabel
    }()
    private let dessertStackView: UIStackView = {
        let dessertStackView = UIStackView()
        dessertStackView.axis = .vertical
        dessertStackView.alignment = .fill
        dessertStackView.distribution = .equalSpacing
        dessertStackView.spacing = 4
        return dessertStackView
    }()
    
    // 디저트 끝
    
    // 전체보기 시작
    private let totalView: UIView = {
        let totalView = UIView()
        totalView.backgroundColor = .buttonGray
        totalView.layer.cornerRadius = 22
        totalView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner, .layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        
        return totalView
    }()
    
    private let totalImageView: UIImageView = {      // 메뉴 아이콘
        let totalImageView = UIImageView(image: UIImage(named: "전체보기"))
        totalImageView.layer.shadowOffset = CGSize(width: 0, height: 1)
        totalImageView.layer.shadowOpacity = 0.3
        return totalImageView
    }()
    private let totalLabel: UILabel = {
        let totalLabel = UILabel()
        totalLabel.text = "전체보기"
        totalLabel.textAlignment = .center
        totalLabel.font = UIFont.systemFont(ofSize: 12)
        return totalLabel
    }()
    private let totalStackView: UIStackView = {
        let totalStackView = UIStackView()
        totalStackView.axis = .vertical
        totalStackView.alignment = .fill
        totalStackView.distribution = .equalSpacing
        totalStackView.spacing = 4
        return totalStackView
    }()
    
    // 전체보기 끝
    
    private let vstackView: UIStackView = {
        let vstackView = UIStackView()
        vstackView.axis = .vertical
        vstackView.alignment = .fill
        vstackView.distribution = .equalSpacing
        vstackView.spacing = 18
        
        return vstackView
    }()
    
    // 알뜰, 한집배달 끝
    
    // 광고 배너 이미지
    private let adBanner: UIImageView = {
        let adBanner = UIImageView(image: UIImage(named: "할인광고"))
        
        return adBanner
    }()
    
    // 포장, 전국별미, 선물하기
    private let menuView: UIView = {
        let menuView = UIView()
        menuView.backgroundColor = .white
        menuView.layer.addBorder([.top, .bottom], color: UIColor.borderGray, width: 2.0)
        
        return menuView
    }()
    
    
    
    // 포쟝, 전국별미, 선물하기
    private let rowstackview3: UIStackView = {
        let rowstackview3 = UIStackView()
        rowstackview3.axis = .horizontal
        rowstackview3.alignment = .fill
        rowstackview3.distribution = .equalSpacing
        rowstackview3.spacing = 24
        
        return rowstackview3
    }()
    
    
    // 포장 시작
    private let takeOutView: UIView = {
        let takeOutView = UIView()
        takeOutView.backgroundColor = .buttonGray
        takeOutView.layer.cornerRadius = 25
        takeOutView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner, .layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        takeOutView.layer.borderWidth = 1.5
        takeOutView.layer.borderColor = UIColor.buttonBorderGray.cgColor
        
        return takeOutView
    }()
    
    private let takeOutImageView: UIImageView = {      // 메뉴 아이콘
        let takeOutImageView = UIImageView(image: UIImage(named: "포장"))
        takeOutImageView.layer.shadowOffset = CGSize(width: 0, height: 1)
        takeOutImageView.layer.shadowOpacity = 0.3
        return takeOutImageView
    }()
    private let takeOutLabel: UILabel = {
        let takeOutLabel = UILabel()
        takeOutLabel.text = "포장"
        takeOutLabel.textAlignment = .center
        takeOutLabel.font = UIFont.systemFont(ofSize: 14)
        return takeOutLabel
    }()
    private let takeOutStackView: UIStackView = {
        let takeOutStackView = UIStackView()
        takeOutStackView.axis = .vertical
        takeOutStackView.alignment = .fill
        takeOutStackView.distribution = .equalSpacing
        takeOutStackView.spacing = 4
        return takeOutStackView
    }()
    // 포장 끝
    
    // 전국별미 시작
    private let jeongukView: UIView = {
        let jeongukView = UIView()
        jeongukView.backgroundColor = .buttonGray
        jeongukView.layer.cornerRadius = 25
        jeongukView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner, .layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        jeongukView.layer.borderWidth = 1.5
        jeongukView.layer.borderColor = UIColor.buttonBorderGray.cgColor
        
        return jeongukView
    }()
    
    private let jeongukImageView: UIImageView = {      // 메뉴 아이콘
        let jeongukImageView = UIImageView(image: UIImage(named: "전국별미"))
        jeongukImageView.layer.shadowOffset = CGSize(width: 0, height: 1)
        jeongukImageView.layer.shadowOpacity = 0.3
        return jeongukImageView
    }()
    private let jeongukLabel: UILabel = {
        let jeongukLabel = UILabel()
        jeongukLabel.text = "전국별미"
        jeongukLabel.textAlignment = .center
        jeongukLabel.font = UIFont.systemFont(ofSize: 14)
        return jeongukLabel
    }()
    private let jeongukStackView: UIStackView = {
        let jeongukStackView = UIStackView()
        jeongukStackView.axis = .vertical
        jeongukStackView.alignment = .fill
        jeongukStackView.distribution = .equalSpacing
        jeongukStackView.spacing = 4
        return jeongukStackView
    }()
    // 포장 끝
    
    // 선물하기 시작
    private let presentView: UIView = {
        let presentView = UIView()
        presentView.backgroundColor = .buttonGray
        presentView.layer.cornerRadius = 25
        presentView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner, .layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        presentView.layer.borderWidth = 1.5
        presentView.layer.borderColor = UIColor.buttonBorderGray.cgColor
        
        return presentView
    }()
    
    private let presentImageView: UIImageView = {      // 메뉴 아이콘
        let presentImageView = UIImageView(image: UIImage(named: "선물하기"))
        presentImageView.layer.shadowOffset = CGSize(width: 0, height: 1)
        presentImageView.layer.shadowOpacity = 0.3
        
        return presentImageView
    }()
    private let presentLabel: UILabel = {
        let presentLabel = UILabel()
        presentLabel.text = "선물하기"
        presentLabel.textAlignment = .center
        presentLabel.font = UIFont.systemFont(ofSize: 14)
        return presentLabel
    }()
    private let presentStackView: UIStackView = {
        let presentStackView = UIStackView()
        presentStackView.axis = .vertical
        presentStackView.alignment = .fill
        presentStackView.distribution = .equalSpacing
        presentStackView.spacing = 6
        return presentStackView
    }()
    // 포장 끝
    
    // 가운데뷰 끝
    
    // 탭바 시작
    // 탭바 뷰
    private let tabBarView: UIView = {
        let tabBarView = UIView()
        tabBarView.backgroundColor = .white
        tabBarView.layer.cornerRadius = 24
        tabBarView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        tabBarView.layer.shadowOffset = CGSize(width: 0, height: -1)
        tabBarView.layer.shadowOpacity = 0.12
        tabBarView.layer.shadowRadius = 10
        tabBarView.layer.masksToBounds = false
        
        return tabBarView
    }()
    
    private let searchButton: UILabel = {      // 검색 아이콘
        let searchButton = UILabel(frame: CGRect(x: 0, y: 0, width: 44, height: 50))
        searchButton.numberOfLines = 0
        
        let attributes: [NSAttributedString.Key : Any] = [
            NSAttributedString.Key.foregroundColor: UIColor.secondaryLabel,
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 11)
        ]
        let attributedString = NSMutableAttributedString(string: "\n  검색", attributes: attributes)

        
        if let searchImage = UIImage(named: "검색") {
            let iconAttachment = NSTextAttachment()
            let imageSize = CGSize(width: 33, height: 33)
            let newSearchImage = searchImage.resized(to: imageSize)
            
            iconAttachment.image = newSearchImage
            let iconString = NSAttributedString(attachment: iconAttachment)
            attributedString.insert(iconString, at: 0)
        }
        searchButton.attributedText = attributedString
        searchButton.sizeToFit()
        
        return searchButton
    }()
    private let heartButton: UILabel = {      // 찜 아이콘
        let heartButton = UILabel(frame: CGRect(x: 0, y: 0, width: 44, height: 50))
        heartButton.numberOfLines = 0
        
        let attributes: [NSAttributedString.Key : Any] = [
            NSAttributedString.Key.foregroundColor: UIColor.secondaryLabel,
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 11)
        ]
        let attributedString = NSMutableAttributedString(string: "\n    찜", attributes: attributes)

        
        if let heartImage = UIImage(named: "찜") {
            let iconAttachment = NSTextAttachment()
            let imageSize = CGSize(width: 33, height: 33)
            let newHeartImage = heartImage.resized(to: imageSize)
            
            iconAttachment.image = newHeartImage
            let iconString = NSAttributedString(attachment: iconAttachment)
            attributedString.insert(iconString, at: 0)
        }
        heartButton.attributedText = attributedString
        heartButton.sizeToFit()
        
        return heartButton
    }()
    private let homeButton: UIButton = {      // 홈 아이콘
        let homeButton = UIButton()
        homeButton.frame = CGRect(x: 0, y: 0, width: 44, height: 44)
        homeButton.tintColor = .white
        homeButton.setImage(UIImage(named: "배민홈"), for: .normal)
        homeButton.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        homeButton.layer.shadowOffset = CGSize(width: 2, height: 3)
        homeButton.layer.shadowOpacity = 0.3
        homeButton.layer.masksToBounds = false
        return homeButton
    }()
    private let orderListButton: UILabel = {      // 주문내역 아이콘
        let orderListButton = UILabel(frame: CGRect(x: 0, y: 0, width: 44, height: 50))
        orderListButton.numberOfLines = 0
        
        let attributes: [NSAttributedString.Key : Any] = [
            NSAttributedString.Key.foregroundColor: UIColor.secondaryLabel,
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 11)
        ]
        let attributedString = NSMutableAttributedString(string: "\n주문내역", attributes: attributes)

        
        if let orderListImage = UIImage(named: "주문내역") {
            let iconAttachment = NSTextAttachment()
            let imageSize = CGSize(width: 33, height: 33)
            let newOrderListImage = orderListImage.resized(to: imageSize)
            
            iconAttachment.image = newOrderListImage
            let iconString = NSAttributedString(attachment: iconAttachment)
            attributedString.insert(iconString, at: 0)
        }
        orderListButton.attributedText = attributedString
        orderListButton.sizeToFit()
        
        return orderListButton
    }()
    private let myBaeminButton: UILabel = {      // my배민 아이콘
        let myBaeminButton = UILabel(frame: CGRect(x: 0, y: 0, width: 44, height: 50))
        myBaeminButton.numberOfLines = 0
        
        let attributes: [NSAttributedString.Key : Any] = [
            NSAttributedString.Key.foregroundColor: UIColor.secondaryLabel,
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 11)
        ]
        let attributedString = NSMutableAttributedString(string: "\nmy배민", attributes: attributes)

        
        if let myBaeminImage = UIImage(named: "my배민") {
            let iconAttachment = NSTextAttachment()
            let imageSize = CGSize(width: 33, height: 33)
            let newMyBaeminImage = myBaeminImage.resized(to: imageSize)
            
            iconAttachment.image = newMyBaeminImage
            let iconString = NSAttributedString(attachment: iconAttachment)
            attributedString.insert(iconString, at: 0)
        }
        myBaeminButton.attributedText = attributedString
        myBaeminButton.sizeToFit()
        
        return myBaeminButton
    }()
    
    // 탭바 끝
    

    override func viewDidLoad() {
        super.viewDidLoad()
        addSubviews()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        setTopFrame()
        setCenterFrame()
        setBottomFrame()
    }
    
    private func addSubviews() {
        view.addSubview(topView)
        view.addSubview(currentAddress)
        view.addSubview(menu)
        view.addSubview(alarm)
        view.addSubview(cart)
        
        view.addSubview(scrollView)
        scrollView.addSubview(searchView)
        searchView.addSubview(searchBox)
        searchBox.addSubview(searchPlaceholder)
        
        deliveryView.addSubview(deliveryLabel)
        deliveryView.addSubview(deliveryDesLabel)
        deliveryView.addSubview(deliveryImageView)
        
        baeminStoreView.addSubview(baeminStoreLabel)
        baeminStoreView.addSubview(baeminStoreDesLabel)
        baeminStoreView.addSubview(baeminStoreImageView)
        
        largeSpecialPriceView.addSubview(largeSpecialPriceLabel)
        largeSpecialPriceView.addSubview(largeSpecialPriceDesLabel)
        largeSpecialPriceView.addSubview(largeSpecialPriceImageView)
        
        scrollView.addSubview(hstackView)
        [deliveryView, baeminStoreView, largeSpecialPriceView].map {
            hstackView.addArrangedSubview($0)
        }
        
        scrollView.addSubview(baemin1View)
        baemin1View.addSubview(vstackView)
        vstackView.addArrangedSubview(rowstackview1)
        vstackView.addArrangedSubview(rowstackview2)
        
        
        frugalDeliveryView.addSubview(frugalImageView)
        [frugalDeliveryView, frugalLabel].map {
            frugalStackView.addArrangedSubview($0)
        }
        bossamView.addSubview(bossamImageView)
        [bossamView, bossamLabel].map {
            bossamStackView.addArrangedSubview($0)
        }
        susiView.addSubview(susiImageView)
        [susiView, susiLabel].map {
            susiStackView.addArrangedSubview($0)
        }
        pizzaView.addSubview(pizzaImageView)
        [pizzaView, pizzaLabel].map {
            pizzaStackView.addArrangedSubview($0)
        }
        joongsickView.addSubview(joongsickImageView)
        [joongsickView, joongsickLabel].map {
            joongsickStackView.addArrangedSubview($0)
        }
        
        [frugalStackView, bossamStackView, susiStackView, pizzaStackView, joongsickStackView].map {
            rowstackview1.addArrangedSubview($0)
        }
        
        
        [chickenStackView, buggerStackView, bunsickStackView, dessertStackView, totalStackView].map {
            rowstackview2.addArrangedSubview($0)
        }
        
        chickenView.addSubview(chickenImageView)
        [chickenView, chickenLabel].map {
            chickenStackView.addArrangedSubview($0)
        }
        buggerView.addSubview(buggerImageView)
        [buggerView, buggerLabel].map {
            buggerStackView.addArrangedSubview($0)
        }
        bunsickView.addSubview(bunsickImageView)
        [bunsickView, bunsickLabel].map {
            bunsickStackView.addArrangedSubview($0)
        }
        dessertView.addSubview(dessertImageView)
        [dessertView, dessertLabel].map {
            dessertStackView.addArrangedSubview($0)
        }
        totalView.addSubview(totalImageView)
        [totalView, totalLabel].map {
            totalStackView.addArrangedSubview($0)
        }
        
        
        [chickenStackView, buggerStackView, bunsickStackView, dessertStackView, totalStackView].map {
            rowstackview2.addArrangedSubview($0)
        }
        
        
        scrollView.addSubview(adBanner)
        scrollView.addSubview(menuView)
        
        menuView.addSubview(rowstackview3)
        
        [takeOutStackView, jeongukStackView, presentStackView].map {
            rowstackview3.addArrangedSubview($0)
        }
        
        takeOutView.addSubview(takeOutImageView)
        [takeOutView, takeOutLabel].map {
            takeOutStackView.addArrangedSubview($0)
        }
        jeongukView.addSubview(jeongukImageView)
        [jeongukView, jeongukLabel].map {
            jeongukStackView.addArrangedSubview($0)
        }
        presentView.addSubview(presentImageView)
        [presentView, presentLabel].map {
            presentStackView.addArrangedSubview($0)
        }
        
        
        menuView.addSubview(oneHomeDeliveryLabel)
        menuView.addSubview(rightArrow)
        
        view.addSubview(tabBarView)
        tabBarView.addSubview(homeButton)
        tabBarView.addSubview(searchButton)
        tabBarView.addSubview(heartButton)
        tabBarView.addSubview(orderListButton)
        tabBarView.addSubview(myBaeminButton)
        
        view.bringSubviewToFront(tabBarView)
    }
    
    private func setTopFrame() {
        // topView 레이아웃 설정
        topView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            topView.widthAnchor.constraint(equalToConstant: self.view.width),
            topView.heightAnchor.constraint(equalToConstant: self.view.height/7.8),
            topView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 0),
            topView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 0),
            topView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: 0)
        ])
        
        // 현재 주소 변경 버튼 설정
        currentAddress.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            currentAddress.bottomAnchor.constraint(equalTo: topView.bottomAnchor, constant: -14),
            currentAddress.leadingAnchor.constraint(equalTo: topView.leadingAnchor, constant: 18)
        ])
        
        // cart 아이콘 레이아웃 설정
        cart.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            cart.widthAnchor.constraint(equalToConstant: 38),
            cart.heightAnchor.constraint(equalToConstant: 38),
            cart.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -14),
            cart.bottomAnchor.constraint(equalTo: topView.bottomAnchor, constant: -8)
        ])
        
        // alarm 아이콘 레이아웃 설정
        alarm.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            alarm.widthAnchor.constraint(equalToConstant: 44),
            alarm.heightAnchor.constraint(equalToConstant: 44),
            alarm.trailingAnchor.constraint(equalTo: cart.leadingAnchor, constant: -8),
            alarm.bottomAnchor.constraint(equalTo: topView.bottomAnchor, constant: -6)
        ])
        
        
        // menu 아이콘 레이아웃 설정
        menu.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            menu.widthAnchor.constraint(equalToConstant: 44),
            menu.heightAnchor.constraint(equalToConstant: 44),
            menu.trailingAnchor.constraint(equalTo: alarm.leadingAnchor, constant: -8),
            menu.bottomAnchor.constraint(equalTo: topView.bottomAnchor, constant: -6)
        ])
        
    }
    
    private func setCenterFrame() {
        // 스크롤뷰 레이아웃 설정
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            scrollView.widthAnchor.constraint(equalToConstant: self.view.width),
            scrollView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 0),
            scrollView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: 0),
            scrollView.topAnchor.constraint(equalTo: topView.bottomAnchor, constant: 0),
            scrollView.bottomAnchor.constraint(equalTo: tabBarView.topAnchor, constant: 20)
        ])
        scrollView.contentSize = CGSize(width: self.view.width, height: self.view.height-topView.height)
        
        
        // 검색 뷰 레이아웃 설정
        searchView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            searchView.widthAnchor.constraint(equalToConstant: self.view.width),
            searchView.heightAnchor.constraint(equalToConstant: 60),
            searchView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 0),
            searchView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: 0),
            searchView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 0)
        ])
        
        
        // 검색 박스 레이아웃 설정
        searchBox.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            searchBox.widthAnchor.constraint(equalToConstant: self.view.width-32),
            searchBox.heightAnchor.constraint(equalToConstant: 44),
            searchBox.centerXAnchor.constraint(equalTo: searchView.centerXAnchor),
            searchBox.topAnchor.constraint(equalTo: searchView.topAnchor, constant: 0)
        ])
        
        
        // 검색 placeholder 레이아웃 설정
        searchPlaceholder.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            searchPlaceholder.centerYAnchor.constraint(equalTo: searchBox.centerYAnchor),
            searchPlaceholder.leadingAnchor.constraint(equalTo: searchBox.leadingAnchor, constant: 8)
        ])
        
        
        
        
        // 배민, 배민스토어, 대용량 특가
        deliveryView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            
        ])
        deliveryView.widthAnchor.constraint(equalToConstant: (hstackView.width - 28) / 3).isActive = true
        deliveryView.heightAnchor.constraint(equalToConstant: (hstackView.width - 28) / 3).isActive = true
        
        deliveryLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            deliveryLabel.leadingAnchor.constraint(equalTo: deliveryView.leadingAnchor, constant: 12),
            deliveryLabel.topAnchor.constraint(equalTo: deliveryView.topAnchor, constant: 12)
        ])
        
        
        deliveryDesLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            deliveryDesLabel.leadingAnchor.constraint(equalTo: deliveryLabel.leadingAnchor, constant: 0),
            deliveryDesLabel.topAnchor.constraint(equalTo: deliveryLabel.bottomAnchor, constant: 6)
        ])
        
        
        deliveryImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            deliveryImageView.widthAnchor.constraint(equalToConstant: 48),
            deliveryImageView.heightAnchor.constraint(equalToConstant: 48),
            deliveryImageView.trailingAnchor.constraint(equalTo: deliveryView.trailingAnchor, constant: 0),
            deliveryImageView.bottomAnchor.constraint(equalTo: deliveryView.bottomAnchor, constant: 0)
        ])
        
        
        baeminStoreView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            baeminStoreView.widthAnchor.constraint(equalToConstant: (hstackView.width - 28) / 3),
            baeminStoreView.heightAnchor.constraint(equalToConstant: (hstackView.width - 28) / 3)
        ])
        
        
        baeminStoreLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            baeminStoreLabel.leadingAnchor.constraint(equalTo: baeminStoreView.leadingAnchor, constant: 12),
            baeminStoreLabel.topAnchor.constraint(equalTo: baeminStoreView.topAnchor, constant: 12)
        ])
        
        
        baeminStoreDesLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            baeminStoreDesLabel.leadingAnchor.constraint(equalTo: baeminStoreLabel.leadingAnchor, constant: 0),
            baeminStoreDesLabel.topAnchor.constraint(equalTo: baeminStoreLabel.bottomAnchor, constant: 6)
        ])
        
        
        baeminStoreImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            baeminStoreImageView.widthAnchor.constraint(equalToConstant: 48),
            baeminStoreImageView.heightAnchor.constraint(equalToConstant: 48),
            baeminStoreImageView.trailingAnchor.constraint(equalTo: baeminStoreView.trailingAnchor, constant: 0),
            baeminStoreImageView.bottomAnchor.constraint(equalTo: baeminStoreView.bottomAnchor, constant: 0)
        ])
        
        
        largeSpecialPriceView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            largeSpecialPriceView.widthAnchor.constraint(equalToConstant: (hstackView.width - 28) / 3),
            largeSpecialPriceView.heightAnchor.constraint(equalToConstant: (hstackView.width - 28) / 3)
        ])
        
        
        largeSpecialPriceLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            largeSpecialPriceLabel.leadingAnchor.constraint(equalTo: largeSpecialPriceView.leadingAnchor, constant: 12),
            largeSpecialPriceLabel.topAnchor.constraint(equalTo: largeSpecialPriceView.topAnchor, constant: 12)
        ])
        
        
        largeSpecialPriceDesLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            largeSpecialPriceDesLabel.leadingAnchor.constraint(equalTo: largeSpecialPriceLabel.leadingAnchor, constant: 0),
            largeSpecialPriceDesLabel.topAnchor.constraint(equalTo: largeSpecialPriceLabel.bottomAnchor, constant: 6)
        ])
        
        
        largeSpecialPriceImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            largeSpecialPriceImageView.widthAnchor.constraint(equalToConstant: 60),
            largeSpecialPriceImageView.heightAnchor.constraint(equalToConstant: 48),
            largeSpecialPriceImageView.trailingAnchor.constraint(equalTo: largeSpecialPriceView.trailingAnchor, constant: 0),
            largeSpecialPriceImageView.bottomAnchor.constraint(equalTo: largeSpecialPriceView.bottomAnchor, constant: 0)
        ])
        
       
        
        hstackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            hstackView.widthAnchor.constraint(equalToConstant: self.view.width - 32),
            hstackView.topAnchor.constraint(equalTo: searchView.bottomAnchor, constant: 10),
            hstackView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: 0)
        ])
        
        // 배달, 배민스토어, 대용량특가 끝
        
        
        // 알뜰, 한집배달 시작
        baemin1View.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            baemin1View.widthAnchor.constraint(equalToConstant: self.view.width - 28),
            baemin1View.heightAnchor.constraint(equalTo: hstackView.heightAnchor, multiplier: 2),
            baemin1View.topAnchor.constraint(equalTo: hstackView.bottomAnchor, constant: 18),
            baemin1View.centerXAnchor.constraint(equalTo: self.scrollView.centerXAnchor, constant: 0)
        ])
        oneHomeDeliveryLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            oneHomeDeliveryLabel.topAnchor.constraint(equalTo: baemin1View.topAnchor, constant: 12),
            oneHomeDeliveryLabel.leadingAnchor.constraint(equalTo: baemin1View.leadingAnchor, constant: 12)
        ])
        
        rightArrow.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            rightArrow.widthAnchor.constraint(equalToConstant: 18),
            rightArrow.heightAnchor.constraint(equalToConstant: 18),
            rightArrow.topAnchor.constraint(equalTo: baemin1View.topAnchor, constant: 14),
            rightArrow.trailingAnchor.constraint(equalTo: baemin1View.trailingAnchor, constant: -12)
        ])

        
        vstackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            vstackView.widthAnchor.constraint(equalToConstant: baemin1View.width - 32),
            vstackView.centerXAnchor.constraint(equalTo: self.baemin1View.centerXAnchor)
        ])
        
        rowstackview1.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            rowstackview1.widthAnchor.constraint(equalToConstant: baemin1View.width - 32),
            rowstackview1.topAnchor.constraint(equalTo: oneHomeDeliveryLabel.bottomAnchor, constant: 20),
            rowstackview1.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: 0)
        ])
        
        // 알뜰배달 시작
        frugalDeliveryView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            frugalDeliveryView.widthAnchor.constraint(equalToConstant: (hstackView.width - 124) / 5),
            frugalDeliveryView.heightAnchor.constraint(equalToConstant: (hstackView.width - 124) / 5)
            
        ])
        
        frugalImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            frugalImageView.widthAnchor.constraint(equalToConstant: 36),
            frugalImageView.heightAnchor.constraint(equalToConstant: 36),
            frugalImageView.centerYAnchor.constraint(equalTo: frugalDeliveryView.centerYAnchor),
            frugalImageView.centerXAnchor.constraint(equalTo: frugalDeliveryView.centerXAnchor)
        ])
        frugalLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            frugalLabel.centerXAnchor.constraint(equalTo: frugalStackView.centerXAnchor)
        ])
        
        // 알뜰배달 끝
        
        // 족발,보쌈 시작
        bossamView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            bossamView.widthAnchor.constraint(equalToConstant: (hstackView.width - 124) / 5),
            bossamView.heightAnchor.constraint(equalToConstant: (hstackView.width - 124) / 5)
            
        ])
        
        bossamImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            bossamImageView.widthAnchor.constraint(equalToConstant: 36),
            bossamImageView.heightAnchor.constraint(equalToConstant: 36),
            bossamImageView.centerYAnchor.constraint(equalTo: bossamView.centerYAnchor),
            bossamImageView.centerXAnchor.constraint(equalTo: bossamView.centerXAnchor)
        ])
        
        // 족발,보쌈 끝
        
        // 돈까스,회 시작
        susiView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            susiView.widthAnchor.constraint(equalToConstant: (hstackView.width - 124) / 5),
            susiView.heightAnchor.constraint(equalToConstant: (hstackView.width - 124) / 5)
            
        ])
        
        susiImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            susiImageView.widthAnchor.constraint(equalToConstant: 36),
            susiImageView.heightAnchor.constraint(equalToConstant: 36),
            susiImageView.centerYAnchor.constraint(equalTo: susiView.centerYAnchor),
            susiImageView.centerXAnchor.constraint(equalTo: susiView.centerXAnchor)
        ])
        
//
        pizzaView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            pizzaView.widthAnchor.constraint(equalToConstant: (hstackView.width - 124) / 5),
            pizzaView.heightAnchor.constraint(equalToConstant: (hstackView.width - 124) / 5)

        ])

        pizzaImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            pizzaImageView.widthAnchor.constraint(equalToConstant: 36),
            pizzaImageView.heightAnchor.constraint(equalToConstant: 36),
            pizzaImageView.centerYAnchor.constraint(equalTo: pizzaView.centerYAnchor),
            pizzaImageView.centerXAnchor.constraint(equalTo: pizzaView.centerXAnchor)
        ])

        joongsickView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            joongsickView.widthAnchor.constraint(equalToConstant:(hstackView.width - 124) / 5),
            joongsickView.heightAnchor.constraint(equalToConstant: (hstackView.width - 124) / 5)

        ])

        joongsickImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            joongsickImageView.widthAnchor.constraint(equalToConstant: 36),
            joongsickImageView.heightAnchor.constraint(equalToConstant: 36),
            joongsickImageView.centerYAnchor.constraint(equalTo: joongsickView.centerYAnchor),
            joongsickImageView.centerXAnchor.constraint(equalTo: joongsickView.centerXAnchor)
        ])
        
        
        // 알뜰, 한집배달 끝
        
        
        rowstackview2.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            rowstackview2.widthAnchor.constraint(equalToConstant: baemin1View.width - 32),
//            rowstackview1.topAnchor.constraint(equalTo: oneHomeDeliveryLabel.bottomAnchor, constant: 20),
            rowstackview2.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: 0)
        ])
        
        // 치킨 시작
        chickenView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            chickenView.widthAnchor.constraint(equalToConstant: (hstackView.width - 124) / 5),
            chickenView.heightAnchor.constraint(equalToConstant: (hstackView.width - 124) / 5)
            
        ])
        
        chickenImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            chickenImageView.widthAnchor.constraint(equalToConstant: 36),
            chickenImageView.heightAnchor.constraint(equalToConstant: 36),
            chickenImageView.centerYAnchor.constraint(equalTo: chickenView.centerYAnchor),
            chickenImageView.centerXAnchor.constraint(equalTo: chickenView.centerXAnchor)
        ])
        chickenLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            chickenLabel.centerXAnchor.constraint(equalTo: chickenStackView.centerXAnchor)
        ])
        
        // 치킨 끝
        
        // 버거 시작
        buggerView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            buggerView.widthAnchor.constraint(equalToConstant: (hstackView.width - 124) / 5),
            buggerView.heightAnchor.constraint(equalToConstant: (hstackView.width - 124) / 5)
            
        ])
        
        buggerImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            buggerImageView.widthAnchor.constraint(equalToConstant: 36),
            buggerImageView.heightAnchor.constraint(equalToConstant: 36),
            buggerImageView.centerYAnchor.constraint(equalTo: buggerView.centerYAnchor),
            buggerImageView.centerXAnchor.constraint(equalTo: buggerView.centerXAnchor)
        ])
        
        // 버거 끝
        
        // 분식 시작
        bunsickView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            bunsickView.widthAnchor.constraint(equalToConstant: (hstackView.width - 124) / 5),
            bunsickView.heightAnchor.constraint(equalToConstant: (hstackView.width - 124) / 5)
            
        ])
        
        bunsickImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            bunsickImageView.widthAnchor.constraint(equalToConstant: 36),
            bunsickImageView.heightAnchor.constraint(equalToConstant: 36),
            bunsickImageView.centerYAnchor.constraint(equalTo: bunsickView.centerYAnchor),
            bunsickImageView.centerXAnchor.constraint(equalTo: bunsickView.centerXAnchor)
        ])
        // 분식 끝

        // 디저트 시작
        dessertView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            dessertView.widthAnchor.constraint(equalToConstant: (hstackView.width - 124) / 5),
            dessertView.heightAnchor.constraint(equalToConstant: (hstackView.width - 124) / 5)

        ])

        dessertImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            dessertImageView.widthAnchor.constraint(equalToConstant: 36),
            dessertImageView.heightAnchor.constraint(equalToConstant: 36),
            dessertImageView.centerYAnchor.constraint(equalTo: dessertView.centerYAnchor),
            dessertImageView.centerXAnchor.constraint(equalTo: dessertView.centerXAnchor)
        ])
        
        // 디저트 끝

        // 전체보기 시작
        totalView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            totalView.widthAnchor.constraint(equalToConstant:(hstackView.width - 124) / 5),
            totalView.heightAnchor.constraint(equalToConstant: (hstackView.width - 124) / 5)

        ])

        totalImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            totalImageView.widthAnchor.constraint(equalToConstant: 36),
            totalImageView.heightAnchor.constraint(equalToConstant: 36),
            totalImageView.centerYAnchor.constraint(equalTo: totalView.centerYAnchor),
            totalImageView.centerXAnchor.constraint(equalTo: totalView.centerXAnchor)
        ])
        
        
        // 전체보기 끝
        
        
        adBanner.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            adBanner.widthAnchor.constraint(equalToConstant: self.view.width - 12),
            adBanner.heightAnchor.constraint(equalToConstant: (adBanner.width - 28) / 3),
            adBanner.centerXAnchor.constraint(equalTo: self.scrollView.centerXAnchor, constant: 0),
            adBanner.topAnchor.constraint(equalTo: baemin1View.bottomAnchor, constant: 14)
        ])
        
        menuView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            menuView.widthAnchor.constraint(equalToConstant: self.view.width),
            menuView.heightAnchor.constraint(equalToConstant: (adBanner.width - 28) / 2.6),
            menuView.centerXAnchor.constraint(equalTo: self.scrollView.centerXAnchor, constant: 0),
            menuView.topAnchor.constraint(equalTo: adBanner.bottomAnchor, constant: 14)
        ])
        
        rowstackview3.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            rowstackview3.leadingAnchor.constraint(equalTo: menuView.leadingAnchor, constant: 12),
            rowstackview3.centerYAnchor.constraint(equalTo: menuView.centerYAnchor)
        ])
        
        // 포장 시작
        takeOutView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            takeOutView.widthAnchor.constraint(equalToConstant: 76),
            takeOutView.heightAnchor.constraint(equalToConstant: 76)
        ])
        
        takeOutImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            takeOutImageView.widthAnchor.constraint(equalToConstant: 52),
            takeOutImageView.heightAnchor.constraint(equalToConstant: 52),
            takeOutImageView.centerYAnchor.constraint(equalTo: takeOutView.centerYAnchor),
            takeOutImageView.centerXAnchor.constraint(equalTo: takeOutView.centerXAnchor)
        ])
        // 포장 끝
        
        // 전국별미 시작
        jeongukView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            jeongukView.widthAnchor.constraint(equalToConstant: 76),
            jeongukView.heightAnchor.constraint(equalToConstant: 76)
        ])
        
        jeongukImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            jeongukImageView.widthAnchor.constraint(equalToConstant: 52),
            jeongukImageView.heightAnchor.constraint(equalToConstant: 52),
            jeongukImageView.centerYAnchor.constraint(equalTo: jeongukView.centerYAnchor),
            jeongukImageView.centerXAnchor.constraint(equalTo: jeongukView.centerXAnchor)
        ])
        // 전국별미 시작
        
        // 선물하기 시작
        presentView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            presentView.widthAnchor.constraint(equalToConstant: 76),
            presentView.heightAnchor.constraint(equalToConstant: 76)
        ])
        
        presentImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            presentImageView.widthAnchor.constraint(equalToConstant: 52),
            presentImageView.heightAnchor.constraint(equalToConstant: 52),
            presentImageView.centerYAnchor.constraint(equalTo: presentView.centerYAnchor),
            presentImageView.centerXAnchor.constraint(equalTo: presentView.centerXAnchor)
        ])
        // 전국별미 시작
        
    }
    
    private func setBottomFrame() {
        // 탭바 뷰 레이아웃 설정
        tabBarView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tabBarView.widthAnchor.constraint(equalToConstant: self.view.width),
            tabBarView.heightAnchor.constraint(equalToConstant: self.view.height/9),
            tabBarView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 0),
            tabBarView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: 0),
            tabBarView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: 0)
        ])
       
        
        // 홈 아이콘 레이아웃 설정
        homeButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            homeButton.widthAnchor.constraint(equalToConstant: 76),
            homeButton.heightAnchor.constraint(equalToConstant: 76),
            homeButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            homeButton.topAnchor.constraint(equalTo: tabBarView.topAnchor, constant: -10)
        ])
        
        searchButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            searchButton.centerYAnchor.constraint(equalTo: tabBarView.safeAreaLayoutGuide.centerYAnchor, constant: 0),
            searchButton.centerXAnchor.constraint(equalTo: tabBarView.leadingAnchor, constant: 50)
        ])
        heartButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            heartButton.centerYAnchor.constraint(equalTo: tabBarView.safeAreaLayoutGuide.centerYAnchor, constant: 0),
            heartButton.leadingAnchor.constraint(equalTo: searchButton.trailingAnchor, constant: 40)
        ])
        orderListButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            orderListButton.centerYAnchor.constraint(equalTo: tabBarView.safeAreaLayoutGuide.centerYAnchor, constant: 0),
            orderListButton.trailingAnchor.constraint(equalTo: myBaeminButton.leadingAnchor, constant: -35)
        ])
        myBaeminButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            myBaeminButton.centerYAnchor.constraint(equalTo: tabBarView.safeAreaLayoutGuide.centerYAnchor, constant: 0),
            myBaeminButton.trailingAnchor.constraint(equalTo: tabBarView.trailingAnchor, constant: -30)
        ])
        
        
    }
    
    


}

