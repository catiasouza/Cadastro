//
//  EndVC.swift
//  Cadastro
//
//  Created by Cátia Souza on 28/09/20.
//

import UIKit

class CadastroEndereco: UIViewController {

   
    
    @IBOutlet weak var ruaTextField: UITextField!
    @IBOutlet weak var complementoTextField: UITextField!
    @IBOutlet weak var cidadeTextField: UITextField!
    @IBOutlet weak var bairroTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

       
    }
    
    @IBAction func clicouVoltou(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    

}
