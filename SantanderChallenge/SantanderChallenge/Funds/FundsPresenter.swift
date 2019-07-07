//
// FundsPresenter.swift
// SantanderChallenge
//
// Created for SantanderChallenge on 07/07/19.
//

import Foundation

protocol FundsPresenterProtocol {
    func presentFundsData(_ fundsData: Data)
    func presentError(_ error: String)
}

enum FundContentData {
    case title(String)
    case fundName(String)
    case definition(title: String, description: String)
    case risk(title: String, level: Int)
    case infoTitle(String)
    case moreInfo(FundMoreInfo)
    case info(FundInfo)
    case downInfo(DownInfo)
    case seprator
}

class FundsPresenter: FundsPresenterProtocol {
    weak var view: FundsPresentableProtocol?
    
    init(view: FundsPresentableProtocol) {
        self.view = view
    }
    
    func presentFundsData(_ fundsData: Data) {
        guard let funds = parse(fundsData: fundsData) else {
            self.view?.displayError("Invalid funds")
            return
        }
        
        let content = buildListOfContent(funds: funds)

        DispatchQueue.main.async {
            self.view?.displayFunds(content)
        }
    }
    
    func presentError(_ error: String) {
        DispatchQueue.main.async {
            self.view?.displayError(error)
        }
    }
}

extension FundsPresenter {
    
    private func parse(fundsData: Data) -> Funds? {
        do {
            let response = try JSONDecoder().decode(FundsResponse.self, from: fundsData)
            return response.screen
        } catch {
            print(error)
            return nil
        }
    }
    
    private func buildListOfContent(funds: Funds) -> [FundContentData] {
        var content: [FundContentData] = []
        content.append(.title(funds.title))
        content.append(.fundName(funds.fundName))
        content.append(.definition(title: funds.whatIs, description: funds.definition))
        content.append(.risk(title: funds.riskTitle, level: funds.risk))
        content.append(.infoTitle(funds.infoTitle))
        content.append(.moreInfo(funds.moreInfo))
        
        // Convert each info into a content row
        let infos = funds.info.map {
            return FundContentData.info($0)
        }
        content.append(contentsOf: infos)
        
        // Convert each down info into a content row
        let downInfos = funds.downInfo.map {
            return FundContentData.downInfo($0)
        }
        content.append(contentsOf: downInfos)
        
        return content
    }
}
