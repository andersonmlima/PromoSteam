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
    
    func showAlert(title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(okAction)
        present(alertController, animated: true, completion: nil)
    }
    
    @objc private func loginTapped() {
        guard let email = screen?.loginTextField.text, !email.isEmpty,
              let password = screen?.passwordTextField.text, !password.isEmpty else {
            showAlert(title: "Erro", message: "Por favor, preencha todos os campos.")
            return
        }
        
        // Autenticação com o Firebase
        Auth.auth().signIn(withEmail: email, password: password) { [weak self] (authResult, error) in
            guard let self = self else {
                return
            }
            
            if let error = error {
                // Trate o erro aqui
                print("Erro ao fazer login: \(error.localizedDescription)")
                self.showAlert(title: "Erro", message: "Falha ao fazer login. Verifique suas credenciais e tente novamente.")
                return
            }
            
            // Sucesso no login
            print("Login bem-sucedido")
            
            let homeViewController = HomeViewController()
            self.navigationController?.pushViewController(homeViewController, animated: true)
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
