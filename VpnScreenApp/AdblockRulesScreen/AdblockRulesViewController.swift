//
//  AdblockRulesViewController.swift
//  VpnScreenApp
//
//  Created by David Khachidze on 07.09.2022.
//

import UIKit

class AdblockRulesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var isChoose = true
    var titleLabel = UILabel()
    var leftSeparateLable = UILabel()
    var rightSeparateLable = UILabel()
    var rulesLabel = UILabel()
    var listLabel = UILabel()
    var dataSourse = ["Block All","Remove Ads","Block Trackers","Block Adult"]{
        didSet{
            rulesTableView.reloadData()
        }
    }
    var statusArray = ["All rules will be activated","Blocking ads in any form","Tracking software blocking","Blocking ads of a sexual nature"]
    var leftLineView = UIView()
    var rightLineView = UIView()
    var topView = UIView()
    var leftSwitchView = UIView()
    var rightSwitchView = UIView()
    var backImageView = UIImageView()
    let backImage = UIImage(named: "rules.back")
    var rulesTableView = UITableView()
    let identifire = "Cell"
    var separateStack = UIStackView()
    var buttonsStack = UIStackView()
    var switchButtons = UIStackView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        rulesTableView.dataSource = self
        rulesTableView.delegate = self
        createTpoSpase()
        createRulesTableView()
        createButtons()
        

    }
    
    func createTpoSpase() {
        
        topView.backgroundColor = UIColor(red: 0.62, green: 0.788, blue: 0.808, alpha: 1)
        view.addSubview(topView)
        topView.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview().inset(0)
            make.height.equalToSuperview().multipliedBy(0.2)
        }
        backImageView = UIImageView(image: backImage)
        backImageView.isUserInteractionEnabled = true
        let backGesture = UITapGestureRecognizer(target: self, action: #selector(backGesture))
        backImageView.addGestureRecognizer(backGesture)
        view.addSubview(backImageView)
        backImageView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).inset(10)
            make.leading.equalToSuperview().inset(10)
        }
        
        titleLabel.backgroundColor = .clear
        titleLabel.textColor = UIColor(red: 0.183, green: 0.183, blue: 0.183, alpha: 1)
        titleLabel.font = UIFont(name: "Roboto-Medium", size: 14)
        titleLabel.text = "BLOCK RULES"
        topView.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(view.safeAreaLayoutGuide).inset(15)
        }
        
    }
    
    func createButtons() {
        
        separateStack.spacing = 0
        separateStack.axis = .horizontal
        separateStack.distribution = .fillEqually
        separateStack.addArrangedSubview(leftSeparateLable)
        separateStack.addArrangedSubview(rightSeparateLable)
        topView.addSubview(separateStack)
        separateStack.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(0)
            make.bottom.equalToSuperview().inset(0)
           
        }
        
        leftLineView.backgroundColor = .black
        topView.addSubview(leftLineView)
        leftLineView.snp.makeConstraints { make in
            make.width.equalTo(leftSeparateLable.snp.width)
            make.height.equalTo(2)
            make.leading.equalToSuperview().inset(0)
            make.bottom.equalTo(leftSeparateLable)

        }
        
        rulesLabel.backgroundColor = .clear
        rulesLabel.textAlignment = .center
        rulesLabel.textColor = UIColor(red: 0.183, green: 0.183, blue: 0.183, alpha: 1)
        rulesLabel.font = UIFont(name: "Roboto-Regular", size: 15)
        rulesLabel.text = "Rules"

        
        listLabel.backgroundColor = .clear
        listLabel.textAlignment = .center
        listLabel.textColor = UIColor(red: 0.345, green: 0.452, blue: 0.486, alpha: 1)
        listLabel.font = UIFont(name: "Roboto-Regular", size: 15)
        listLabel.text = "Block List"

        
        buttonsStack.spacing = 0
        buttonsStack.axis = .horizontal
        buttonsStack.distribution = .fillEqually
        buttonsStack.alignment = .center
        buttonsStack.addArrangedSubview(rulesLabel)
        buttonsStack.addArrangedSubview(listLabel)
        buttonsStack.isUserInteractionEnabled = false
        view.addSubview(buttonsStack)
        buttonsStack.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.leading.trailing.equalToSuperview().inset(0)
            make.bottom.equalTo(separateStack.snp.bottom).offset(-7)
            
        }
        
        leftSwitchView.backgroundColor = .clear
        leftSwitchView.isUserInteractionEnabled = true
        let leftViewGesture = UITapGestureRecognizer(target: self, action: #selector(leftViewGesture))
        leftSwitchView.addGestureRecognizer(leftViewGesture)
        rightSwitchView.backgroundColor = .clear
        rightSwitchView.isUserInteractionEnabled = true
        let rightViewGesture = UITapGestureRecognizer(target: self, action: #selector(rightViewGesture))
        rightSwitchView.addGestureRecognizer(rightViewGesture)
        
        
        switchButtons.spacing = 0
        switchButtons.axis = .horizontal
        switchButtons.distribution = .fillEqually
        switchButtons.addArrangedSubview(leftSwitchView)
        switchButtons.addArrangedSubview(rightSwitchView)
        topView.addSubview(switchButtons)
        switchButtons.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(0)
            make.centerX.equalToSuperview()
            make.bottom.equalTo(rulesTableView.snp.top).inset(0)
            make.height.equalTo(50)
        }
        
    }
    
    
    func createRulesTableView() {
        
        rulesTableView.backgroundColor = UIColor(red: 0.525, green: 0.706, blue: 0.718, alpha: 1)
        rulesTableView.register(AdblockRulesCellTableViewCell.self, forCellReuseIdentifier: identifire)
        view.addSubview(rulesTableView)
        rulesTableView.snp.makeConstraints { make in
            make.leading.trailing.bottom.equalToSuperview().inset(0)
            make.top.equalTo(topView.snp.bottom).inset(0)
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSourse.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = rulesTableView.dequeueReusableCell(withIdentifier: identifire, for: indexPath) as? AdblockRulesCellTableViewCell else { return UITableViewCell() }
        let title = dataSourse[indexPath.row]
        let status = statusArray[indexPath.row]
        cell.cellsetings(image: cell.fileImage!, title: title, status: status)
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    @objc func backGesture() {
        navigationController?.popViewController(animated: true)
    }
    
    @objc func leftViewGesture() {
        
        guard !isChoose else { return }
        
        listLabel.textColor = UIColor(red: 0.345, green: 0.452, blue: 0.486, alpha: 1)
        rulesLabel.textColor = UIColor(red: 0.183, green: 0.183, blue: 0.183, alpha: 1)
        
        leftLineView.isHidden = false
        rightLineView.isHidden = true
        
        isChoose = true
    }
    
    @objc func rightViewGesture() {
        
        guard isChoose else { return }
        listLabel.textColor = UIColor(red: 0.183, green: 0.183, blue: 0.183, alpha: 1)
        rulesLabel.textColor = UIColor(red: 0.345, green: 0.452, blue: 0.486, alpha: 1)
        
        rightLineView.backgroundColor = .black
        topView.addSubview(rightLineView)
        rightLineView.snp.makeConstraints { make in
            make.width.equalTo(rightSeparateLable.snp.width)
            make.height.equalTo(2)
            make.trailing.equalToSuperview().inset(0)
            make.bottom.equalTo(rightSeparateLable)

        }
        leftLineView.isHidden = true
        rightLineView.isHidden = false
        
        
        
        isChoose = false
    }


}
