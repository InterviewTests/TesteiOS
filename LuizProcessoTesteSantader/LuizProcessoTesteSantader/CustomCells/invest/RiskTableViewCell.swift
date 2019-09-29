//
//  RiskTableViewCell.swift
//  LuizProcessoTesteSantader
//
//  Created by Luiz Otavio Processo on 28/09/19.
//  Copyright © 2019 Luiz Otavio Processo. All rights reserved.
//

import UIKit

class RiskTableViewCell: UITableViewCell {

    
    static let identifier = "RiskTableViewCell"
    
    var whatIs = UILabel()
    var descript = UILabel()
    var risk = UILabel()
    
    var arrowImgArray:[UIImageView] = [UIImageView(),UIImageView(),UIImageView(),UIImageView(),UIImageView()]
    var colorImgArray:[UIImageView] = [UIImageView(),UIImageView(),UIImageView(),UIImageView(),UIImageView()]
    
    var arrowView = UIView()
    var colorView = UIView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setImgArray()
        setElementsLayout()
        setUpView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpView(){
        
        let cellWidth = self.contentView.frame.size.width
        let cellHeight = self.contentView.frame.size.height
        
        contentView.addSubview(whatIs)
        contentView.addSubview(descript)
        contentView.addSubview(risk)
        contentView.addSubview(arrowView)
        contentView.addSubview(colorView)
        for i in 0 ..< arrowImgArray.count{
            arrowView.addSubview(arrowImgArray[i])
            colorView.addSubview(colorImgArray[i])
        }
        
        whatIs.centerXAnchor.constraint(equalTo: self.contentView.centerXAnchor).isActive = true
        descript.centerXAnchor.constraint(equalTo: self.contentView.centerXAnchor).isActive = true
        risk.centerXAnchor.constraint(equalTo: self.contentView.centerXAnchor).isActive = true
        arrowView.centerXAnchor.constraint(equalTo: self.contentView.centerXAnchor).isActive = true
        colorView.centerXAnchor.constraint(equalTo: self.contentView.centerXAnchor).isActive = true
        
        contentView.setUpContraint(pattern: "V:|-20-[v0(\(cellHeight/5))]-10-[v1(\(cellHeight*1.5))]-15-[v2(\(cellHeight/3))]-15-[v3(\(cellHeight/10))]-10-[v4(\(cellHeight/10))]", views: whatIs,descript,risk,arrowView,colorView)
        contentView.setUpContraint(pattern: "H:[v0(\(cellWidth))]", views: whatIs)
        contentView.setUpContraint(pattern: "H:[v0(\(cellWidth))]", views: descript)
        contentView.setUpContraint(pattern: "H:[v0(\(cellWidth))]", views: risk)
        contentView.setUpContraint(pattern: "H:[v0(\(cellWidth))]", views: arrowView)
        contentView.setUpContraint(pattern: "H:[v0(\(cellWidth))]", views: colorView)
        
        arrowView.setUpContraint(pattern: "H:|[v0(\(cellWidth/5))][v1(\(cellWidth/5))][v2(\(cellWidth/5))][v3(\(cellWidth/5))][v4(\(cellWidth/5))]", views: arrowImgArray[0],arrowImgArray[1],arrowImgArray[2],arrowImgArray[3],arrowImgArray[4])
        arrowView.setUpContraint(pattern: "V:[v0(10)]", views: arrowImgArray[0])
        arrowView.setUpContraint(pattern: "V:[v0(10)]", views: arrowImgArray[1])
        arrowView.setUpContraint(pattern: "V:[v0(10)]", views: arrowImgArray[2])
        arrowView.setUpContraint(pattern: "V:[v0(10)]", views: arrowImgArray[3])
        arrowView.setUpContraint(pattern: "V:[v0(10)]", views: arrowImgArray[4])
        
        
        colorView.setUpContraint(pattern: "H:|[v0(\(cellWidth/5))][v1(\(cellWidth/5))][v2(\(cellWidth/5))][v3(\(cellWidth/5))][v4(\(cellWidth/5))]", views: colorImgArray[0],colorImgArray[1],colorImgArray[2],colorImgArray[3],colorImgArray[4])
        colorView.setUpContraint(pattern: "V:|-2-[v0(10)]", views: colorImgArray[0])
        colorView.setUpContraint(pattern: "V:|-2-[v0(10)]", views: colorImgArray[1])
        colorView.setUpContraint(pattern: "V:|-2-[v0(10)]", views: colorImgArray[2])
        colorView.setUpContraint(pattern: "V:|[v0(15)]", views: colorImgArray[3])
        colorView.setUpContraint(pattern: "V:|-2-[v0(10)]", views: colorImgArray[4])
        
    }
    
    func setElementsLayout(){
        
        whatIs.textAlignment = .center
        whatIs.textColor = .darkGray
        whatIs.font = UIFont(name: "HelveticaNeue-Light", size: 18)
        
        descript.textAlignment = .center
        descript.textColor = .darkGray
        descript.numberOfLines = 3
        descript.font = UIFont(name: "HelveticaNeue-Thin", size: 15)
        
        risk.textAlignment = .center
        risk.textColor = .darkGray
        risk.font = UIFont(name: "HelveticaNeue-Light", size: 18)
        
        let bottomBorder = CALayer()
        bottomBorder.backgroundColor = UIColor.lightGray.cgColor
        bottomBorder.frame = CGRect(x: 0, y: -20, width: self.contentView.frame.width, height: 1)
        whatIs.layer.addSublayer(bottomBorder)
        
        
    }
    
    func setImgArray(){
        for i in 0 ..< arrowImgArray.count{
            arrowImgArray[i].contentMode = .scaleAspectFit
            colorImgArray[i].contentMode = .scaleAspectFit
        }
        arrowImgArray[3].image = UIImage(named: "Shape")
        colorImgArray[0].backgroundColor = .appLightGreen
        colorImgArray[1].backgroundColor = .appGreen
        colorImgArray[2].backgroundColor = .appYellow
        colorImgArray[3].backgroundColor = .appOrange
        colorImgArray[4].backgroundColor = .appRiskRed
        
    }
}
