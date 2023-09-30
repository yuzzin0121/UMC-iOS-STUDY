//
//  SecondAppMainViewController.swift
//  PracticeUIKit01
//
//  Created by 조유진 on 2023/09/23.
//

import UIKit

class SecondAppMainViewController: UIViewController {
    lazy var diceImageNameData = ["dice1", "dice2", "dice3", "dice4", "dice5", "dice6"]
    
    lazy var doubleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "주사위를 굴려주세요"
        return label
    }()
    
    lazy var playStackView: UIStackView = {
        let stackView = UIStackView()
        //stackView.backgroundColor = .yellow
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.spacing = 20
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    lazy var diceImageView = {
        let imageView = UIImageView(image: UIImage(named: "dice1"))
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    lazy var secondDiceImageView = {
        let imageView = UIImageView(image: UIImage(named: "dice1"))
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    lazy var changeButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("변경해주세요", for: .normal)
        button.backgroundColor = .gray
        button.layer.cornerRadius = 20
        return button
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        
        view.addSubview(playStackView)
        NSLayoutConstraint.activate([
            playStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            playStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            playStackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            playStackView.heightAnchor.constraint(equalToConstant: 300),
        ])
        playStackView.addArrangedSubview(diceImageView)
        playStackView.addArrangedSubview(secondDiceImageView)
        
        view.addSubview(doubleLabel)
        doubleLabel.topAnchor.constraint(equalTo: playStackView.bottomAnchor, constant: 30).isActive = true
        doubleLabel.centerXAnchor.constraint(equalTo: playStackView.centerXAnchor).isActive = true
        
        changeButton.addTarget(self, action: #selector(didTapChangeDiceImageButton), for: .touchUpInside)
        
        view.addSubview(changeButton)
        NSLayoutConstraint.activate([
            changeButton.widthAnchor.constraint(equalToConstant: 200),
            changeButton.heightAnchor.constraint(equalToConstant: 50),
            changeButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            changeButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100)
        ])
        
    }

    @objc func didTapChangeDiceImageButton() {
        let firstDice = diceImageNameData.randomElement() ?? "one"
        let secondDice = diceImageNameData.randomElement()
        ?? "one"
        diceImageView.image = UIImage(named: firstDice)
        secondDiceImageView.image = UIImage(named: secondDice)
        
        if firstDice == secondDice {
            doubleLabel.text = "더블!"
        }
        else {
            doubleLabel.text = "다시 굴려주세요!"
        }
    }
    
}
