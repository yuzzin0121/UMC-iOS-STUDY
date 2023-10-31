//
//  RockSissorsPaperGameViewController.swift
//  PracticeUIKit04
//
//  Created by 조유진 on 2023/10/17.
//

import UIKit

enum InputState: String {
    case scissors
    case rock
    case paper
}

enum GameResult: String {
    case win = "이겼다"
    case draw = "비겼다"
    case lose = "졌다"
}

class RockScissorsPaperGameViewController: UIViewController {
    lazy var gameImageNameData: [InputState] = [.scissors, .rock, .paper]
    
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
    
    lazy var scissorsButton: GameButton = {
        let button = GameButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("가위", for: .normal)
        button.backgroundColor = .gray
        button.layer.cornerRadius = 20
        return button
    }()
    
    lazy var rockButton: GameButton = {
        let button = GameButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("바위", for: .normal)
        button.backgroundColor = .gray
        button.layer.cornerRadius = 20
        return button
    }()
    
    lazy var paperButton: GameButton = {
        let button = GameButton()
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
        
        scissorsButton.gameTag = .scissors
        rockButton.gameTag = .rock
        paperButton.gameTag = .paper
        
        scissorsButton.addTarget(self, action: #selector(didTapChangeGameImageButton), for: .touchUpInside)
        rockButton.addTarget(self, action: #selector(didTapChangeGameImageButton), for: .touchUpInside)
        paperButton.addTarget(self, action: #selector(didTapChangeGameImageButton), for: .touchUpInside)
    }
    
    @objc func didTapChangeGameImageButton(_ sender: UIButton) {
        guard let sender = sender as? GameButton else { return }
        
        switch sender.gameTag {
        case .scissors:
            myGameImageView.image = UIImage(named: "scissors")
        case .rock:
            myGameImageView.image = UIImage(named: "rock")
        case .paper:
            myGameImageView.image = UIImage(named: "paper")
        }
        
        let randomInput = gameImageNameData.randomElement()!
        computerGameImageView.image = UIImage(named: randomInput.rawValue)
        gameResultLabel.text = fetchGameResult(myInput: sender.gameTag, computerInput: randomInput).rawValue
    }
    
    private func fetchGameResult(myInput: InputState, computerInput: InputState) -> GameResult {
        // 입력 받은 값, 컴퓨터의 값
        switch (myInput, computerInput) {
        case (.scissors, .scissors): return .draw
        case (.scissors, .rock): return .lose
        case (.scissors, .paper): return .win
            
        case (.rock, .scissors): return .win
        case (.rock, .rock): return .draw
        case (.rock, .paper): return .lose
            
        case (.paper, .scissors): return .lose
        case (.paper, .rock): return .win
        case (.paper, .paper): return .draw
        }
    }
}


class GameButton: UIButton {
    var gameTag: InputState = .rock
}
