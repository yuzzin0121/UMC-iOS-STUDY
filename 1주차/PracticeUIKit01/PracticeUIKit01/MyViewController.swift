//
//  ViewController.swift
//  PracticeUIKit01
//
//  Created by 조유진 on 2023/09/20.
//

import UIKit

class MyViewController: UIViewController {
    lazy var diceImageNameData = ["dice1", "dice2", "dice3", "dice4", "dice5", "dice6"]
    
    lazy var diceImageView = {
        let imageView = UIImageView(image: UIImage(named: "dice1"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    lazy var changeButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("변경해주세요", for: .normal)
        button.backgroundColor = .gray
        return button
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(diceImageView)
        
        NSLayoutConstraint.activate([
            diceImageView.widthAnchor.constraint(equalToConstant: 300),
            diceImageView.heightAnchor.constraint(equalToConstant: 300),
            diceImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            diceImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        changeButton.addTarget(self, action: #selector(didTapChangeDiceImageButton), for: .touchUpInside)
        
        view.addSubview(changeButton)
        NSLayoutConstraint.activate([
            changeButton.widthAnchor.constraint(equalToConstant: 200),
            changeButton.heightAnchor.constraint(equalToConstant: 50),
            changeButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            changeButton.topAnchor.constraint(equalTo: diceImageView.bottomAnchor, constant: 100)
        ])
        
    }

    @objc func didTapChangeDiceImageButton() {
        diceImageView.image = UIImage(named: diceImageNameData.randomElement() ?? "dice1")
    }
    

}

