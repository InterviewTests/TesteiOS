//
//  FundosTopTableViewCell.swift
//  TesteiOS
//
//  Created by lucas.eiji.saito on 05/07/18.
//  Copyright © 2018 Accenture. All rights reserved.
//

import UIKit

class FundosTopTableViewCell: UITableViewCell {
    
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var labelFundName: UILabel!
    @IBOutlet weak var labelWhatIs: UILabel!
    @IBOutlet weak var labelDefinition: UILabel!
    @IBOutlet weak var labelRiskTitle: UILabel!
    @IBOutlet weak var collectionViewRisk: UICollectionView!
    @IBOutlet weak var labelInfoTitle: UILabel!
    @IBOutlet weak var labelMoreInfoMonthFund: UILabel!
    @IBOutlet weak var labelMoreInfoMonthCDI: UILabel!
    @IBOutlet weak var labelMoreInfoYearFund: UILabel!
    @IBOutlet weak var labelMoreInfoYearCDI: UILabel!
    @IBOutlet weak var labelMoreInfo12monthsFund: UILabel!
    @IBOutlet weak var labelMoreInfo12monthsCDI: UILabel!
    
    var riskList: [RiskCellCollectionViewCell.ViewModel] = []
    
    var viewModel: Fundos.Something.ViewModel.FundScreenTop = Fundos.Something.ViewModel.FundScreenTop() {
        didSet {
            didSetViewModel()
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        configCollectionViewRisk()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func didSetViewModel() {
        labelTitle.text = viewModel.title
        labelFundName.text = viewModel.fundName
        labelWhatIs.text = viewModel.whatIs
        labelDefinition.text = viewModel.definition
        labelRiskTitle.text = viewModel.riskTitle
        riskList = viewModel.riskCollectionModels
        collectionViewRisk.reloadData()
        labelInfoTitle.text = viewModel.infoTitle
        labelMoreInfoMonthFund.text = viewModel.moreInfoMonthFund
        labelMoreInfoMonthCDI.text = viewModel.moreInfoMonthCDI
        labelMoreInfoYearFund.text = viewModel.moreInfoYearFund
        labelMoreInfoYearCDI.text = viewModel.moreInfoYearCDI
        labelMoreInfo12monthsFund.text = viewModel.moreInfo12monthsFund
        labelMoreInfo12monthsCDI.text = viewModel.moreInfo12monthsCDI
    }
    
    func configCollectionViewRisk() {
        collectionViewRisk.register(UINib(nibName: "RiskCellCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "RiskCellCollectionViewCell")
    }

}

extension FundosTopTableViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.size.width / CGFloat(riskList.count), height: collectionView.frame.size.height)
    }
}

extension FundosTopTableViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return riskList.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "RiskCellCollectionViewCell", for: indexPath) as? RiskCellCollectionViewCell
        
        cell?.viewModel = riskList[indexPath.row]
        
        return cell ?? UICollectionViewCell()
    }
}
