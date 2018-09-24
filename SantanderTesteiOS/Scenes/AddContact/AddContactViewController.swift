//
//  AddContactViewController.swift
//  SantanderTesteiOS
//
//  Created by Diego Costa on 23/09/18.
//  Copyright © 2018 Diego Costa. All rights reserved.
//

import UIKit

protocol AddContactDisplayCells : class {
    func displayCell(viewModel : AddContactModels.Cells.ViewModel)
}

class AddContactViewController: LayoutVerticalViewController, AddContactDisplayCells {
    
    private var interactor : AddContactInteractor?
    
    private var space : UIView {
        return spaceView(UIColor.white, 16)
    }
    
    init() {
        super.init(nibName: nil, bundle: nil)
        self.interactor = AddContactInteractor()
        self.interactor?.presenter?.viewController = self
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.contentInsets = UIEdgeInsets(top: 44, left: 44, bottom: 44, right: 44)
        self.doLoadCells()
    }
    
    private func doLoadCells() {
        interactor?.doLoadCells()
    }
    
    func displayCell(viewModel: AddContactModels.Cells.ViewModel) {
        
        for (index, viewModel) in viewModel.viewModel.enumerated() {
            switch viewModel.type {
            case .text:
                let textView : SantanderLabelView = SantanderLabelView(fontSize: 20, textColor: #colorLiteral(red: 0.4352941176, green: 0.4431372549, blue: 0.4745098039, alpha: 1))
                textView.set(text: viewModel.message)
                textView.set(alignment: .left)
                insert(view: textView, at: index)
            case .field:
                let field : AddContactFieldView = AddContactFieldView(viewModel: viewModel)
                insert(view: field, at: index)
            case .send:
                let buttonView : SantanderButtonView = SantanderButtonView(title: viewModel.message, mode: .enabled(#colorLiteral(red: 0.89276582, green: 0.1277235746, blue: 0, alpha: 1)))
                buttonView.set(corner: 24)
                insert(view: buttonView, at: index-1)
            default:
                break
            }
        }
    }
}
