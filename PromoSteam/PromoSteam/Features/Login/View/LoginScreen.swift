//
//  ViewController.swift
//  PromoSteam
//
//  Created by Anderson Moura on 03/01/24.
//

import UIKit

protocol LoginViewControllerProtocol: AnyObject{
    func navigateToLogin()
}

class LoginViewScreen: UIView {
    
    var viewModel: LoginViewModel!
    
    weak var delegate: LoginViewControllerProtocol?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let logoImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "promosteam-branco.png"))
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    let loginTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Login"
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
    
    let forgotPasswordButton: UIButton = {
        let button = UIButton()
        button.setTitle("Esqueceu a senha?", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.contentHorizontalAlignment = .left
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        // Adicione ação para lidar com o esqueceu a senha
        button.addTarget(LoginViewController.self, action: #selector(forgotPasswordTapped), for: .touchUpInside)
        return button
    }()
    
    let loginButton: UIButton = {
        let button = UIButton()
        button.setTitle("Entrar", for: .normal)
        button.backgroundColor = UIColor(hex: "#6C9017")
        button.layer.cornerRadius = 10
        button.clipsToBounds = true
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        return button
    }()
    
    let orLabel: UILabel = {
        let label = UILabel()
        label.text = "Faça login com"
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 16)
        return label
    }()
    
    let googleLoginIcon: UIButton = {
        let button = UIButton()
        let googleImage = UIImage(named: "google.png") // Substitua "googleIcon" pelo nome real da sua imagem
        button.setImage(googleImage, for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
        button.layer.cornerRadius = 10
        button.clipsToBounds = true
        // Adicione ação para lidar com o login com o Google
        button.addTarget(LoginViewController.self, action: #selector(googleLoginTapped), for: .touchUpInside)
        return button
    }()
    
    let instagramLoginIcon: UIButton = {
        let button = UIButton()
        let instagramImage = UIImage(named: "instagram.png") // Substitua "instagramIcon" pelo nome real da sua imagem
        button.setImage(instagramImage, for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
        button.layer.cornerRadius = 10
        button.clipsToBounds = true
        // Adicione ação para lidar com o login com Instagram
        button.addTarget(LoginViewController.self, action: #selector(instagramLoginTapped), for: .touchUpInside)
        return button
    }()
    
    let discordLoginIcon: UIButton = {
        let button = UIButton()
        let discordImage = UIImage(named: "discord.png") // Substitua "discordIcon" pelo nome real da sua imagem
        button.setImage(discordImage, for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
        button.layer.cornerRadius = 10
        button.clipsToBounds = true
        // Adicione ação para lidar com o login com o Discord
        button.addTarget(LoginViewController.self, action: #selector(discordLoginTapped), for: .touchUpInside)
        return button
    }()
    
    let signUpLabel: UILabel = {
        let label = UILabel()
        label.text = "Ou "
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 16)
        return label
    }()
    
    let signUpButton: UIButton = {
        let button = UIButton()
        button.setTitle("Cadastre-se aqui", for: .normal)
        button.setTitleColor(.systemCyan, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        // Não defina o alvo da ação aqui
        return button
    }()
    
    func highlightEmptyFields() {
        if loginTextField.text?.isEmpty ?? true {
            loginTextField.layer.borderColor = UIColor.red.cgColor
            loginTextField.layer.borderWidth = 1.0
        }
        
        if passwordTextField.text?.isEmpty ?? true {
            passwordTextField.layer.borderColor = UIColor.red.cgColor
            passwordTextField.layer.borderWidth = 1.0
        }
    }
    
    private func setupUI() {
        backgroundColor = UIColor(hex: "#174050")
        
        // Adiciona a imagem do logo
        addSubview(logoImageView)
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            logoImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            logoImageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20),
            logoImageView.widthAnchor.constraint(equalToConstant: 250),
            logoImageView.heightAnchor.constraint(equalToConstant: 250)
        ])
        
        // Adiciona campos de texto e botões
        let stackView = UIStackView(arrangedSubviews: [loginTextField, passwordTextField, forgotPasswordButton, loginButton, signUpLabel, signUpButton])
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.distribution = .fillEqually
        addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 10), // Ajuste aqui
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20)
        ])
        
        
        addSubview(orLabel)
        orLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            orLabel.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 20),
            orLabel.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
        
        signUpButton.addTarget(self, action: #selector(signUpTapped), for: .touchUpInside)
        
        let iconStackView = UIStackView(arrangedSubviews: [googleLoginIcon, instagramLoginIcon, discordLoginIcon])
        iconStackView.axis = .horizontal
        iconStackView.spacing = 10
        iconStackView.distribution = .fillEqually
        addSubview(iconStackView)
        iconStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            iconStackView.topAnchor.constraint(equalTo: orLabel.bottomAnchor, constant: 20),
            iconStackView.centerXAnchor.constraint(equalTo: centerXAnchor),
            iconStackView.heightAnchor.constraint(equalToConstant: 40) // Ajuste conforme necessário
        ])
        
        // Configuração de estilo do botão "Esqueceu a senha?"
        forgotPasswordButton.contentHorizontalAlignment = .left
        forgotPasswordButton.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        forgotPasswordButton.setTitleColor(.white, for: .normal)
        
        let buttonStackView = UIStackView(arrangedSubviews: [signUpLabel, signUpButton])
        buttonStackView.axis = .horizontal
        buttonStackView.spacing = 10
        addSubview(buttonStackView)
        buttonStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            buttonStackView.topAnchor.constraint(equalTo: iconStackView.bottomAnchor),
            buttonStackView.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
        
        addSubview(signUpLabel)
        signUpLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            signUpLabel.topAnchor.constraint(equalTo: iconStackView.bottomAnchor, constant: 20),
            signUpLabel.centerXAnchor.constraint(equalTo: centerXAnchor) // Centraliza na horizontal
        ])
        
        addSubview(signUpButton)
        signUpButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            signUpButton.topAnchor.constraint(equalTo: signUpLabel.bottomAnchor, constant: 5), // Adicione um espaçamento entre signUpLabel e signUpButton
            signUpButton.centerXAnchor.constraint(equalTo: centerXAnchor) // Centraliza na horizontal
        ])
        
        // Adiciona ação para lidar com o botão de cadastro
        signUpButton.addTarget(self, action: #selector(signUpTapped), for: .touchUpInside)
        
    }
    
    // Adicione funções de ação para os botões
    @objc private func forgotPasswordTapped() {
        // Implemente a lógica para lidar com o esqueceu a senha
    }
    
    @objc private func loginTapped() {
        
        print("Login button tapped")
        
        // Exemplo: Destacar campos vazios
        highlightEmptyFields()
        
    }
    
    @objc private func signUpTapped() {
        delegate?.navigateToLogin()
    }
    
    @objc private func googleLoginTapped() {
        // Implemente a lógica para lidar com o login com o Google
    }
    
    @objc private func instagramLoginTapped() {
        // Implemente a lógica para lidar com o login com Instagram
    }
    
    @objc private func discordLoginTapped() {
        // Implemente a lógica para lidar com o login com Discord
    }
}

extension UIColor {
    convenience init(hex: String) {
        var hexSanitized = hex.trimmingCharacters(in: .whitespacesAndNewlines)
        hexSanitized = hexSanitized.replacingOccurrences(of: "#", with: "")
        
        var rgb: UInt64 = 0
        
        Scanner(string: hexSanitized).scanHexInt64(&rgb)
        
        let red = CGFloat((rgb & 0xFF0000) >> 16) / 255.0
        let green = CGFloat((rgb & 0x00FF00) >> 8) / 255.0
        let blue = CGFloat(rgb & 0x0000FF) / 255.0
        
        self.init(red: red, green: green, blue: blue, alpha: 1.0)
    }
}
