//
//  RockSissorsPaperGameViewController.swift
//  PracticeUIKit04
//
//  Created by 조유진 on 2023/10/17.
//

import UIKit

class RockScissorsPaperGameViewController: UIViewController {
    lazy var gameImageNameData: [InputState] = [.scissors, .rock, .paper]
    
    enum InputState: String {
        case scissors
        case rock
        case paper
    }
    
    lazy var playStackView: UIStackView = {
        let stackView = UIStackView()
        //stackView.backgroundColor = .yellow
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.spacing = 20
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    lazy var computerGameImageView = {
        let imageView = UIImageView(image: UIImage(named: "바위"))
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    lazy var myGameImageView = {
        let imageView = UIImageView(image: UIImage(named: "바위"))
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    lazy var gameResultLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "결과는?"
        return label
    }()
    
    lazy var playerLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Player"
        return label
    }()
    lazy var computerLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Com"
        return label
    }()
    
    lazy var inputStackView: UIStackView = {
        let stackView = UIStackView()
        //stackView.backgroundColor = .yellow
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.spacing = 20
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    lazy var scissorsButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("가위", for: .normal)
        button.backgroundColor = .gray
        button.layer.cornerRadius = 20
        return button
    }()
    
    lazy var rockButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("바위", for: .normal)
        button.backgroundColor = .gray
        button.layer.cornerRadius = 20
        return button
    }()
    
    lazy var paperButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("보", for: .normal)
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
        playStackView.addArrangedSubview(computerGameImageView)
        playStackView.addArrangedSubview(myGameImageView)
        
        view.addSubview(gameResultLabel)
        NSLayoutConstraint.activate([
            gameResultLabel.topAnchor.constraint(equalTo: playStackView.bottomAnchor, constant: 20),
            gameResultLabel.centerXAnchor.constraint(equalTo: playStackView.centerXAnchor)
        ])
        
        view.addSubview(computerLabel)
        NSLayoutConstraint.activate([
            computerLabel.bottomAnchor.constraint(equalTo: playStackView.topAnchor, constant: 15),
            computerLabel.leadingAnchor.constraint(equalTo: playStackView.leadingAnchor, constant: 30)
        ])
        
        view.addSubview(playerLabel)
        NSLayoutConstraint.activate([
            playerLabel.bottomAnchor.constraint(equalTo: playStackView.topAnchor, constant: 15),
            playerLabel.trailingAnchor.constraint(equalTo: playStackView.trailingAnchor, constant: -40)
        ])
    
        
        view.addSubview(inputStackView)
        NSLayoutConstraint.activate([
            inputStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            inputStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            inputStackView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -200),
            inputStackView.heightAnchor.constraint(equalToConstant: 100)
        ])
        
        [scissorsButton, rockButton, paperButton].map {
            inputStackView.addArrangedSubview($0)
        }
        
        scissorsButton.addTarget(self, action: #selector(didTapChangeGameImageButton), for: .touchUpInside)
        rockButton.addTarget(self, action: #selector(didTapChangeGameImageButton2), for: .touchUpInside)
        paperButton.addTarget(self, action: #selector(didTapChangeGameImageButton3), for: .touchUpInside)
    }
    
    @objc func didTapChangeGameImageButton() {
        myGameImageView.image = UIImage(named: "scissors")
        let randomInput = gameImageNameData.randomElement()!
        computerGameImageView.image = UIImage(named: randomInput.rawValue)
        gameResultLabel.text = fetchGameResult(myInput: .scissors, computerInput: randomInput)
    }
    @objc func didTapChangeGameImageButton2() {
        myGameImageView.image = UIImage(named: "rock")
        let randomInput = gameImageNameData.randomElement()!
        computerGameImageView.image = UIImage(named: randomInput.rawValue)
        gameResultLabel.text = fetchGameResult(myInput: .rock, computerInput: randomInput)
    }
    @objc func didTapChangeGameImageButton3() {
        myGameImageView.image = UIImage(named: "paper")
        let randomInput = gameImageNameData.randomElement()!
        computerGameImageView.image = UIImage(named: randomInput.rawValue)
        gameResultLabel.text = fetchGameResult(myInput: .paper, computerInput: randomInput)
    }
    
    private func fetchGameResult(myInput: InputState, computerInput: InputState) -> String {
        // 입력 받은 값, 컴퓨터의 값
        switch myInput {
        case .scissors:
            switch computerInput {
            case .scissors:
                return "비김"
            case .rock:
                return "짐"
            case .paper:
                return "이김"
            }
            
        case .rock:
            switch computerInput {
            case .scissors:
                return "이김"
            case .rock:
                return "비김"
            case .paper:
                return "짐"
            }
            
        case .paper:
            switch computerInput {
            case .scissors:
                return "짐"
            case .rock:
                return "이김"
            case .paper:
                return "비김"
            }
        }
    }
}
