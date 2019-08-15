//
//  FundRiskView.swift
//  Santander
//
//  Created by Orlando Amorim on 14/08/19.
//

import UIKit
import SnapKit

class FundRiskView: UIView {
    
    static let arrowWidth: CGFloat = 13.0
        
    let risk: Funds.Risk
    
    var textLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.santander(type: .medium, with: 16.0)
        label.textColor = UIColor.Santander.gray
        label.textAlignment = .center
        return label
    }()
    
    var arrowImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "arrow-icon"))
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .bottom
        stackView.distribution = .fillEqually
        stackView.spacing = 1
        return stackView
    }()
    
    var arrowLeadingConstraint: Constraint?
    
    init(text: String, risk: Funds.Risk, frame: CGRect = .zero) {
        self.risk = risk
        super.init(frame: frame)
        textLabel.text = text
        setupView()
    }
    
    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        addTextLabel()
        addStackView()
        addArrowImageView()
        setupArrow()
        setupRiskLevel()
    }
    
    private func addTextLabel() {
        addSubview(textLabel)
        textLabel.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
            make.height.equalTo(34.0)
        }
    }
    
    private func addArrowImageView() {
        addSubview(arrowImageView)
        arrowImageView.snp.makeConstraints { make in
            make.top.equalTo(textLabel.snp.bottom).offset(15.5)
            make.height.equalTo(8.0)
            make.width.equalTo(FundRiskView.arrowWidth)
            arrowLeadingConstraint = make.leading.equalToSuperview().inset(0.0).constraint
            make.bottom.equalTo(stackView.snp.top).offset(-6.5)
        }
    }
    
    private func addStackView() {
        addSubview(stackView)
        stackView.snp.makeConstraints { make in
            make.height.equalTo(10.0)
            make.bottom.leading.trailing.equalToSuperview()
        }
    }
    
    private func setupRiskLevel() {
        stackView.removeAllArrangedSubviews()
        Funds.Risk.allCases.forEach { risk in
            let riskView = makeRiskView(for: risk)
            stackView.addArrangedSubview(riskView)
            riskView.snp.makeConstraints { make in
                if self.risk == risk {
                    make.top.equalToSuperview()
                    make.bottom.equalTo(self.snp.bottom)
                } else {
                    make.bottom.equalTo(self.snp.bottom).inset(1.0)
                    make.height.equalTo(6.0)
                }
            }
        }
    }
    
    private func setupArrow() {
        let arrowMiddleWidth = FundRiskView.arrowWidth / 2
        let riskLevelWidth = frame.size.width / CGFloat(Funds.Risk.allCases.count)
        let middleRiskLevelWidth = riskLevelWidth / CGFloat(2)
        let arrowPosition = ((riskLevelWidth * CGFloat(risk.rawValue)) - middleRiskLevelWidth) - arrowMiddleWidth
        arrowLeadingConstraint?.update(inset: arrowPosition)
    }
}

// MARK: - Factory
extension FundRiskView {
    private func makeRiskView(for risk: Funds.Risk) -> UIView {
        let view = UIView()
        view.tag = risk.rawValue
        view.backgroundColor = risk.color
        
        let radius: CGFloat = risk == self.risk ? 5.0 : 3.0
        if risk == .one {
            if #available(iOS 11.0, *) {
                view.round(corners: [.layerMinXMinYCorner, .layerMinXMaxYCorner], radius: radius)
            } else {
                view.round(corners: [.bottomLeft, .topLeft], radius: radius)
            }
        }
        if risk == .five {
            if #available(iOS 11.0, *) {
                view.round(corners: [.layerMaxXMaxYCorner, .layerMaxXMinYCorner], radius: radius)
            } else {
                view.round(corners: [.topRight, .bottomRight], radius: radius)
            }
        }
        return view
    }
}
