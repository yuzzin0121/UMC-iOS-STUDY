//
//  RegisterViewController.swift
//  AutoLogin
//
//  Created by 조유진 on 2023/10/17.
//

import UIKit

class RegisterViewController: UIViewController {
    
//    private let headerLabel: UILabel = {
//        let label = UILabel()
//        label.text = "회원가입"
//        label.font = UIFont.boldSystemFont(ofSize: 16)
//        label.translatesAutoresizingMaskIntoConstraints = false
//        return label
//    }()
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
        setNavigationUI()
        addSubviews()
        setLayout()
        registerButton.addTarget(self, action: #selector(didTapRegisterButton), for: .touchUpInside)
        idField.delegate = self
        passwordField.delegate = self
    }

    func addSubviews() {
//        view.addSubview(headerLabel)
        view.addSubview(messageLabel)
        view.addSubview(idField)
        view.addSubview(passwordField)
        view.addSubview(registerButton)
    }
    
    func setLayout() {
//        NSLayoutConstraint.activate([
//            headerLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
//            headerLabel.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 200)
//        ])
        
        NSLayoutConstraint.activate([
            messageLabel.bottomAnchor.constraint(equalTo: idField.topAnchor, constant: -10),
            messageLabel.leadingAnchor.constraint(equalTo: idField.leadingAnchor, constant: 2)
        ])
        
        NSLayoutConstraint.activate([
            idField.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -60),
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
            registerButton.topAnchor.constraint(equalTo: passwordField.bottomAnchor, constant: 20),
            registerButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            registerButton.widthAnchor.constraint(equalToConstant: 250),
            registerButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    @objc private func didTapRegisterButton() {
        idField.resignFirstResponder()
        passwordField.resignFirstResponder()
        
        guard let id = idField.text, !id.isEmpty,
              let password = passwordField.text, !password.isEmpty, password.count >= 3 else {
            return
        }
        
        let udId = UD.object(forKey: "id") as? String
//            print("아이디 존재X")
//            return
//        }
                
        let udPasswd = UD.object(forKey: "password") as? String
//            print("비밀번호 존재X")
//            return
//        }
        
        // UD에 있는 아이디로 회원가입 하려는 경우 -> 이미 존재하는 ID
        if(id == udId ) {    // 같은 경우
            messageLabel.text = "이미 존재하는 ID입니다."
            return
        }
        
        UD.set(id, forKey: "id")
        UD.set(password, forKey: "password")
        UD.synchronize()
        print("저장 완료: \(id), \(password)")
        self.navigationController?.popViewController(animated: true)
    }
    
    func setNavigationUI() {
        navigationItem.setHidesBackButton(true, animated: true)
        navigationItem.title = "회원가입"
        let leftButton = UIBarButtonItem(image:UIImage(systemName: "arrow.backward"), style: .plain, target: self, action: #selector(back(_:)))
        leftButton.tintColor = .black
        navigationItem.leftBarButtonItem = leftButton
        self.navigationController?.navigationBar.tintColor = .black
    }
    
    @objc func back(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    

}

extension RegisterViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == idField {
            passwordField.becomeFirstResponder()
        }
        else if textField == passwordField {
            didTapRegisterButton()
        }
        return true
    }
    
}
