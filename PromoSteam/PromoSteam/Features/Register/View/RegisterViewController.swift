//
//  RegisterViewController.swift
//  PromoSteam
//
//  Created by Anderson Moura on 10/01/24.
//

import UIKit

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
    
    @objc private func backButtonTapped() {
        // Implemente a lógica desejada quando o botão de volta for pressionado
        // Isso geralmente envolve a navegação de volta para a tela anterior
        navigationController?.popViewController(animated: true)
    }
    
}

extension RegisterViewController: RegisterViewControllerProtocol {
    
    func registerTapped() {

            // Valide os campos antes de prosseguir
            guard let username = screen?.usernameTextField.text, !username.isEmpty,
                  let password = screen?.passwordTextField.text, !password.isEmpty,
                  let confirmPassword = screen?.confirmPasswordTextField.text, !confirmPassword.isEmpty else {
                // Se algum campo estiver vazio, não prossiga com o cadastro
                return
            }

            // Implemente a lógica para lidar com o botão de cadastro
            // Por enquanto, vamos apenas navegar para a HomeViewController
            let homeViewController = HomeViewController()  // Certifique-se de criar a HomeViewController corretamente
            navigationController?.pushViewController(homeViewController, animated: true)
        }

    func afterTapped() {
        navigationController?.popViewController(animated: true)
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
