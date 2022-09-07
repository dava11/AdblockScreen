//
//  AdblockRulesCellTableViewCell.swift
//  VpnScreenApp
//
//  Created by David Khachidze on 07.09.2022.
//

import UIKit

class AdblockRulesCellTableViewCell: UITableViewCell {

    var titleLabel = UILabel()
        var valueLabel = UILabel()
        var statusLabel = UILabel()
        var fileImageView = UIImageView()
        let fileImage = UIImage(named: "rules.file")
        var cellStack = UIStackView()

        override func awakeFromNib() {
            super.awakeFromNib()
            
        }
        func cellsetings(image: UIImage, title: String, status: String) {
            backgroundColor = UIColor(red: 0.525, green: 0.706, blue: 0.718, alpha: 0.7)
            fileImageView = UIImageView(image: image)
            addSubview(fileImageView)
            fileImageView.snp.makeConstraints { make in
                make.centerY.equalToSuperview()
                make.leading.equalToSuperview().inset(10)
            }
            
            titleLabel.backgroundColor = .clear
            titleLabel.textColor = UIColor(red: 0.183, green: 0.183, blue: 0.183, alpha: 1)
            titleLabel.font = UIFont(name: "Rubik-Regular", size: 16)
            titleLabel.text = title
            
            valueLabel.backgroundColor = .clear
            valueLabel.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
            valueLabel.font = UIFont(name: "Roboto-Regular", size: 14)
            valueLabel.text = "125 Rules"
            
            statusLabel.backgroundColor = .clear
            statusLabel.textColor = UIColor(red: 0.345, green: 0.452, blue: 0.486, alpha: 1)
            statusLabel.font = UIFont(name: "Rubik-Regular", size: 12)
            statusLabel.text = status
            
            cellStack.spacing = -1
            cellStack.axis = .vertical
            cellStack.distribution = .fillEqually
            cellStack.addArrangedSubview(titleLabel)
            cellStack.addArrangedSubview(valueLabel)
            cellStack.addArrangedSubview(statusLabel)
            addSubview(cellStack)
            cellStack.snp.makeConstraints { make in
                make.centerY.equalToSuperview()
                make.leading.equalTo(fileImageView.snp.trailing).offset(10)
            }

        }

}
