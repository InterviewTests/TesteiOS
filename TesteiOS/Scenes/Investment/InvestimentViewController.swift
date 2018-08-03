//
//  ViewController.swift
//  TesteiOS
//
//  Created by Dafle Cardoso on 02/08/2018.
//  Copyright © 2018 Dafle Cardoso. All rights reserved.
//

import UIKit
import SafariServices

class InvestimentViewController: BaseViewController {
    
    let font = UIFont(name: "DINPro-Regular", size: 15.0)
    let scrollView = UIScrollView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        RestAPI.fetchGenericObject(endPoint: "fund.json", onComplete: { (response: InvestimentResponse) in
            
            DispatchQueue.main.async {
                self.buildLayout(response)
            }
            
        }) { (apiError) in
            
            self.showAlert(title: "Atenção", message: self.getFormatedError(apiError))
        }
    }
    
    func buildLayout(_ response:InvestimentResponse) {
        
        let screen:Screen = response.screen
        
        view.addSubview(scrollView)
        scrollView.showsVerticalScrollIndicator = false
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        scrollView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        scrollView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        let lbTitle = UILabel()
        scrollView.addSubview(lbTitle)
        lbTitle.font = font
        lbTitle.textAlignment = .center
        lbTitle.text = "Investimento"
        lbTitle.numberOfLines = 0
        lbTitle.lineBreakMode = .byWordWrapping
        lbTitle.translatesAutoresizingMaskIntoConstraints = false
        lbTitle.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        lbTitle.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 30).isActive = true
        lbTitle.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 40).isActive = true
        lbTitle.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -40).isActive = true
        
        let ivShare = UIImageView(image: #imageLiteral(resourceName: "upload"))
        scrollView.addSubview(ivShare)
        ivShare.translatesAutoresizingMaskIntoConstraints = false
        ivShare.centerYAnchor.constraint(equalTo: lbTitle.centerYAnchor).isActive = true
        ivShare.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -30).isActive = true
        ivShare.widthAnchor.constraint(equalToConstant: 30).isActive = true
        ivShare.heightAnchor.constraint(equalToConstant: 30).isActive = true

        let title = UILabel()
        scrollView.addSubview(title)
        title.font = font
        title.textAlignment = .center
        title.textColor = .gray
        title.text = screen.title
        title.numberOfLines = 0
        title.lineBreakMode = .byWordWrapping
        title.translatesAutoresizingMaskIntoConstraints = false
        title.topAnchor.constraint(equalTo: lbTitle.bottomAnchor, constant: 30).isActive = true
        title.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 40).isActive = true
        title.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -40).isActive = true
        
        let fundName = UILabel()
        scrollView.addSubview(fundName)
        fundName.font = UIFont(name: "DINPro-Regular", size: 30.0)
        fundName.textAlignment = .center
        fundName.numberOfLines = 0
        fundName.lineBreakMode = .byWordWrapping
        fundName.text = screen.fundName
        fundName.numberOfLines = 0
        fundName.translatesAutoresizingMaskIntoConstraints = false
        fundName.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 10).isActive = true
        fundName.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 40).isActive = true
        fundName.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -40).isActive = true
        
        let whatIs = UILabel()
        scrollView.addSubview(whatIs)
        whatIs.font = UIFont(name: "DINPro-Regular", size: 17.0)
        whatIs.textAlignment = .center
        whatIs.numberOfLines = 0
        whatIs.lineBreakMode = .byWordWrapping
        whatIs.textColor = .darkGray
        whatIs.text = screen.whatIs
        whatIs.translatesAutoresizingMaskIntoConstraints = false
        whatIs.topAnchor.constraint(equalTo: fundName.bottomAnchor, constant: 40).isActive = true
        whatIs.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 40).isActive = true
        whatIs.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -40).isActive = true

        let definition = UILabel()
        scrollView.addSubview(definition)
        definition.font = font
        definition.textAlignment = .center
        definition.textColor = .gray
        definition.numberOfLines = 0
        definition.text = screen.definition
        definition.lineBreakMode = .byWordWrapping
        definition.translatesAutoresizingMaskIntoConstraints = false
        definition.topAnchor.constraint(equalTo: whatIs.bottomAnchor).isActive = true
        definition.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 40).isActive = true
        definition.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -40).isActive = true
        
        let riskTitle = UILabel()
        scrollView.addSubview(riskTitle)
        riskTitle.font = UIFont(name: "DINPro-Regular", size: 17.0)
        riskTitle.textAlignment = .center
        riskTitle.textColor = .darkGray
        riskTitle.numberOfLines = 0
        riskTitle.text = screen.riskTitle
        riskTitle.lineBreakMode = .byWordWrapping
        riskTitle.translatesAutoresizingMaskIntoConstraints = false
        riskTitle.topAnchor.constraint(equalTo: definition.bottomAnchor, constant: 50).isActive = true
        riskTitle.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 40).isActive = true
        riskTitle.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -40).isActive = true
        
        let stackView = buildBarInvestmentRisk(risk: screen.risk)
        scrollView.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.topAnchor.constraint(equalTo: riskTitle.bottomAnchor, constant: 30).isActive = true
        stackView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 40).isActive = true
        stackView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -40).isActive = true
       
        let infoTitle = UILabel()
        scrollView.addSubview(infoTitle)
        infoTitle.font = UIFont(name: "DINPro-Regular", size: 17.0)
        infoTitle.textAlignment = .center
        infoTitle.textColor = .darkGray
        infoTitle.numberOfLines = 0
        infoTitle.text = screen.infoTitle
        infoTitle.lineBreakMode = .byWordWrapping
        infoTitle.translatesAutoresizingMaskIntoConstraints = false
        infoTitle.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 40).isActive = true
        infoTitle.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 40).isActive = true
        infoTitle.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -40).isActive = true
        
        let stackMoreInfo = builLayoutMoreInfo(moreInfo: screen.moreInfo)
        scrollView.addSubview(stackMoreInfo)
        stackMoreInfo.translatesAutoresizingMaskIntoConstraints = false
        stackMoreInfo.topAnchor.constraint(equalTo: infoTitle.bottomAnchor, constant: 40).isActive = true
        stackMoreInfo.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30).isActive = true
        stackMoreInfo.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -30).isActive = true
        
        let viewDivider = UIView()
        scrollView.addSubview(viewDivider)
        viewDivider.backgroundColor = .lightGray
        viewDivider.translatesAutoresizingMaskIntoConstraints = false
        viewDivider.topAnchor.constraint(equalTo: stackMoreInfo.bottomAnchor, constant: 40).isActive = true
        viewDivider.heightAnchor.constraint(equalToConstant: 0.5).isActive = true
        viewDivider.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30).isActive = true
        viewDivider.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -30).isActive = true
        
        let stackInfo = buildLayoutStackAndDownInfo(infos: screen.info + screen.downInfo)
        scrollView.addSubview(stackInfo)
        stackInfo.translatesAutoresizingMaskIntoConstraints = false
        stackInfo.topAnchor.constraint(equalTo: viewDivider.bottomAnchor, constant: 40).isActive = true
        stackInfo.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30).isActive = true
        stackInfo.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -30).isActive = true
        
        let btInvestir = UIButton()
        scrollView.addSubview(btInvestir)
        btInvestir.setTitle("Investir", for: .normal)
        btInvestir.backgroundColor = .red
        btInvestir.translatesAutoresizingMaskIntoConstraints = false
        btInvestir.layer.cornerRadius = 20
        btInvestir.clipsToBounds = true
        btInvestir.titleLabel?.font = font
        btInvestir.addTarget(self, action: #selector(actionInvestir), for: .touchUpInside)
        btInvestir.heightAnchor.constraint(equalToConstant: 50.0).isActive = true
        btInvestir.topAnchor.constraint(equalTo: stackInfo.bottomAnchor, constant: 40).isActive = true
        btInvestir.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30).isActive = true
        btInvestir.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -30).isActive = true
        btInvestir.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -40).isActive = true
    }
    
    @objc func actionInvestir() {
        
        print("Clicou investir")
    }
    
    func buildBarInvestmentRisk(risk:Int) -> UIStackView {
        
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.spacing = 1.0
        stackView.alignment = .center
        
        let colors = [
            UIColor(red: 96/255, green: 222/255, blue: 102/255, alpha: 1.0),
            UIColor(red: 23/255, green: 194/255, blue: 106/255, alpha: 1.0),
            UIColor(red: 252/255, green: 189/255, blue: 32/255, alpha: 1.0),
            UIColor(red: 251/255, green: 110/255, blue: 49/255, alpha: 1.0),
            UIColor(red: 252/255, green: 25/255, blue: 46/255, alpha: 1.0)
        ]
        
        let margins = 80
        let quantityRisk = colors.count
        let widthRisk = view.frame.size.width - CGFloat(margins) / CGFloat(quantityRisk)
        
        for i in 1...quantityRisk {
            
            let stackY = UIStackView()
            stackY.axis = .vertical
            stackY.distribution = .equalSpacing
            stackY.alignment = .center
            stackY.spacing = 2.0
            
            let image = risk == i ? UIImageView(image: #imageLiteral(resourceName: "down-arrow")) : UIImageView()
            image.topAnchor.constraint(equalTo: stackY.topAnchor)
            image.widthAnchor.constraint(equalToConstant: 15).isActive = true
            image.heightAnchor.constraint(equalToConstant: 15).isActive = true
            
            let viewIndicator = UIView()
            viewIndicator.topAnchor.constraint(equalTo: image.topAnchor)
            viewIndicator.widthAnchor.constraint(equalToConstant: widthRisk).isActive = true
            viewIndicator.heightAnchor.constraint(equalToConstant: risk == i ? 8 : 5).isActive = true
            viewIndicator.backgroundColor = colors[i-1]
            
            stackY.addArrangedSubview(image)
            stackY.addArrangedSubview(viewIndicator)
            
            stackView.addArrangedSubview(stackY)
        }
        
        return stackView
    }
    
    func builLayoutMoreInfo(moreInfo: MoreInfo) -> UIStackView {
        
        let stackMoreInfo = UIStackView()
        stackMoreInfo.axis = .vertical
        stackMoreInfo.distribution = .equalSpacing
        stackMoreInfo.spacing = 16.0
        
        let data = [
        
            [nil, "Fundo", "CDI"],
            ["No mês", moreInfo.month.fund.toPerc(), moreInfo.month.CDI.toPerc()],
            ["No Ano", moreInfo.year.fund.toPerc(), moreInfo.year.CDI.toPerc()],
            ["12 meses", moreInfo.months12.fund.toPerc(), moreInfo.months12.CDI.toPerc()]
        ]
        
        for i in 0..<data.count {
            
            let stackX = UIStackView()
            stackX.axis = .horizontal
            stackX.distribution = .fillEqually
            
            for j in 0..<3 {
                
                let label = UILabel()
                label.text = data[i][j]
                label.font = font
                label.textColor = i != 0 && (j==1 || j==2) ? .black : .gray
                label.textAlignment = j==0 ? .left : .right
                
                stackX.addArrangedSubview(label)
            }
            
            stackMoreInfo.addArrangedSubview(stackX)
        }
        
        return stackMoreInfo
    }
    
    func buildLayoutStackAndDownInfo(infos:[Info]) -> UIStackView {
        
        let stackInfo = UIStackView()
        stackInfo.axis = .vertical
        stackInfo.distribution = .equalSpacing
        stackInfo.spacing = 16.0
        
        for i in 0..<infos.count {
            
            let stackX = UIStackView()
            stackX.axis = .horizontal
            stackX.distribution = .fill
            
            let info = infos[i]
            
            for j in 0..<2 {
                
                let touchUp = UITapGestureRecognizer(target: self, action: #selector(downloadInfo))
                
                if info.data == nil && j == 1 {
                    
                    let image = UIImageView(image: #imageLiteral(resourceName: "download"))
                    image.widthAnchor.constraint(equalToConstant: 15).isActive = true
                    image.heightAnchor.constraint(equalToConstant: 15).isActive = true
                    image.isUserInteractionEnabled = true
                    image.addGestureRecognizer(touchUp)
                    stackX.addArrangedSubview(image)
                }
                    
                let label = UILabel()
                label.text = j==0 ? info.name : info.data ?? "  Baixar"
                label.font = font
                label.textColor = j==0 ? .gray : .black
                label.textColor = info.data == nil && j == 1 ? .red : label.textColor
                label.textAlignment = j==0 ? .left : .right
                if label.text! == "  Baixar" {
                    
                    label.isUserInteractionEnabled = true
                    label.addGestureRecognizer(touchUp)
                    print("Adicionei")
                } else {
                    print("Fodeoo")
                }
                stackX.addArrangedSubview(label)
            }
            
            stackInfo.addArrangedSubview(stackX)
        }
        return stackInfo
    }
    
    @objc func downloadInfo(sender: UITapGestureRecognizer) {
        
        let safariVc = SFSafariViewController(url: URL(string: "https://google.com")!)
        present(safariVc, animated: true, completion: nil)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        scrollView.setContentOffset(CGPoint(x: 0, y: -20), animated: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

extension Double {
    
    func toPerc() -> String {
        return "\(self)%"
    }
}









