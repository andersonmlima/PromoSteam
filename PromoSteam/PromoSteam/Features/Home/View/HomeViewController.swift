//
//  HomeViewController.swift
//  PromoSteam
//
//  Created by Anderson Moura on 11/01/24.
//

import UIKit

class HomeViewController: UIViewController {
    var viewModel: HomeViewModel!
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(DealTableViewCell.self, forCellReuseIdentifier: DealTableViewCell.identifier)
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = HomeViewModel()
        configureUI()
        fetchCheapSharkDeals()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configureUI()
    }
    
    func fetchCheapSharkDeals() {
        viewModel.fetchCheapSharkDeals { [weak self] (deals, error) in
            if let error = error {
                print("Erro na requisição: \(error.localizedDescription)")
                return
            }
            
            if let deals = deals {
                print(deals)
                DispatchQueue.main.async {
                    self?.tableView.reloadData()
                }
            }
        }
    }
    
    private func configureUI() {
        // Configurações da barra de navegação
        navigationController?.navigationBar.tintColor = .white
        navigationController?.navigationBar.barTintColor = UIColor(hex: "#174050")
        navigationController?.navigationBar.isTranslucent = false // Altere essa linha
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        
        navigationItem.hidesBackButton = true
        
        
        // Configurações da tabela
        view.backgroundColor = UIColor(hex: "#174050")
        tableView.backgroundColor = UIColor(hex: "#174050") // Cor de fundo da tabela
        tableView.separatorStyle = .none
        tableView.indicatorStyle = .white // Cor da scrollbar
        
        let titleLabel = UILabel()
        titleLabel.text = "PROMOÇÕES"
        titleLabel.textColor = .white
        titleLabel.font = UIFont.boldSystemFont(ofSize: 18)
        navigationItem.titleView = titleLabel
        
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        tableView.dataSource = self
        tableView.delegate = self
    }
}

extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfDeals()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: DealTableViewCell.identifier, for: indexPath) as? DealTableViewCell else {
            fatalError("A célula não pôde ser criada.")
        }
        
        if let deal = viewModel.deal(at: indexPath.row) {
            cell.configure(with: deal)
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Implemente a lógica para lidar com a seleção de uma célula, por exemplo, abrir os detalhes do jogo
        if let deal = viewModel.deal(at: indexPath.row),
           let dealID = deal.dealID,
           let url = URL(string: "https://www.cheapshark.com/redirect?dealID=\(dealID)") {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }
}
