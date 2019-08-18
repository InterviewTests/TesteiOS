//
//  FormViewPresenter.swift
//  TesteiOS
//
//  Created by Erika de Almeida Segatto on 16/08/19.
//  Copyright © 2019 Erika de Almeida Segatto. All rights reserved.
//

import Foundation
import RxSwift
import Domain


protocol FormViewCell {
    func configure(message: String, fieldType: FieldType, validateFieldFunction: @escaping (String, FieldType)->(Bool), hidden: Bool, topSpacing: Double)
}

protocol FormView: BasicView {
    func refresh()
}

protocol FormViewPresenter: BasicPresenter {
    func configure(cell: FormViewCell, at row: Int)
    func getRowType(at row: Int) -> CellType
    func getRowCount() -> Int
}

class FormViewPresenterImplementation: FormViewPresenter {
    
    private var disposeBag = DisposeBag()
    //    private let listName = "main"
    private var list = [FormCell]()
    private var apiUseCase: ApiUseCase!
    
    private weak var view: FormView?
    
    init(view: FormView, apiUseCase: ApiUseCase) {
        self.view = view
        self.apiUseCase = apiUseCase
    }
    
    func viewDidLoad() {
        getFormCells()
    }
    
    // MARK: Presenter functions
    func getRowCount() -> Int {
        return list.count
    }
    
    func getRowType(at row: Int) -> CellType {
        guard row >= 0 else { return .text }
        guard row < list.count else { return .text }
        return list[row].cellType
    }
    
    func configure(cell cellview: FormViewCell, at row: Int) {
        guard row >= 0 else { return }
        guard row < list.count else { return }
        let cell = list[row]
        cellview.configure(message: cell.message, fieldType: cell.fieldType, validateFieldFunction: validate, hidden: cell.hidden, topSpacing: cell.topSpacing)
    }
    
    // MARK: Validate Field Functions
    private func validate(_ text: String, fieldType: FieldType) -> Bool {
        return text.count > 3
    }
    
    // MARK: Use Case
    private func getFormCells() {
        apiUseCase.getFormFields()
            .subscribe(onNext: { [weak self] result in
                self?.list = result
                self?.view?.refresh()
            }, onError: { [weak self] error in
                self?.view?.showError(error)
            })
            .disposed(by: disposeBag)
    }
}
