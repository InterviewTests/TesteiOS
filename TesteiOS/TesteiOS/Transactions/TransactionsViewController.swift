//
//  TransactionsViewController.swift
//  TesteiOS
//
//  Created by Gabriel Soria Souza on 22/10/18.
//  Copyright © 2018 Gabriel Sória Souza. All rights reserved.
//

import Foundation
import UIKit

class UserTransactionsViewController: UIViewController {
    
    let accountInformationView = UIView()
    var router: UserTransactionsRouter?
    var data: [StatementListRequest]?
    var userData: DetailDataToBePosted?
    var interactor: GetTransactions?
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    @IBOutlet weak var userAccountView: UIView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var logoutButton: UIButton!
    @IBOutlet weak var agencyAccountNumberLabel: UILabel!
    @IBOutlet weak var balanceLabel: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var activity: UIActivityIndicatorView!
    
    override func viewDidAppear(_ animated: Bool) {
        guard let returnedUserData = userData else { return }
        super.viewDidAppear(animated)
        userNameLabel.text = returnedUserData.name
        agencyAccountNumberLabel.text = "\(String(describing: returnedUserData.bankAccount)) / \(String(describing: returnedUserData.agency))"
        balanceLabel.text = "R$ " + convertDoubleFormat(input: returnedUserData.balance)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        view.addSubview(activity)
        activity.startAnimating()
        collectionView.delegate = self
        collectionView.dataSource = self
        userAccountView.backgroundColor = UIColor.spc_from(r: 59, g: 73, b: 238)
    }
    
    @IBAction func dismissViewController(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    func setup() {
        let viewController = self
        let router = UserTransactionsRouter()
        let presenter = TransactionsPresenter()
        let interactor = TransactionsInteractor()
        viewController.router = router
        viewController.interactor = interactor
        interactor.presenter = presenter
        presenter.viewController = viewController
        interactor.id = userData?.userId
        interactor.getTransactions(userTransactionsViewController: self)
    }
    
    func finishLoadingContent() {
        self.activity.stopAnimating()
        self.activity.removeFromSuperview()
        self.collectionView.reloadData()
    }
    
}

extension UserTransactionsViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.bounds.size.width - 32
        let height: CGFloat = 80.0
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 15
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if let sectionHeader = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "sectionHeader", for: indexPath) as? SectionHeader {
            sectionHeader.sectionHeaderLabel.text = "Recentes"
            return sectionHeader
        }
        return UICollectionReusableView()
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let data = data else { return 0 }
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "transactionCell", for: indexPath) as! UserTransactionsCollectionViewCell
        cell.layer.cornerRadius = 5
        cell.layer.borderColor = UIColor.lightGray.cgColor
        cell.layer.borderWidth = 0.2
        guard let data = data else { return UICollectionViewCell() }
        
        cell.typeOfTransaction.text = data[indexPath.row].title
        cell.date.text = convertDateFormat(input: data[indexPath.row].date)
        cell.nameOfTransaction.text = data[indexPath.row].desc
        cell.amount.text = "R$ " + convertDoubleFormat(input: (data[indexPath.row].value))
        //cell.amount.text = "R$ \(data[indexPath.row].value)"
        
        cell.contentView.layer.masksToBounds = true
        cell.backgroundColor = .white
        cell.layer.shadowColor = UIColor.black.cgColor
        cell.layer.shadowOffset = CGSize(width: 0, height: 3)
        cell.layer.shadowRadius = 2.0
        cell.layer.shadowOpacity = 0.1
        cell.layer.masksToBounds = false
        cell.layer.shadowPath = UIBezierPath(roundedRect: cell.bounds, cornerRadius: cell.layer.cornerRadius).cgPath
        
        return cell
    }
    
    func convertDateFormat(input: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let date = dateFormatter.date(from: input)
        dateFormatter.dateFormat = "dd/MM/yyyy"
        guard let returnDate = date else { return "" }
        return dateFormatter.string(from: returnDate)
        
    }
    
    func convertDoubleFormat(input: Double) -> String {
        let formatter = NumberFormatter()
        formatter.decimalSeparator = ","
        formatter.maximumFractionDigits = 2
        return formatter.string(from: NSNumber(value: input)) ?? "0"
    }
}
