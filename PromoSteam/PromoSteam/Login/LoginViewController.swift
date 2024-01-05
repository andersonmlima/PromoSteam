//
//  ViewController.swift
//  PromoSteam
//
//  Created by Anderson Moura on 03/01/24.
//

import UIKit

class LoginViewController: UIViewController {
    
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
        button.layer.cornerRadius = 10 // Ajuste o valor conforme necessário
        button.clipsToBounds = true // Garante que as bordas arredondadas sejam aplicadas
        // Adicione ação para lidar com o botão de login
        button.addTarget(LoginViewController.self, action: #selector(loginTapped), for: .touchUpInside)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        return button
    }()
    
    let orLabel: UILabel = {
        let label = UILabel()
        label.text = "Ou faça login com"
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
        label.text = "Não tem login? "
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 16)
        return label
    }()
    
    let signUpButton: UIButton = {
        let button = UIButton()
        button.setTitle("Cadastre-se aqui", for: .normal)
        button.setTitleColor(.systemCyan, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        // Adicione ação para lidar com o botão de cadastro
        button.addTarget(LoginViewController.self, action: #selector(signUpTapped), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        view.backgroundColor = UIColor(hex: "#174050")
        
        // Adiciona a imagem do logo
        view.addSubview(logoImageView)
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logoImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            logoImageView.widthAnchor.constraint(equalToConstant: 250),
            logoImageView.heightAnchor.constraint(equalToConstant: 250)
        ])
        
        // Adiciona campos de texto e botões
        let stackView = UIStackView(arrangedSubviews: [loginTextField, passwordTextField, forgotPasswordButton, loginButton, signUpLabel, signUpButton])
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.distribution = .fillEqually
        view.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: -10),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            // Adiciona uma restrição de espaçamento entre o campo de texto da senha e o botão "Esqueceu a senha?"
            forgotPasswordButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 20),
            
            // Adiciona uma restrição de espaçamento entre o botão "Esqueceu a senha?" e o botão "Entrar"
            loginButton.topAnchor.constraint(equalTo: forgotPasswordButton.bottomAnchor, constant: 30)
        ])
        
        view.addSubview(orLabel)
        orLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            orLabel.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 20),
            orLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        let iconStackView = UIStackView(arrangedSubviews: [googleLoginIcon, instagramLoginIcon, discordLoginIcon])
        iconStackView.axis = .horizontal
        iconStackView.spacing = 10
        iconStackView.distribution = .fillEqually
        view.addSubview(iconStackView)
        iconStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            iconStackView.topAnchor.constraint(equalTo: orLabel.bottomAnchor, constant: 20),
            iconStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            iconStackView.heightAnchor.constraint(equalToConstant: 40) // Ajuste conforme necessário
        ])
        
        // Configuração de estilo do botão "Esqueceu a senha?"
        forgotPasswordButton.contentHorizontalAlignment = .left
        forgotPasswordButton.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        forgotPasswordButton.setTitleColor(.white, for: .normal)
        
        let buttonStackView = UIStackView(arrangedSubviews: [signUpLabel, signUpButton])
        buttonStackView.axis = .horizontal
        buttonStackView.spacing = 10
        view.addSubview(buttonStackView)
        buttonStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            buttonStackView.topAnchor.constraint(equalTo: iconStackView.bottomAnchor, constant: 20),
            buttonStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        
        
    }
    
    // Adicione funções de ação para os botões
    @objc private func forgotPasswordTapped() {
        // Implemente a lógica para lidar com o esqueceu a senha
    }
    
    @objc private func loginTapped() {
        // Implemente a lógica para lidar com o botão de login
    }
    
    @objc private func signUpTapped() {
        // Implemente a lógica para lidar com o botão de cadastro
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
