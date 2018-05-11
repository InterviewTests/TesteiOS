//
//  MainViewController.swift
//  TesteSantander
//
//  Created by Marcel Mendes Filho on 04/05/2018.
//  Copyright © 2018 Marcel Mendes Filho. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    //
    // MARK: - ELEMENTOS DA UI
    //
    @IBOutlet weak var Label_Button_Investimentos: UILabel!
    @IBOutlet weak var Label_Button_Contato: UILabel!
    @IBOutlet weak var contentView: UIView!
    
    var Label_Selected = UILabel()
    var Gesture_Button_Investimentos: UITapGestureRecognizer!
    var Gesture_Button_Contato: UITapGestureRecognizer!
    let vermelhoSantander = "DA0101"
    
    //
    // MARK: - GANCHO PARA O CONTAINERVIEWCONTROLLER
    //
    var formViewController: FormViewController? = nil
    var fundViewController: FundViewController? = nil
    var confirmationScreenViewController: ConfirmationScreenViewController? = nil
    
    //
    //  MARK: - FUNÇÕES STANDARD DO VIEWCONTROLLER
    //
    override func viewDidLoad() {
        super.viewDidLoad()

        // setup de gesture recognizer para ocultar teclado
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)

        // observer que será acionado pelo FormViewController quando o usuário toca em um botão do tipo enviar
        NotificationCenter.default.addObserver(self, selector: #selector(self.showConfirmationView), name: NSNotification.Name(rawValue: localNotificationKey001), object: nil)
        
        // observer que será acionado pelo ConfirmationViewController quando o usuário toca em um botão do tipo enviar nova mensagem
        NotificationCenter.default.addObserver(self, selector: #selector(self.tapButtonContato), name: NSNotification.Name(rawValue: localNotificationKey002), object: nil)
        
        // monta os botões de navegação do rodapé
        setupNavigationButtons()
        
        // setup das 3 views: formViewController, fundViewController e confirmationScreenViewController
        setupViewControllers()
        
        // ativação da view padrão
        tapButtonInvestimentos(UITapGestureRecognizer())
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }
    
    //
    // MARK: - EVENTOS DE NAVEGAÇÃO DA UI
    //
    
    // ações após toque no botão Contato
    func tapButtonContato(_ sender: UITapGestureRecognizer)
    {
        setSelectedButton(button: Label_Button_Contato)
        formViewController?.titulo = "Contato"
        formViewController?.URL_Form_Contato = "https://floating-mountain-50292.herokuapp.com/cells.json"
        activeViewController = formViewController
    }

    // ações após toque no botão Investimento
    func tapButtonInvestimentos(_ sender: UITapGestureRecognizer)
    {
        setSelectedButton(button: Label_Button_Investimentos)
        fundViewController?.titulo = "Investimentos"
        fundViewController?.URL_Fund = "https://floating-mountain-50292.herokuapp.com/fund.json"
        fundViewController?.shareURL = "https://www.google.com"
        activeViewController = fundViewController
    }

    // mostra view de confirmação de envio de formulário de contato
    func showConfirmationView()
    {
        confirmationScreenViewController?.titulo = "Contato"
        confirmationScreenViewController?.mensagem_secundaria = "Obrigado!"
        confirmationScreenViewController?.mensagem_principal = "Mensagem enviada com sucesso :-)"
        confirmationScreenViewController?.label_botao_call_to_action = "Enviar nova mensagem"
        activeViewController = confirmationScreenViewController
    }
    
    // oculta o teclado após término do data entry
    func dismissKeyboard()
    {
        view.endEditing(true)
    }

    //
    // MARK: - MANUTENCAO DA UI
    //
    
    // monta os botões de navegação do rodapé
    func setupNavigationButtons()
    {
        // ajusta a cor de background de cada botão de navegação
        Label_Button_Contato.backgroundColor = UIColor.init(hex: vermelhoSantander)
        Label_Button_Investimentos.backgroundColor = UIColor.init(hex: vermelhoSantander)
        
        // define parâmetros específicos das labels de cada botão de navegação
        Label_Button_Contato.textColor = UIColor.white
        Label_Button_Investimentos.textColor = UIColor.white

        // configura o tap em cada botão de navegação
        Gesture_Button_Contato = UITapGestureRecognizer(target: self, action: #selector(self.tapButtonContato(_:)))
        Gesture_Button_Contato.numberOfTapsRequired = 1
        Label_Button_Contato?.isUserInteractionEnabled = true
        Label_Button_Contato?.addGestureRecognizer(Gesture_Button_Contato)

        Gesture_Button_Investimentos = UITapGestureRecognizer(target: self, action: #selector(self.tapButtonInvestimentos(_:)))
        Gesture_Button_Investimentos.numberOfTapsRequired = 1
        Label_Button_Investimentos?.isUserInteractionEnabled = true
        Label_Button_Investimentos?.addGestureRecognizer(Gesture_Button_Investimentos)
    }
    
    // setup das 3 views: formViewController, fundViewController e confirmationScreenViewController
    func setupViewControllers()
    {
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        
        formViewController = storyboard.instantiateViewController(withIdentifier: "FormViewController") as? FormViewController
        self.addChildViewController(formViewController!)
        
        fundViewController = storyboard.instantiateViewController(withIdentifier: "FundViewController") as? FundViewController
        self.addChildViewController(fundViewController!)
        
        confirmationScreenViewController = storyboard.instantiateViewController(withIdentifier: "ConfirmationScreenViewController") as? ConfirmationScreenViewController
        self.addChildViewController(confirmationScreenViewController!)

    }
    
    // ajusta o Label_Selected sobre a view selecionada
    // esta função é acionada toda vez que o usuário toca num dos dois botões: Contato ou Investimento
    func setSelectedButton(button: UILabel)
    {
        // remove o Label_Selected da view atual
        Label_Selected.removeFromSuperview()
        
        // configura o Label_Selected
        Label_Selected = UILabel(frame: CGRect(x: CGFloat(0), y: CGFloat(0), width: button.frame.width, height: button.frame.height))
        Label_Selected.backgroundColor = UIColor(white: 0, alpha: 0.2)
        Label_Selected.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        // adiciona o Label_Selected à view
        button.addSubview(Label_Selected)
    }

    //
    // MARK: - SWITCH DA VIEWCONTROLLER ATIVA
    //
    
    // remove a view atual e ativa a nova view
    private var activeViewController: UIViewController?
    {
        didSet {
            removeInactiveViewController(oldValue)
            updateActiveViewController()
        }
    }
    
    // remove a view atual
    private func removeInactiveViewController(_ inactiveViewController: UIViewController?) {
        if let inActiveVC = inactiveViewController {
            
            // chama antes de remover a child view da hierarquia
            inActiveVC.willMove(toParentViewController: nil)

            // remove a child view da hierarquia
            inActiveVC.view.removeFromSuperview()
            
            // chama após remover a child view da hierarquia
            inActiveVC.removeFromParentViewController()
        }
    }
    
    // ativa a nova view
    private func updateActiveViewController() {
        if let activeVC = activeViewController {
            
            // chama antes de adicionar a child view à hierarquia
            addChildViewController(activeVC)

            // configura estrutura da view
            activeVC.view.frame = contentView.bounds
            activeVC.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
            
            // adiciona a child view à hierarquia
            contentView.addSubview(activeVC.view)
            
            // chama após adicionar a child view à hierarquia
            activeVC.didMove(toParentViewController: self)
        }
    }
}

