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


protocol FormViewCellDelegate: class {
    func sendButtonPressed()
    func saveUserInput(_ text: Any, id: Int)
}

protocol FormViewCell {
    func configure(id: Int, message: String, fieldType: FieldType, userInput: Any?, enabled: Bool, hidden: Bool, topSpacing: Double, delegate: FormViewCellDelegate?)
}

protocol FormView: BasicView {
    func refresh()
    func goToFormSentSuccesfullyPage()
}

protocol FormViewPresenter: BasicPresenter {
    func configure(cell: FormViewCell, at row: Int)
    func getRowType(at row: Int) -> CellType
    func getRowCount() -> Int
    func setRowUserInput(_ input: Any, at row: Int)
    
    func clearUserInput()
}

class FormViewPresenterImplementation: FormViewPresenter {
    
    private var disposeBag = DisposeBag()
    //    private let listName = "main"
    private var list = [FormCell]()
    private var apiUseCase: ApiUseCase!
    private var isWaitingServer = false
    
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
        cellview.configure(id: cell.id, message: cell.message, fieldType: cell.fieldType, userInput: cell.input, enabled: !isWaitingServer, hidden: cell.hidden, topSpacing: cell.topSpacing, delegate: self)
    }
    
    func setRowUserInput(_ input: Any, at row: Int) {
        guard row >= 0 else { return }
        guard row < list.count else { return }
        list[row].input = input
    }
    
    func clearUserInput() {
        for cell in list {
            cell.input = nil
        }
    }
    
    // MARK: Validate All Form
    private func validateForm(_ form: [FormCell]) -> Bool {
        for cell in form {
            guard (cell.cellType != .field) || (!cell.required) || (cell.required && (cell.input != nil)) else {
                self.view?.showError(ViewError.formIncomplete(cell.message))
                return false
            }
            if let text = cell.input as? String {
                if !(cell.fieldType.isValid(text)) {
                    self.view?.showError(ViewError.formInvalid(cell.message))
                    return false
                }
            }
        }
        return true
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
    
    private func sendForm() {
        let form = list
        isWaitingServer = true
        view?.refresh()
        guard validateForm(form) else { isWaitingServer = false; view?.refresh(); return }
        
        apiUseCase.sendForm(form)
            .subscribe(onNext: { [weak self] _ in
                self?.isWaitingServer = false
                self?.view?.goToFormSentSuccesfullyPage()
            }, onError: { [weak self] error in
                self?.isWaitingServer = false
                self?.view?.refresh()
                self?.view?.showError(error)
            })
            .disposed(by: disposeBag)
    }
}




// MARK: FormViewCellDelegate
extension FormViewPresenterImplementation: FormViewCellDelegate {
    
    func sendButtonPressed() {
        self.sendForm()
    }
    
    func saveUserInput(_ value: Any, id: Int) {
        guard let cell = list.enumerated().filter({ return $0.element.id == id }).first else { return }
        self.setRowUserInput(value, at: cell.offset)
    }
    
}
