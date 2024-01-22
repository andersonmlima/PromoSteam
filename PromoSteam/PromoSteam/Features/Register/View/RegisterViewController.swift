//
//  RegisterViewController.swift
//  PromoSteam
//
//  Created by Anderson Moura on 10/01/24.
//

import UIKit
import Firebase

class RegisterViewController: UIViewController {
    
    var screen: RegisterScreen?
    
    override func loadView() {
        self.screen = RegisterScreen()
        screen?.delegate = self
        view = screen
    }
    
    override func viewDidLoad() {
        // Adicione um botão personalizado como item de volta
        let backButton = UIBarButtonItem(image: UIImage(named: "seta-esquerda.png"), style: .plain, target: self, action: #selector(backButtonTapped))
        
        // Define a cor do ícone e do texto do botão de volta para branco
        backButton.tintColor = .white
        
        // Remova o título padrão do botão de volta
        backButton.title = ""
        
        // Atribua o botão de volta personalizado à barra de navegação
        navigationItem.leftBarButtonItem = backButton
    }
    
    func showAlert(title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(okAction)
        present(alertController, animated: true, completion: nil)
    }

    @objc private func backButtonTapped() {
        // Implemente a lógica desejada quando o botão de volta for pressionado
        // Isso geralmente envolve a navegação de volta para a tela anterior
        navigationController?.popViewController(animated: true)
    }
}

extension RegisterViewController: RegisterViewControllerProtocol {    
    
    func registerTapped() {
        guard let username = screen?.usernameTextField.text, !username.isEmpty,
              let password = screen?.passwordTextField.text, !password.isEmpty,
              let confirmPassword = screen?.confirmPasswordTextField.text, !confirmPassword.isEmpty else {
            showAlert(title: "Erro", message: "Por favor, preencha todos os campos.")
            return
        }
        
        // Use o Firebase para criar a conta
        Auth.auth().createUser(withEmail: username, password: password) { [weak self] (authResult, error) in
            guard let self = self else { return }
            
            if let error = error {
                // Trate o erro durante o registro
                print("Erro durante o registro: \(error.localizedDescription)")
                return
            }
            
            // Registro bem-sucedido, autentique o usuário e navegue para a HomeViewController
            Auth.auth().signIn(withEmail: username, password: password) { (authResult, error) in
                if let error = error {
                    // Trate o erro durante a autenticação
                    print("Erro durante a autenticação: \(error.localizedDescription)")
                    return
                }
                
                // Autenticação bem-sucedida, navegue para a HomeViewController
                self.navigateToHome()
            }
        }
    }
    
    func navigateToHome() {
        let homeViewController = HomeViewController()
        self.navigationController?.pushViewController(homeViewController, animated: true)
    }
}

extension RegisterViewController: UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    // Implemente os métodos necessários, como didFinishPickingMediaWithInfo
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let selectedImage = info[.editedImage] as? UIImage {
            // Atualize o profileImageView com a imagem selecionada
            screen?.profileImageView.image = selectedImage
        }
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
}

