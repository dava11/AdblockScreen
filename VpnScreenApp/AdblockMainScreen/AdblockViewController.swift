//
//  ViewController.swift
//  VpnScreenApp
//
//  Created by David Khachidze on 07.09.2022.
//

import UIKit
import SnapKit

class AdblockViewController: UIViewController {

    var botView = UIView()
    var switchView = UIView()
    var isConnected = false
    var onLabel = UILabel()
    var offLabel = UILabel()
    var adblockLabel = UILabel()
    var statusLabel = UILabel()
    var inactiveLabel = UILabel()
    var adsLabel = UILabel()
    var adsBotLabel = UILabel()
    var savedLabel = UILabel()
    var savedBotLabel = UILabel()
    var savedMbpsBotLabel = UILabel()
    var threatsLabel = UILabel()
    var threatsBotLabel = UILabel()
    var blockLabel = UILabel()
    var rusesLabel = UILabel()
    var adsImageView = UIImageView()
    let adsImage = UIImage(named: "adblock.ads")
    var savedImageView = UIImageView()
    let savedImage = UIImage(named: "adblock.saved")
    var threatsImageView = UIImageView()
    var threatsImage = UIImage(named: "adblock.threats")
    var leftVerLineImageView = UIImageView()
    var rightVerLineImageView = UIImageView()
    var verLineImage = UIImage(named: "adblock.verLine")
    var backImageView = UIImageView()
    let backImage = UIImage(named: "adblock.back")
    var worldImageView = UIImageView()
    let worldImage = UIImage(named: "adblock.hi")
    var progressImageView = UIImageView()
    let progressImage = UIImage(named: "adblock.wheel")
    var ellipseImageView = UIImageView()
    let ellipseImage = UIImage(named: "adblock.ellipse1")
    var ellipseBotImageView = UIImageView()
    let ellipseBotImage = UIImage(named: "adblock.ellipse2")
    var ellipseTopImageView = UIImageView()
    let ellipseTopImage = UIImage(named: "adblock.ellipse3")
    var fileImageView = UIImageView()
    let fileImage = UIImage(named: "adblock.file")
    var arrowImageView = UIImageView()
    let arrowImage = UIImage(named: "adblock.arrow")
    var horLineImageView = UIImageView()
    let horLineImage = UIImage(named: "adblock.horLine")
    var connectionStack = UIStackView()
    var adsStack = UIStackView()
    var savedStack = UIStackView()
    var threatsStack = UIStackView()
    var allStack = UIStackView()
    var imageStack = UIStackView()
    var botStack = UIStackView()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(red: 0.62, green: 0.788, blue: 0.808, alpha: 1)
        createTopSpase()
        createMidSpaseView()
        createBotView()
    }
    
    func createTopSpase() {
        
        backImageView = UIImageView(image: backImage)
        view.addSubview(backImageView)
        backImageView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).inset(10)
            make.left.equalToSuperview().inset(20)
            make.width.equalTo(15.08)
            make.height.equalTo(25)
        }
        
        worldImageView = UIImageView(image: worldImage)
        view.addSubview(worldImageView)
        worldImageView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).inset(7)
            make.right.equalToSuperview().inset(20)
            make.height.equalTo(30)
            make.width.equalTo(22.5)
        }
        
        adblockLabel.backgroundColor = .clear
        adblockLabel.textColor = UIColor(red: 0.183, green: 0.183, blue: 0.183, alpha: 1)
        adblockLabel.font = UIFont.systemFont(ofSize: 14)
        adblockLabel.text = "ADBLOCK"
        adblockLabel.textAlignment = .center
        view.addSubview(adblockLabel)
        adblockLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(view.safeAreaLayoutGuide).inset(15)
        }
        
    }

    func createMidSpaseView() {

        statusLabel.backgroundColor = .clear
        statusLabel.textAlignment = .center
        statusLabel.font = UIFont(name: "Roboto-Regular", size: 14)
        statusLabel.text = "status"
        
        inactiveLabel.backgroundColor = .clear
        inactiveLabel.textAlignment = .center
        inactiveLabel.font = UIFont(name: "Roboto-Medium", size: 22)
        inactiveLabel.text = "INACTIVE"
        
        connectionStack.spacing = 5
        connectionStack.axis = .vertical
        connectionStack.distribution = .fillEqually
        connectionStack.addArrangedSubview(statusLabel)
        connectionStack.addArrangedSubview(inactiveLabel)
        view.addSubview(connectionStack)
        connectionStack.snp.makeConstraints { make in
            make.top.equalTo(adblockLabel.snp.bottom).offset(view.frame.height * 0.05)
            make.centerX.equalToSuperview()
        }
        
        progressImageView = UIImageView(image: progressImage)
        view.addSubview(progressImageView)
        progressImageView.snp.makeConstraints { make in
            make.height.equalToSuperview().multipliedBy(0.24737)
            make.width.equalTo(progressImageView.snp.height)
            make.centerX.equalToSuperview()
            make.top.equalTo(connectionStack.snp.bottom).offset(view.frame.height * 0.05)
        }
        
        ellipseImageView = UIImageView(image: ellipseImage)
        view.addSubview(ellipseImageView)
        ellipseImageView.snp.makeConstraints { make in
            make.centerX.equalTo(progressImageView.snp.centerX)
            make.centerY.equalTo(progressImageView.snp.centerY)
        }
        
        ellipseBotImageView = UIImageView(image: ellipseBotImage)
        view.addSubview(ellipseBotImageView)
        ellipseBotImageView.snp.makeConstraints { make in
            make.centerX.equalTo(progressImageView.snp.centerX)
            make.centerY.equalTo(progressImageView.snp.centerY)
        }
        
        ellipseTopImageView = UIImageView(image: ellipseTopImage)
        view.addSubview(ellipseTopImageView)
        ellipseTopImageView.snp.makeConstraints { make in
            make.centerX.equalTo(progressImageView.snp.centerX)
            make.centerY.equalTo(progressImageView.snp.centerY)
        }
        
        onLabel.backgroundColor = .clear
        onLabel.isUserInteractionEnabled = true
        onLabel.textAlignment = .center
        onLabel.font = UIFont.systemFont(ofSize: 25)
        onLabel.textColor = UIColor(red: 0.345, green: 0.452, blue: 0.486, alpha: 1)
        onLabel.text = "On"
        let onGesture = UITapGestureRecognizer(target: self, action: #selector(onGesture))
        onLabel.addGestureRecognizer(onGesture)
        view.addSubview(onLabel)
        onLabel.snp.makeConstraints { make in
            make.bottom.equalTo(progressImageView.snp.top).offset(20)
            make.leading.equalTo(progressImageView.snp.trailing).offset(7)
        }
        offLabel.backgroundColor = .clear
        offLabel.textAlignment = .center
        offLabel.font = UIFont.systemFont(ofSize: 25)
        offLabel.textColor = UIColor(red: 0.183, green: 0.183, blue: 0.183, alpha: 1)
        offLabel.isUserInteractionEnabled = true
        offLabel.text = "Off"
        let offGesture = UITapGestureRecognizer(target: self, action: #selector(offGesture))
        offLabel.addGestureRecognizer(offGesture)
        view.addSubview(offLabel)
        offLabel.snp.makeConstraints { make in
            make.bottom.equalTo(progressImageView.snp.top).offset(20)
            make.trailing.equalTo(progressImageView.snp.leading).offset(7)
        }
        
        adsLabel.backgroundColor = .clear
        adsLabel.textColor = UIColor(red: 0.345, green: 0.452, blue: 0.486, alpha: 1)
        adsLabel.font = UIFont(name: "Roboto-Regular", size: view.frame.height * 0.01)
        adsLabel.text = "Blocked Ads"
        
        adsImageView = UIImageView(image: adsImage)
        adsImageView.contentMode = .scaleAspectFit
        
        adsStack.spacing = -15
        adsStack.axis = .horizontal
        adsStack.distribution = .fillEqually
        adsStack.addArrangedSubview(adsImageView)
        adsStack.addArrangedSubview(adsLabel)
        adsStack.snp.makeConstraints { make in
            make.height.equalTo(14)

        }

        
        savedLabel.backgroundColor = .clear
        savedLabel.textColor = UIColor(red: 0.345, green: 0.452, blue: 0.486, alpha: 1)
        savedLabel.font = UIFont(name: "Roboto-Regular", size: view.frame.height * 0.01)
        savedLabel.text = "Traffics Saved"
        
        savedImageView = UIImageView(image: savedImage)
        savedImageView.contentMode = .scaleAspectFit
        
        
        savedStack.spacing = -15
        savedStack.axis = .horizontal
        savedStack.distribution = .fillEqually
        savedStack.addArrangedSubview(savedImageView)
        savedStack.addArrangedSubview(savedLabel)
        savedStack.snp.makeConstraints { make in
          make.height.equalTo(14)
        }

        
        threatsLabel.backgroundColor = .clear
        threatsLabel.textColor = UIColor(red: 0.345, green: 0.452, blue: 0.486, alpha: 1)
        threatsLabel.font = UIFont(name: "Roboto-Regular", size: view.frame.height * 0.01)
        threatsLabel.text = "Blocked Ads"
        
        threatsImageView = UIImageView(image: threatsImage)
        threatsImageView.contentMode = .scaleAspectFit
        
        threatsStack.spacing = -15
        threatsStack.axis = .horizontal
        threatsStack.distribution = .fillEqually
        threatsStack.addArrangedSubview(threatsImageView)
        threatsStack.addArrangedSubview(threatsLabel)
        threatsStack.snp.makeConstraints { make in
            make.height.equalTo(14)
        }

        
        allStack.spacing = 0
        allStack.axis = .horizontal
        allStack.distribution = .fillEqually
        allStack.addArrangedSubview(adsStack)
        allStack.addArrangedSubview(savedStack)
        allStack.addArrangedSubview(threatsStack)
        view.addSubview(allStack)
        allStack.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.leading.trailing.equalToSuperview().inset(0)
            make.top.equalTo(progressImageView.snp.bottom).offset(32.55)
        }
        
        leftVerLineImageView = UIImageView(image: verLineImage)
        rightVerLineImageView = UIImageView(image: verLineImage)
        view.addSubview(leftVerLineImageView)
        leftVerLineImageView.snp.makeConstraints { make in
            make.leading.equalTo(adsLabel.snp.trailing).offset(5)
            make.top.equalTo(adsLabel.snp.bottom).offset(-5)
            make.height.equalTo(50)
        }
        view.addSubview(rightVerLineImageView)
        rightVerLineImageView.snp.makeConstraints { make in
            make.trailing.equalTo(threatsImageView.snp.leading).offset(15)
            make.top.equalTo(threatsImageView.snp.bottom).offset(-5)
            make.height.equalTo(50)
        }
        
        adsBotLabel.backgroundColor = .clear
        adsBotLabel.textColor = UIColor(red: 0.183, green: 0.183, blue: 0.183, alpha: 1)
        adsBotLabel.font = UIFont(name: "Roboto-Regular", size: view.frame.height * 0.02)
        adsBotLabel.text = "-"
        view.addSubview(adsBotLabel)
        adsBotLabel.snp.makeConstraints { make in
            make.top.equalTo(adsStack.snp.bottom).offset(10)
            make.centerX.equalTo(adsStack.snp.centerX)
        }
        
        savedBotLabel.backgroundColor = .clear
        savedBotLabel.textColor = UIColor(red: 0.183, green: 0.183, blue: 0.183, alpha: 1)
        savedBotLabel.font = UIFont(name: "Roboto-Regular", size: view.frame.height * 0.02)
        savedBotLabel.text = "125"
        view.addSubview(savedBotLabel)
        savedBotLabel.snp.makeConstraints { make in
            make.top.equalTo(savedStack.snp.bottom).offset(10)
            make.centerX.equalTo(savedStack.snp.centerX)
        }
        
        threatsBotLabel.backgroundColor = .clear
        threatsBotLabel.textColor = UIColor(red: 0.183, green: 0.183, blue: 0.183, alpha: 1)
        threatsBotLabel.font = UIFont(name: "Roboto-Regular", size: view.frame.height * 0.02)
        threatsBotLabel.text = "125"
        view.addSubview(threatsBotLabel)
        threatsBotLabel.snp.makeConstraints { make in
            make.top.equalTo(threatsStack.snp.bottom).offset(10)
            make.centerX.equalTo(threatsStack.snp.centerX)
        }
        
        savedMbpsBotLabel.backgroundColor = .clear
        savedMbpsBotLabel.textColor = UIColor(red: 0.345, green: 0.452, blue: 0.486, alpha: 1)
        savedMbpsBotLabel.font = UIFont(name: "Roboto-Regular", size: view.frame.height * 0.01)
        savedMbpsBotLabel.text = "Mbps"
        view.addSubview(savedMbpsBotLabel)
        savedMbpsBotLabel.snp.makeConstraints { make in
            make.top.equalTo(savedBotLabel.snp.bottom).offset(-5)
            make.leading.equalTo(savedBotLabel.snp.trailing).offset(5)
        }
    }
    @objc func onGesture() {
        guard !isConnected else { return }
        progressImageView.transform = progressImageView.transform.rotated(by: .pi / 2)
        onLabel.textColor = UIColor(red: 0.183, green: 0.183, blue: 0.183, alpha: 1)
        offLabel.textColor = UIColor(red: 0.345, green: 0.452, blue: 0.486, alpha: 1)
        isConnected = true
        
    }
    @objc func offGesture() {
        guard isConnected else { return }
        progressImageView.transform = progressImageView.transform.rotated(by: .pi * 1.5)
        onLabel.textColor = UIColor(red: 0.345, green: 0.452, blue: 0.486, alpha: 1)
        offLabel.textColor = UIColor(red: 0.183, green: 0.183, blue: 0.183, alpha: 1)
        isConnected = false
    }
    
    func createBotView() {
        botView.backgroundColor = .white
        view.addSubview(botView)
        botView.snp.makeConstraints { make in
            make.height.equalToSuperview().multipliedBy(0.24)
            make.centerX.equalToSuperview()
            make.bottom.leading.trailing.equalToSuperview().inset(0)
        }
        
        fileImageView = UIImageView(image: fileImage)
        botView.addSubview(fileImageView)
        fileImageView.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(31)
            make.leading.equalToSuperview().inset(view.frame.width * 0.109)
        }
        
        blockLabel.backgroundColor = .clear
        blockLabel.textColor = UIColor(red: 0.183, green: 0.183, blue: 0.183, alpha: 1)
        blockLabel.font = UIFont(name: "Roboto-Medium", size: 16)
        blockLabel.text = "Block rules"
        
        rusesLabel.backgroundColor = .clear
        rusesLabel.textColor = UIColor(red: 0.345, green: 0.452, blue: 0.486, alpha: 1)
        rusesLabel.font = UIFont(name: "Roboto-Regular", size: 14)
        rusesLabel.text = "0 Ruses Active"
        
        botStack.spacing = 1
        botStack.axis = .vertical
        botStack.distribution = .fillEqually
        botStack.addArrangedSubview(blockLabel)
        botStack.addArrangedSubview(rusesLabel)
        botView.addSubview(botStack)
        botStack.snp.makeConstraints { make in
            make.centerY.equalTo(fileImageView.snp.centerY)
            make.leading.equalTo(fileImageView.snp.trailing).offset(5)
        }
        arrowImageView = UIImageView(image: arrowImage)
        botView.addSubview(arrowImageView)
        arrowImageView.snp.makeConstraints { make in
            make.centerY.equalTo(fileImageView.snp.centerY)
            make.trailing.equalToSuperview().inset(view.frame.width * 0.109)
        }
        
        horLineImageView = UIImageView(image: horLineImage)
        botView.addSubview(horLineImageView)
        horLineImageView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().inset(30)
        }
        
        
        switchView.backgroundColor = .clear
        switchView.isUserInteractionEnabled = true
        let switchGuester = UITapGestureRecognizer(target: self, action: #selector(switchGesture))
        switchView.addGestureRecognizer(switchGuester)
        botView.addSubview(switchView)
        switchView.snp.makeConstraints { make in
            make.centerY.equalTo(fileImageView.snp.centerY)
            make.leading.trailing.equalToSuperview().inset(view.frame.width * 0.109)
            make.height.equalTo(45)
        }
    }
    @objc func switchGesture() {
        navigationController?.pushViewController(AdblockRulesViewController(), animated: true)
    }
  
}



