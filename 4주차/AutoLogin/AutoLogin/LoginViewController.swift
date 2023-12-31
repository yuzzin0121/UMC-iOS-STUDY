//
//  ViewController.swift
//  AutoLogin
//
//  Created by 조유진 on 2023/10/17.
//

import UIKit

class LoginViewController: UIViewController {
    private let headerLabel: UILabel = {
        let label = UILabel()
        label.text = "Welcome!"
        label.font = UIFont.boldSystemFont(ofSize: 42)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let messageLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = .red
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let idField: UITextField = {
        let field = UITextField()
        field.placeholder = "ID..."
        field.returnKeyType = .next
        field.leftViewMode = .always
        field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        field.autocapitalizationType = .none
        field.autocorrectionType = .no
        field.layer.masksToBounds = true
        field.layer.cornerRadius = 8
        field.backgroundColor = .secondarySystemBackground
        field.layer.borderWidth = 1.0
        field.layer.borderColor = UIColor.secondaryLabel.cgColor
        field.translatesAutoresizingMaskIntoConstraints = false
        return field
    }()
    
    private let passwordField: UITextField = {
        let field =  UITextField()
//        field.isSecureTextEntry = true
        field.placeholder = "Password..."
        field.returnKeyType = .continue
        field.leftViewMode = .always
        field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        field.autocapitalizationType = .none
        field.autocorrectionType = .no
        field.layer.masksToBounds = true
        field.layer.cornerRadius = 8
        field.backgroundColor = .secondarySystemBackground
        field.layer.borderWidth = 1.0
        field.layer.borderColor = UIColor.secondaryLabel.cgColor
        field.translatesAutoresizingMaskIntoConstraints = false
        return field
    }()
    
    private let loginButton: UIButton = {
        let button = UIButton()
        button.setTitle("로그인", for: .normal)
        button.layer.masksToBounds = true
        button.layer.cornerRadius = 8
        button.backgroundColor = .black
        button.setTitleColor(.white, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let registerButton: UIButton = {
        let button = UIButton()
        button.setTitle("회원가입", for: .normal)
        button.layer.masksToBounds = true
        button.layer.cornerRadius = 8
        button.backgroundColor = .black
        button.setTitleColor(.white, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let UD = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        addSubviews()
        setLayout()
        loginButton.addTarget(self, action: #selector(didTapLoginButton), for: .touchUpInside)
        registerButton.addTarget(self, action: #selector(didTapRegisterButton), for: .touchUpInside)
        idField.delegate = self
        passwordField.delegate = self
    }
    
    func addSubviews() {
        view.addSubview(headerLabel)
        view.addSubview(messageLabel)
        view.addSubview(idField)
        view.addSubview(passwordField)
        view.addSubview(loginButton)
        view.addSubview(registerButton)
    }
    
    func setLayout() {
        NSLayoutConstraint.activate([
            headerLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            headerLabel.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 200)
        ])
        
        NSLayoutConstraint.activate([
            messageLabel.bottomAnchor.constraint(equalTo: idField.topAnchor, constant: -10),
            messageLabel.leadingAnchor.constraint(equalTo: idField.leadingAnchor, constant: 2)
        ])
        
        NSLayoutConstraint.activate([
            idField.topAnchor.constraint(equalTo: headerLabel.bottomAnchor, constant: 60),
            idField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            idField.widthAnchor.constraint(equalToConstant: 250),
            idField.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        NSLayoutConstraint.activate([
            passwordField.topAnchor.constraint(equalTo: idField.bottomAnchor, constant: 12),
            passwordField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            passwordField.widthAnchor.constraint(equalToConstant: 250),
            passwordField.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        NSLayoutConstraint.activate([
            loginButton.topAnchor.constraint(equalTo: passwordField.bottomAnchor, constant: 20),
            loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loginButton.widthAnchor.constraint(equalToConstant: 250),
            loginButton.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        NSLayoutConstraint.activate([
            registerButton.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 20),
            registerButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            registerButton.widthAnchor.constraint(equalToConstant: 250),
            registerButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    @objc private func didTapLoginButton() {
        print(#function)
        idField.resignFirstResponder()
        passwordField.resignFirstResponder()
        
        guard let id = idField.text, !id.isEmpty,
              let password = passwordField.text, !password.isEmpty, password.count >= 3 else {
            return
        }
        
        guard let udId = UD.object(forKey: "id") as? String else {
            print("아이디 존재X")
            messageLabel.text = "존재하지 않는 ID입니다."
            return
        }
                
        guard let udPasswd = UD.object(forKey: "password") as? String else {
            print("비밀번호 존재X")
            return
        }
        print(udId)
        print(udPasswd)
        
        // UD에 아무것도 없는데 로그인 -> 존재하지 않는 ID입니다.
        if(id != udId) {
            messageLabel.text = "존재하지 않는 ID입니다."
        }
        else {
            if(password != udPasswd) {
                messageLabel.text = "비밀번호가 일치하지 않습니다."
            }
            else {
                messageLabel.text = "로그인 성공!"
            }
        }
  
    }
    
    @objc private func didTapRegisterButton() {
        print("click")
        idField.text = ""
        passwordField.text = ""
        messageLabel.text = ""
        let RegisterVC = RegisterViewController()
        self.navigationController?.pushViewController(RegisterVC, animated: true)
    }
    
}

extension LoginViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == idField {
            passwordField.becomeFirstResponder()
        }
        else if textField == passwordField {
            didTapLoginButton()
        }
        return true
    }
    
}
