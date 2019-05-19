//
//  FundsViewController.swift
//  santander
//
//  Created by Jonatha Lima on 18/05/19.
//  Copyright © 2019 anonymous. All rights reserved.
//

import UIKit

public class FundsViewController: UIViewController {
    
    public var dataSource: TableViewDataSource?
    public weak var coordinator: (Funding & Contacting)?
    
    private var fundsView: FundsView
    
    init() {
        self.fundsView = FundsView()
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override public func loadView() {
        super.loadView()
        self.view = fundsView
    }
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        title = "Investimento"
        buildTableView()
        
        let shareBarItem =
            UIBarButtonItem(image: Resource.Image.share.image,
                            style: .plain,
                            target: self, action: #selector(didShareSelected))
        
        navigationItem.rightBarButtonItem = shareBarItem
    }
    
}

extension FundsViewController: TableViewing {
    
    public func buildTableView() {
        let sections = buildTableViewSections()
        dataSource = TableViewDataSource(sections: sections,
                                         tableView: fundsView.tableView)
        
        fundsView.tableView.dataSource = dataSource
        fundsView.tableView.delegate = dataSource
        fundsView.tableView.reloadData()
    }
    
    public func buildTableViewSections() -> [TableViewSectionBuilder] {
        var sections = [TableViewSectionBuilder]()
        sections.append(TableViewStaticSection(cellBuilders: buildIntroCellBuilders()))
        sections.append(TableViewStaticSection(cellBuilders: buildFundsRiskCellBuilders()))
        return sections
    }
    
    public func buildIntroCellBuilders() -> [TableViewCellBuilder] {
        var builders = [TableViewCellBuilder]()
        
        let headerCellBuilder =
            FundsHeaderViewCellBuilder(configuration:
                .init(title: "Fundos de investimento",
                      subtitle: "Vinci Valorem FI Multimercado"))
        
        
        let explanationTextCellBuilder =
            FundsTextCellBuilder(configuration:
                .init(titleText: "O que é?",
                      titleFont: Resource.Font.medium.of(size: 16),
                      subtitleText: """
                                        O Fundo tem por objetivo proporcionar
                                        aos seus cotistas rentabilidade no longo
                                        prazo através de investimentos.
                                    """,
                      subtitleFont: Resource.Font.light.of(size: 16)))
        
        builders.append(headerCellBuilder)
        builders.append(SeparatorInlineCellBuilder(spaced: 21))
        builders.append(explanationTextCellBuilder)
        
        return builders
    }
    
    public func buildFundsRiskCellBuilders() -> [TableViewCellBuilder] {
        var builders = [TableViewCellBuilder]()
        
        let riskTextCellBuilder =
            FundsTextCellBuilder(configuration:
                .init(titleText: "Grau de risco do investimento",
                      titleFont: Resource.Font.medium.of(size: 16),
                      subtitleText: "",
                      subtitleFont: Resource.Font.light.of(size: 16)))
        
        let thermometerCellBuilder = ThermometerViewCellBuilder()
        
        builders.append(riskTextCellBuilder)
        builders.append(thermometerCellBuilder)
        
        return builders
    }
    
}

extension FundsViewController {
    
    @objc
    func didShareSelected() {
        // TODO: Implment share bar button action
    }
    
}
