//
//  ContactFormViewController.swift
//  SantanderTeste
//
//  Created by Rafael Macito on 13/05/2018.
//  Copyright © 2018 Rafael Macito. All rights reserved.
//

import UIKit

class ContactFormViewController: BaseViewController {
    
    var presenter: ContactFormPresenter?
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    var contactFormViews: [BaseContactFormView] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter?.loadUIIfNeeded()
        
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    // MARK: Custom
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}

extension ContactFormViewController: ContactFormPresenterDelegate {
    // MARK: ContactFormPresenterDelegate
    
    func loadUI(_ contactForm: ContactForm) {
        scrollView.subviews.forEach({ $0.removeFromSuperview() })
        contactFormViews = []
        
        guard let cells = contactForm.cells, !cells.isEmpty else { return }
        
        var lastView = scrollView as UIView
        for cell in cells {
            var view: BaseContactFormView
            
            switch cell.type {
            case .field?:
                view = TextFieldContactFormView(frame: CGRect())
            case .text?:
                view = LabelContactFormView(frame: CGRect())
            case .image?:
                view = ImageContactFormView(frame: CGRect())
            case .checkbox?:
                view = CheckboxContactFormView(frame: CGRect())
            case .send?:
                let sendView = SendContactFormView(frame: CGRect())
                
                sendView.onSend = { [weak self] in
                    guard let cells = self?.contactFormViews.compactMap({ return $0.cell }) else { return }
                    self?.presenter?.validate(cells)
                }

                view = sendView
            default:
                return
            }
            
            view.cell = cell

            view.onActive = { [weak self] (id, show) in
                guard let id = id,
                    let view = self?.contactFormViews.first(where: { $0.cell?.id == id }),
                    view.isHidden != !show else { return }
                
                UIView.animate(withDuration: 0.25, animations: {
                    if show {
                        self?.scrollView.contentSize = CGSize(width: self?.scrollView.contentSize.width ?? 0,
                                                              height: (self?.scrollView.contentSize.height ?? 0) + view.height)
                        view.heightConstraint?.constant = view.height
                    } else {
                        self?.scrollView.contentSize = CGSize(width: self?.scrollView.contentSize.width ?? 0,
                                                              height: (self?.scrollView.contentSize.height ?? 0) - view.height)
                        view.heightConstraint?.constant = 0
                    }
                    
                    view.alpha = !show == false ? 1 : 0
                    
                    if view.alpha == 1 {
                        view.isHidden = false
                    }
                    
                    self?.view.layoutIfNeeded()
                }, completion: { _ in
                    if view.alpha == 0 {
                        view.isHidden = true
                    }
                })
            }
            
            scrollView.addSubview(view)
            view.topAnchor.constraint(equalTo: lastView.bottomAnchor, constant: CGFloat(cell.topSpacing ?? 0)).isActive = true
            view.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
            view.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
            view.heightConstraint = view.heightAnchor.constraint(equalToConstant: cell.hidden == false ? view.height : 0)
            view.heightConstraint?.isActive = true
            
            view.isHidden = cell.hidden
            
            lastView = view
            
            contactFormViews.append(view)
        }
        
        view.layoutIfNeeded()
        
        scrollView.contentSize = CGSize(width: scrollView.contentSize.width, height: lastView.frame.origin.y + lastView.frame.height + 30)
    }
    
    func validationError(in cell: ContactFormItem) {
        guard let view = contactFormViews.first(where: { $0.cell?.id == cell.id }) else { return }
        
        view.error()
    }
    
    func successSent() {
        guard let view = ContactFormSentView.fromNib("ContactFormSentView")
            as? ContactFormSentView else { return }
        
        view.onRessendPressed = { [weak self] in
            self?.presenter?.loadUIIfNeeded()
            
            UIView.animate(withDuration: 0.25, animations: { [weak self] in
                view.alpha = 0
                
                self?.view.layoutIfNeeded()
            }, completion: { _ in
                view.removeFromSuperview()
            })
        }
            
        self.view.addSubview(view)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 64).isActive = true
        view.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
        view.rightAnchor.constraint(equalTo: self.view.rightAnchor).isActive = true
        view.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        
        self.view.layoutIfNeeded()
        
        view.alpha = 0
        UIView.animate(withDuration: 0.25, animations: { [weak self] in
            view.alpha = 1
            
            self?.view.layoutIfNeeded()
        })
    }
}
