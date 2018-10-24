//
//  ConfirmationScreenViewController.swift
//  TesteSantander
//
//  Created by Marcel Mendes Filho on 21/10/18.
//  Copyright © 2018 Marcel Mendes Filho. All rights reserved.
//

import UIKit

class ConfirmationScreenViewController: UIViewController {

    //
    // MARK: - SETUP DE GANCHOS IBOUTLET
    //
    @IBOutlet weak var Label_Titulo: UILabel!
    @IBOutlet weak var Label_Mensagem_Secundaria: UILabel!
    @IBOutlet weak var Label_Mensagem_Principal: UILabel!
    @IBOutlet weak var Botao_Call_To_Action: UIButton!
    
    //
    // MARK: - SETUP DE VARIÁVEIS LOCAIS
    //
    var titulo = ""
    var mensagem_secundaria = ""
    var mensagem_principal = ""
    var label_botao_call_to_action = ""
    
    override func viewDidLoad(){
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning(){
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // setup do conteúdo dos objetos da UI
        Label_Titulo.text = titulo
        Label_Mensagem_Secundaria.text = mensagem_secundaria
        Label_Mensagem_Principal.text = mensagem_principal
        Botao_Call_To_Action.setTitle(label_botao_call_to_action, for: .normal)
    }
    
    // notifica o MainViewController para apresentar a FormViewController
    @IBAction func Tap_Botao_Call_To_Action(_ sender: UIButton){
        NotificationCenter.default.post(name: Notification.Name(rawValue: Constants.localNotificationKey002), object: self, userInfo: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
