//
//  IntroductionViewController.swift
//  PromoSteam
//
//  Created by Anderson Moura on 04/01/24.
//

import UIKit

class LoginViewController: UIViewController {
    
    var viewModel: LoginViewModel!
    
    var screen: LoginViewScreen?
    
    override func loadView() {
        self.screen = LoginViewScreen()
        view = screen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = LoginViewModel()
        screen?.delegate = self
        
        screen?.loginButton.addTarget(self, action: #selector(loginTapped), for: .touchUpInside)
        
    }
    
    @objc private func loginTapped() {
        // Implemente a lógica desejada para o clique no botão de login aqui
        print("Login button tapped")

        // Exemplo: Destacar campos vazios
        screen?.highlightEmptyFields()
    }
    
}

extension LoginViewController: LoginViewControllerProtocol {
    func navigateToLogin() {
        navigationController?.pushViewController(RegisterViewController(), animated: true)
    }
}
