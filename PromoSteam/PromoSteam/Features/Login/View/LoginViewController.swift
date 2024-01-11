//
//  IntroductionViewController.swift
//  PromoSteam
//
//  Created by Anderson Moura on 04/01/24.
//

import UIKit
import Firebase

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
                screen?.signUpButton.addTarget(self, action: #selector(signUpTapped), for: .touchUpInside)
        
    }
    
    @objc private func loginTapped() {
        guard let email = screen?.loginTextField.text, !email.isEmpty,
              let password = screen?.passwordTextField.text, !password.isEmpty else {
            // Lidar com campos de texto vazios, se necessário
            return
        }

        // Autenticação com o Firebase
        Auth.auth().signIn(withEmail: email, password: password) { [weak self] (authResult, error) in
            guard self != nil else {
                return
            }

            if let error = error {
                // Trate o erro aqui
                print("Erro ao fazer login: \(error.localizedDescription)")
                return
            }

            // Sucesso no login
            print("Login bem-sucedido")

            // Você pode implementar mais lógica aqui, como navegar para a próxima tela
            // ou exibir uma mensagem de sucesso.
        }
    }
        
        @objc private func signUpTapped() {
            // Navegar para a tela de registro
            navigationController?.pushViewController(RegisterViewController(), animated: true)
        }
    }

    extension LoginViewController: LoginViewControllerProtocol {
        func navigateToLogin() {
            // Implemente a lógica para lidar com a navegação para a tela de registro, se necessário
        }
    }
