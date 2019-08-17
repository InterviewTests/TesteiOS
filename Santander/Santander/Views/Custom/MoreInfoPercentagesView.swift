//
//  MoreInfoPercentagesView.swift
//  Santander
//
//  Created by Orlando Amorim on 14/08/19.
//

import UIKit
import SnapKit

class MoreInfoPercentagesView: UIView {
    
    let moreInfo: Investment.Funds.Response.Screen.MoreInfo
    
    init(moreInfo: Investment.Funds.Response.Screen.MoreInfo, frame: CGRect = .zero) {
        self.moreInfo = moreInfo
        super.init(frame: frame)
        setupView()
        makeView()
    }
    
    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        isUserInteractionEnabled = true
        backgroundColor = .white
    }
}

// MARK: - Factory
extension MoreInfoPercentagesView {
    
    private func makeView() {
        let header = makeHeader()
        addSubview(header)
        header.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
            make.height.equalTo(32.0)
        }
        
        var lastPercentagesView: UIView?
        let allCases = Investment.Funds.Response.Screen.MoreInfo.CodingKeys.allCases
        allCases.forEach { key in
            let percentagesView = makePercentagesView(with: key, percentages: moreInfo.value(for: key))
            addSubview(percentagesView)
            percentagesView.snp.makeConstraints { make in
                if let lastPercentagesView = lastPercentagesView {
                    make.top.equalTo(lastPercentagesView.snp.bottom)
                } else {
                    make.top.equalTo(header.snp.bottom).inset(-2.0)
                }
                make.leading.trailing.equalToSuperview()
                make.height.equalTo(32.0)
                if let last = allCases.last, last == key {
                    make.bottom.equalToSuperview()
                }
            }
            lastPercentagesView = percentagesView
        }
    }
    
    private func makeHeader() -> UIView {
        let headerView = UIView()

        let cdiTitleLabel = makeTitleLabel(with: "CDI", textAlignment: .right)
        headerView.addSubview(cdiTitleLabel)
        cdiTitleLabel.snp.makeConstraints { make in
            make.trailing.equalToSuperview()
            make.centerY.equalToSuperview()
            make.height.equalTo(32.0)
        }
        
        let fundTitleLabel = makeTitleLabel(with: "Fundo", textAlignment: .right)
        headerView.addSubview(fundTitleLabel)
        fundTitleLabel.snp.makeConstraints { make in
            make.trailing.equalToSuperview().inset(102.0)
            make.centerY.equalToSuperview()
            make.height.equalTo(32.0)
        }
        return headerView
    }
    
    private func makePercentagesView(with key: Investment.Funds.Response.Screen.MoreInfo.CodingKeys, percentages: Investment.Funds.Response.Screen.MoreInfo.Percentages) -> UIView {
        let percentageView = UIView()
        
        let titleLabel = makeTitleLabel(with: Investment.Funds.Response.Screen.MoreInfo.title(for: key), textAlignment: .left)
        percentageView.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.centerY.equalToSuperview()
            make.height.equalTo(32.0)
        }
        
        let cdiValueLabel = makeValueLabel(with: "\(percentages.cdi)%", textAlignment: .right)
        percentageView.addSubview(cdiValueLabel)
        cdiValueLabel.snp.makeConstraints { make in
            make.trailing.equalToSuperview()
            make.centerY.equalToSuperview()
            make.height.equalTo(32.0)
        }
        
        let fundValueLabel = makeValueLabel(with: "\(percentages.fund)%", textAlignment: .right)
        percentageView.addSubview(fundValueLabel)
        fundValueLabel.snp.makeConstraints { make in
            make.trailing.equalToSuperview().inset(102.0)
            make.centerY.equalToSuperview()
            make.height.equalTo(32.0)
        }
        
        return percentageView
    }

    private func makeTitleLabel(with text: String, textAlignment: NSTextAlignment = .left) -> UILabel {
        let label = UILabel()
        label.text = text
        label.font = UIFont.santander(type: .regular, with: 14.0)
        label.textColor = UIColor.Santander.silverChalice
        label.textAlignment = textAlignment
        return label
    }
    
    private func makeValueLabel(with text: String, textAlignment: NSTextAlignment = .right) -> UILabel {
        let label = UILabel()
        label.text = text
        label.font = UIFont.santander(type: .regular, with: 14.0)
        label.textColor = UIColor.Santander.mineShaft
        label.textAlignment = textAlignment
        return label
    }
}
