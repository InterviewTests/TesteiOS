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
    // MARK: - Properties
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var stackIconIndicator: UIStackView!
    @IBOutlet weak var stackGraduation: UIStackView!
    @IBOutlet weak var viewGraduation: UIView!
    
    // MARK: - Constants
    fileprivate let colors = [ColorUtils.investment100, ColorUtils.investment80, ColorUtils.investment60, ColorUtils.investment40, ColorUtils.investment20]
    
    // MARK: - Initialization
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        initNib()
    }
    
    override init(frame: CGRect) {
        super .init(frame: frame)
        
        initNib()
    }
    
    // MARK: - Lifecycle
    override func awakeFromNib() {
        super .awakeFromNib()
        
        configureUI()
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
    
    // MARK: - Public Methods
    func setup(graduationRisk: GraduationColorsEnum) {
        for index in (0...(colors.count - 1)) {
            let imageIndicator = UIImageView()
            let selectedView = stackGraduation.arrangedSubviews[index]
            
            stackIconIndicator.addArrangedSubview(imageIndicator)
            
            if index == graduationRisk.rawValue {
                imageIndicator.image = UIImage(named: "ArrowDown")?.scaleToSize(aSize: CGSize(width: 26, height: 16))
                imageIndicator.contentMode = .center
                
                selectedView.topAnchor.constraint(equalTo: stackGraduation.topAnchor).isActive = true
            } else {
                selectedView.topAnchor.constraint(equalTo: stackGraduation.topAnchor, constant: 3).isActive = true
            }
        }
    }
}
