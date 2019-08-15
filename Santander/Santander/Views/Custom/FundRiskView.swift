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
    
    enum RiskLevel: Int, CaseIterable {
        
        case one = 1
        case two = 2
        case three = 3
        case four = 4
        case five = 5
        
        var color: UIColor {
            switch self {
            case .one:
                return UIColor.Santander.pastelGreen
            case .two:
                return UIColor.Santander.emerald
            case .three:
                return UIColor.Santander.lightningYellow
            case .four:
                return UIColor.Santander.burningOrange
            case .five:
                return UIColor.Santander.redOrange
            }
        }
    }
    
    let riskLevel: RiskLevel
    
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
    
    init(text: String, riskLevel: RiskLevel, frame: CGRect = .zero) {
        self.riskLevel = riskLevel
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
        RiskLevel.allCases.forEach { riskLevel in
            let riskView = makeRiskView(for: riskLevel)
            stackView.addArrangedSubview(riskView)
            riskView.snp.makeConstraints { make in
                if self.riskLevel == riskLevel {
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
        let riskLevelWidth = frame.size.width / CGFloat(RiskLevel.allCases.count)
        let middleRiskLevelWidth = riskLevelWidth / CGFloat(2)
        let arrowPosition = ((riskLevelWidth * CGFloat(riskLevel.rawValue)) - middleRiskLevelWidth) - arrowMiddleWidth
        arrowLeadingConstraint?.update(inset: arrowPosition)
    }
}

// MARK: - Factory
extension FundRiskView {
    private func makeRiskView(for type: RiskLevel) -> UIView {
        let view = UIView()
        view.tag = type.rawValue
        view.backgroundColor = type.color
        
        let radius: CGFloat = type == self.riskLevel ? 5.0 : 3.0
        if type == .one {
            if #available(iOS 11.0, *) {
                view.round(corners: [.layerMinXMinYCorner, .layerMinXMaxYCorner], radius: radius)
            } else {
                view.round(corners: [.bottomLeft, .topLeft], radius: radius)
            }
        }
        if type == .five {
            if #available(iOS 11.0, *) {
                view.round(corners: [.layerMaxXMaxYCorner, .layerMaxXMinYCorner], radius: radius)
            } else {
                view.round(corners: [.topRight, .bottomRight], radius: radius)
            }
        }
        return view
    }
}
