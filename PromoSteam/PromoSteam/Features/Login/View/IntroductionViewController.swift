//
//  IntroductionViewController.swift
//  PromoSteam
//
//  Created by Anderson Moura on 04/01/24.
//

import UIKit

class IntroductionViewController: UIViewController {
    
    var viewModel: LoginViewModel!

    let logoImagemView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "promosteam-branco.png"))
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = LoginViewModel()
        setupUI()
        
        // Chama o método após 10 segundos
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            self.navigateToLogin()
        }
    }

    private func setupUI() {
        view.backgroundColor = UIColor(hex: "#072236")
        
        view.addSubview(logoImagemView)
        logoImagemView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            logoImagemView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logoImagemView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            logoImagemView.widthAnchor.constraint(equalToConstant: 75),
            logoImagemView.heightAnchor.constraint(equalToConstant: 75)
        ])
    }

    private func navigateToLogin() {
        // Navega para a tela de login
        let loginViewController = LoginViewController()
        loginViewController.modalPresentationStyle = .fullScreen
        present(loginViewController, animated: true, completion: nil)
    }
}
