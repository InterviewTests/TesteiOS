//
//  InvestmentRiskView.swift
//  Teste Santander
//
//  Created by Eduardo Alves Sumiya on 27/04/20.
//  Copyright © 2020 Eduardo Alves Sumiya. All rights reserved.
//

import UIKit

@IBDesignable
class InvestmentRiskView: UIView {
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var stackIconIndicator: UIStackView!
    @IBOutlet weak var stackGraduation: UIStackView!
    @IBOutlet weak var viewGraduation: UIView!
    
    let colors = [#colorLiteral(red: 0.4550000131, green: 0.8550000191, blue: 0.3799999952, alpha: 1), #colorLiteral(red: 0.2899999917, green: 0.7570000291, blue: 0.423999995, alpha: 1), #colorLiteral(red: 1, green: 0.753000021, blue: 0.06700000167, alpha: 1), #colorLiteral(red: 1, green: 0.4550000131, blue: 0.172999993, alpha: 1), #colorLiteral(red: 1, green: 0.2119999975, blue: 0.2039999962, alpha: 1)]
    
    
    // MARK: - Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        initNib()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initNib()

    }
    
    override func awakeFromNib() {
        super .awakeFromNib()
        
        configureUI()
        setup(graduationRisk: .lightGreen)
    }
    
    // MARK: - PrivateMethods
    fileprivate func initNib() {
        let bundle = Bundle(for: InvestmentRiskView.self)
        bundle.loadNibNamed(String(describing: InvestmentRiskView.self), owner: self, options: nil)
        addSubview(containerView)
        containerView.frame = bounds
        containerView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
    }
    
    fileprivate func configureUI() {
        for index in (0...(colors.count - 1)) {
            let view = UIView()
            view.backgroundColor = colors[index]
            view.layer.borderWidth = 1
            view.layer.borderColor = UIColor.white.cgColor
            
            stackGraduation.addArrangedSubview(view)
        }
        
        viewGraduation.layer.cornerRadius = (viewGraduation.frame.height/2)
        viewGraduation.layer.masksToBounds = true
    }
    
    func setup(graduationRisk: GraduationColorsEnum) {
        for index in (0...(colors.count - 1)) {
            let imageIndicator = UIImageView()
            let selectedView = stackGraduation.arrangedSubviews[index]
            stackIconIndicator.addArrangedSubview(imageIndicator)
            
            if index == graduationRisk.rawValue {
                let image = UIImage(named: "ArrowDown")
                imageIndicator.image = image?.scaleToSize(aSize: CGSize(width: 26, height: 16))
                imageIndicator.contentMode = .center
                
                selectedView.topAnchor.constraint(equalTo: stackGraduation.topAnchor).isActive = true
                
            } else {
                selectedView.topAnchor.constraint(equalTo: stackGraduation.topAnchor, constant: 3).isActive = true
            }
        }
    }
}
