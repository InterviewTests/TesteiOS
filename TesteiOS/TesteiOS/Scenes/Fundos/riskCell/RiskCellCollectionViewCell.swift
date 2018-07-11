//
//  RiskCellCollectionViewCell.swift
//  TesteiOS
//
//  Created by lucas.eiji.saito on 03/07/18.
//  Copyright © 2018 Accenture. All rights reserved.
//

import UIKit

enum RiskColor {
    case r1
    case r2
    case r3
    case r4
    case r5
}

extension RiskColor: RawRepresentable {
    typealias RawValue = UIColor
    
    init?(rawValue: RawValue) {
        switch rawValue {
        case RiskColor.getR1(): self = .r1
        case RiskColor.getR2(): self = .r2
        case RiskColor.getR3(): self = .r3
        case RiskColor.getR4(): self = .r4
        case RiskColor.getR5(): self = .r5
        default: return nil
        }
    }
    
    var rawValue: RawValue {
        switch self {
        case .r1: return RiskColor.getR1()
        case .r2: return RiskColor.getR2()
        case .r3: return RiskColor.getR3()
        case .r4: return RiskColor.getR4()
        case .r5: return RiskColor.getR5()
        }
    }
    
    static func getR1() -> UIColor { //verde claro
        return UIColor(red: 141.0/255.0, green: 217.0/255.0, blue: 105.0/255.0, alpha: 1.0)
    }
    static func getR2() -> UIColor { //verde escuro
        return UIColor(red: 106.0/255.0, green: 190.0/255.0, blue: 114.0/255.0, alpha: 1.0)
    }
    static func getR3() -> UIColor { //amarelo
        return UIColor(red: 245.0/255.0, green: 194.0/255.0, blue: 66.0/255.0, alpha: 1.0)
    }
    static func getR4() -> UIColor { //laranja
        return UIColor(red: 238.0/255.0, green: 124.0/255.0, blue: 55.0/255.0, alpha: 1.0)
    }
    static func getR5() -> UIColor { //vermelho
        return UIColor(red: 235.0/255.0, green: 71.0/255.0, blue: 56.0/255.0, alpha: 1.0)
    }
}

class RiskCellCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var colorView: UIView!
    @IBOutlet weak var riskSelect: UIImageView!
    
    var viewModel: ViewModel = ViewModel() {
        didSet {
            didSetViewModel()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        setRiskSelect()
        roundRiskCorners()
    }
    
    func didSetViewModel() {
        colorView.backgroundColor = viewModel.riskColor.rawValue
        riskSelect.isHidden = !viewModel.isRiskSelect
    }
    
    func setRiskSelect() {
        //aumentar o tamanho da view risk da cor selecionada
        if (viewModel.isRiskSelect) {
            for constraint in colorView.constraints {
                if constraint.identifier == "constraintColorViewHeight" {
                    constraint.constant *= 1.4
                    colorView.frame.size.height = constraint.constant
                }
            }
            colorView.layoutIfNeeded()
        }
    }
    
    func roundRiskCorners() {
        //arredondar os cantos das views das pontas (r1 e r5)
        if (viewModel.riskColor == RiskColor.r1) {
            colorView.roundCorners([.topLeft, .bottomLeft], radius: 2.5)
        } else if (viewModel.riskColor == RiskColor.r5) {
            colorView.roundCorners([.topRight, .bottomRight], radius: 2.5)
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
//        roundRiskCorners()
    }
}

extension UIView {
    func roundCorners(_ corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        self.layer.mask = mask
    }
}

extension RiskCellCollectionViewCell {
    struct ViewModel {
        var riskColor: RiskColor = RiskColor.r1
        var isRiskSelect: Bool = false
    }
}

