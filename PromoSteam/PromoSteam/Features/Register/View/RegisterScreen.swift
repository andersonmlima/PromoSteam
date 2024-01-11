//
//  RegisterScreen.swift
//  PromoSteam
//
//  Created by Anderson Moura on 11/01/24.
//

import UIKit

protocol RegisterViewControllerProtocol: AnyObject {
    func registerTapped()
    func afterTapped()
}

class RegisterScreen: UIView {
    
    weak var delegate: RegisterViewControllerProtocol?
    
    let profileImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "adicionar-usuario.png"))
        imageView.contentMode = .scaleAspectFit
        imageView.isUserInteractionEnabled = true
        return imageView
    }()
    
    let usernameTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Username"
        textField.borderStyle = .roundedRect
        textField.layer.cornerRadius = 10
        textField.clipsToBounds = true
        return textField
    }()
    
    let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Senha"
        textField.isSecureTextEntry = true
        textField.borderStyle = .roundedRect
        textField.layer.cornerRadius = 10
        textField.clipsToBounds = true
        return textField
    }()
    
    let confirmPasswordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Confirmar Senha"
        textField.isSecureTextEntry = true
        textField.borderStyle = .roundedRect
        textField.layer.cornerRadius = 10
        textField.clipsToBounds = true
        return textField
    }()
    
    let registerButton: UIButton = {
        let button = UIButton()
        button.setTitle("Cadastrar", for: .normal)
        button.backgroundColor = UIColor(hex: "#6C9017")
        button.layer.cornerRadius = 10
        button.clipsToBounds = true
        button.addTarget(RegisterScreen.self, action: #selector(registerButtonTapped), for: .touchUpInside)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        return button
    }()
    
    let afterButton: UIButton = {
        let button = UIButton()
        button.setTitle("Depois", for: .normal)
        button.setTitleColor(.systemCyan, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        button.addTarget(RegisterScreen.self, action: #selector(afterTapped), for: .touchUpInside)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        backgroundColor = UIColor(hex: "#174050")
        
        // Adiciona a imagem do perfil
        addSubview(profileImageView)
        profileImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            profileImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            profileImageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 80),
            profileImageView.widthAnchor.constraint(equalToConstant: 100),
            profileImageView.heightAnchor.constraint(equalToConstant: 100)
        ])
        
        // Adiciona campos de texto e botões
        let stackView = UIStackView(arrangedSubviews: [usernameTextField, passwordTextField, confirmPasswordTextField, registerButton])
        stackView.axis = .vertical
        stackView.spacing = 30
        stackView.distribution = .fillEqually
        addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: profileImageView.bottomAnchor, constant: 80),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            stackView.bottomAnchor.constraint(lessThanOrEqualTo: safeAreaLayoutGuide.bottomAnchor, constant: -30)
        ])
        
        addSubview(afterButton)
        afterButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            afterButton.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 20),
            afterButton.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
        
        // Adiciona ação para lidar com o botão de cadastro
        registerButton.addTarget(self, action: #selector(registerButtonTapped), for: .touchUpInside)
        
        afterButton.addTarget(self, action: #selector(afterTapped), for: .touchUpInside)

        
        addSubview(profileImageView)
        profileImageView.translatesAutoresizingMaskIntoConstraints = false
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(profileImageTapped))
        profileImageView.isUserInteractionEnabled = true
        profileImageView.addGestureRecognizer(tapGesture)
    }
    
    @objc private func profileImageTapped() {
        showImagePicker()
    }
    
    func showImagePicker() {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self as? (UIImagePickerControllerDelegate & UINavigationControllerDelegate)
        imagePicker.sourceType = .photoLibrary
        imagePicker.allowsEditing = true
        
        if let viewController = delegate as? UIViewController {
            viewController.present(imagePicker, animated: true, completion: nil)
        }
    }
    
    @objc func registerButtonTapped() {
        delegate?.registerTapped()
    }
    
    @objc private func afterTapped() {
            delegate?.afterTapped()
        }
}
