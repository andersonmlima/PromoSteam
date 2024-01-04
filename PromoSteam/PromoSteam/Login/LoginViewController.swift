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
        return textField
    }()
    
    let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Senha"
        textField.isSecureTextEntry = true
        textField.borderStyle = .roundedRect
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
        button.backgroundColor = UIColor(hex: "#189fff")
        button.layer.cornerRadius = 4 // Ajuste o valor conforme necessário
        button.clipsToBounds = true // Garante que as bordas arredondadas sejam aplicadas
        // Adicione ação para lidar com o botão de login
        button.addTarget(LoginViewController.self, action: #selector(loginTapped), for: .touchUpInside)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        return button
    }()
    
    let signUpLabel: UILabel = {
        let label = UILabel()
        label.text = "Não tem login? "
        label.textColor = .white
        return label
    }()
    
    let signUpButton: UIButton = {
        let button = UIButton()
        button.setTitle("Cadastre-se aqui", for: .normal)
        button.setTitleColor(.systemCyan, for: .normal)
        // Adicione ação para lidar com o botão de cadastro
        button.addTarget(LoginViewController.self, action: #selector(signUpTapped), for: .touchUpInside)
        return button
    }()
    
    let googleLoginButton: UIButton = {
        let button = UIButton()
        button.setTitle("Login com Google", for: .normal)
        button.backgroundColor = UIColor(hex: "#ff512e")
        // Adicione ação para lidar com o login com o Google
        button.addTarget(LoginViewController.self, action: #selector(googleLoginTapped), for: .touchUpInside)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        view.backgroundColor = UIColor(hex: "#284156")
        
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
        let stackView = UIStackView(arrangedSubviews: [loginTextField, passwordTextField, forgotPasswordButton, loginButton, signUpLabel, signUpButton, googleLoginButton])
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
            buttonStackView.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 10),
            buttonStackView.leadingAnchor.constraint(equalTo: stackView.leadingAnchor)
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
