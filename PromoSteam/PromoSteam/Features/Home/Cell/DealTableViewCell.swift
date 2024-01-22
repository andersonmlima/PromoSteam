//
//  DealTableViewCell.swift
//  PromoSteam
//
//  Created by Anderson Moura on 17/01/24.
//

import UIKit

class DealTableViewCell: UITableViewCell {
    static let identifier = "DealTableViewCell"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        // Configuração dos elementos visuais na célula
        textLabel?.font = UIFont.systemFont(ofSize: 16)
        detailTextLabel?.font = UIFont.systemFont(ofSize: 14)
        accessoryType = .disclosureIndicator
    }
    
    func configure(with deal: DealElement?) {
        textLabel?.text = deal?.title
        detailTextLabel?.text = "Valor: R$ \(deal?.salePrice ?? "")"
        
        
        // Personalizações para a célula
        backgroundColor = UIColor(hex: "#3A4C63") // Cor de fundo personalizada
        textLabel?.textColor = .white // Cor do texto personalizada
        
        // Configurar a borda e a cor dos valores
        detailTextLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        detailTextLabel?.layer.masksToBounds = true
        detailTextLabel?.textColor = UIColor(hex: "#6C9017") // Cor do valor
        
    }
}
