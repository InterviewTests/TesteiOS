//
//  InvestmentViewController.swift
//  SantanderTesteiOS
//
//  Created by Diego Costa on 22/09/18.
//  Copyright © 2018 Diego Costa. All rights reserved.
//

import UIKit

protocol InvestmentDisplayScreen : class {
    func showViewModel(viewModel : InvestmentModels.Screen.ViewModel)
}

class InvestmentViewController: LayoutVerticalViewController, InvestmentDisplayScreen {
    private var titleView       : SantanderLabelView = SantanderLabelView(fontSize: 16, textColor : #colorLiteral(red: 0.4941176471, green: 0.4941176471, blue: 0.4941176471, alpha: 1))
    private var fundView        : SantanderLabelView = SantanderLabelView(fontSize: 32, textColor:  #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1))
    private var whatIsView      : SantanderLabelView = SantanderLabelView(fontSize: 20, textColor : #colorLiteral(red: 0.4941176471, green: 0.4941176471, blue: 0.4941176471, alpha: 1))
    private var definitionView  : SantanderLabelView = SantanderLabelView(fontSize: 16, textColor : #colorLiteral(red: 0.4941176471, green: 0.4941176471, blue: 0.4941176471, alpha: 1))
    private var riskTitleView   : SantanderLabelView = SantanderLabelView(fontSize: 20, textColor : #colorLiteral(red: 0.4941176471, green: 0.4941176471, blue: 0.4941176471, alpha: 1))
    private var infoTitleView   : SantanderLabelView = SantanderLabelView(fontSize: 20, textColor:  #colorLiteral(red: 0.4941176471, green: 0.4941176471, blue: 0.4941176471, alpha: 1))
    
    private var moreInfoView    : InvestmentFundMoreInfoView = InvestmentFundMoreInfoView()
    private var infoView        : InvestmentInfoView = InvestmentInfoView()
    
    private var makeInvestmentAction    : SantanderButtonView = SantanderButtonView(title: "Investir",      mode: .enabled(#colorLiteral(red: 0.89276582, green: 0.1277235746, blue: 0, alpha: 1)))
    private var investmentAction        : SantanderButtonView = SantanderButtonView(title: "Investimento",  mode: .enabled(#colorLiteral(red: 0.89276582, green: 0.1277235746, blue: 0, alpha: 1)))
    private var contactAction           : SantanderButtonView = SantanderButtonView(title: "Contato",       mode: .enabled(#colorLiteral(red: 0.89276582, green: 0.1277235746, blue: 0, alpha: 1)))
    
    private var line : UIView {
        return self.lineView(UIColor.groupTableViewBackground, 1)
    }
    
    private var interactor  : InvestmentInteractor?
    private var router      : InvestmentRouter?
    
    override var subviews: [UIView] {
        return [titleView, fundView, line, whatIsView, definitionView, riskTitleView, infoTitleView, moreInfoView, line, infoView, makeInvestmentAction]
    }
    
    override var footerViews: [UIView] {
        return [investmentAction, contactAction]
    }

    init() {
        super.init(nibName: nil, bundle: nil)
        self.interactor = InvestmentInteractor()
        self.router     = InvestmentRouter()
        self.interactor?.presenter?.viewController = self
        self.router?.viewController = self
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
   
    override func viewDidLoad() {
        super.viewDidLoad()
        self.doLoadScreen()
        self.setupInterface()
    }
    
    private func doLoadScreen() {
        self.interactor?.doLoadScreenInfo()
    }
    
    private func setupInterface() {
        makeInvestmentAction.contentEdges = UIEdgeInsets(top: 16, left: 24, bottom: 16, right: 24)
        makeInvestmentAction.set(corner: 28)
        
        contactAction.action = { [weak self] in
            self?.router?.routerToAddContact()
        }
    }
    
    func showViewModel(viewModel: InvestmentModels.Screen.ViewModel) {
        titleView.set(text: viewModel.screenModel.screen.title)
        fundView.set(text: viewModel.screenModel.screen.fundName)
        whatIsView.set(text: viewModel.screenModel.screen.whatIs)
        definitionView.set(text: viewModel.screenModel.screen.definition)
        riskTitleView.set(text: viewModel.screenModel.screen.riskTitle)
        infoTitleView.set(text: viewModel.screenModel.screen.infoTitle)
        
        moreInfoView.set(fund: viewModel.screenModel.screen.moreInfo?.month)
        moreInfoView.set(fund: viewModel.screenModel.screen.moreInfo?.year)
        moreInfoView.set(fund: viewModel.screenModel.screen.moreInfo?.twelveMonths)
        
        infoView.set(allFunds: viewModel.screenModel.screen.allFunds)
    }
}
