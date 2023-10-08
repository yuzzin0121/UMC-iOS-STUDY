//
//  SelectMenuViewController.swift
//  AddToCart
//
//  Created by 조유진 on 2023/10/03.
//

import UIKit

class SelectMenuViewController: UIViewController {


    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        configNavigationBar()
        setRightBarButtons()
    }
  
    func configNavigationBar() {
        self.navigationController?.navigationBar.barTintColor = UIColor.white
//        self.navigationController?.navigationBar.isTranslucent = false
    }
    
    private func setRightBarButtons() {
            
        let homeButton = self.navigationItem.makeSFSymbolButton(self,
                                                                 action: Selector("pushToHome"),
                                                                 iconName: "홈")
        let shareButton = self.navigationItem.makeSFSymbolButton(self,
                                                                  action: Selector("pushToShare"),
                                                                  iconName: "공유")
        let cartButton = self.navigationItem.makeSFSymbolButton(self,
                                                                    action: Selector("pushToCart"),
                                                                    iconName: "장바구니")
                    
        self.navigationItem.rightBarButtonItems = [homeButton, shareButton, cartButton]
    }
    
    @objc func pushToCart() {
        let cartVC = CartViewController()
        self.navigationController?.pushViewController(cartVC, animated: true)
    }
}
