//
//  EndVC.swift
//  Cadastro
//
//  Created by Cátia Souza on 28/09/20.
//

import UIKit

protocol CadastroEnderecoProtocol: class {
    func successRegister(address: Endereco
    )
}

class CadastroEndereco: UIViewController {

   
    
    @IBOutlet weak var ruaTextField: UITextField!
    @IBOutlet weak var complementoTextField: UITextField!
    @IBOutlet weak var cidadeTextField: UITextField!
    @IBOutlet weak var bairroTextField: UITextField!
    
    @IBOutlet weak var estadoTextField: UITextField!
    
    var delegate: CadastroEnderecoProtocol?
    
    fileprivate func configTextFields(){
        
    
        self.ruaTextField.delegate = self
        self.bairroTextField.delegate = self
        self.cidadeTextField.delegate = self
        self.complementoTextField.delegate = self
        self.estadoTextField.delegate = self
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configTextFields()
       
    }
    
    @IBAction func clicouCadastrarEndereco(_ sender: UIButton) {
        
        if self.ruaTextField.text?.isEmpty == true || self.bairroTextField.text?.isEmpty == true || self.complementoTextField.text?.isEmpty == true || self.cidadeTextField.text?.isEmpty == true || self.estadoTextField.text?.isEmpty == true {
            print("campo p preencher")
            
        }else{
            
            var endereco = Endereco(rua: self.ruaTextField.text, complemento: self.complementoTextField.text, bairro: self.bairroTextField.text ,cidade: self.cidadeTextField.text, estado: self.estadoTextField.text)
            
            //dispara delegate
            self.delegate?.successRegister(address: endereco)
            self.dismiss(animated: true, completion: nil)
        }
        
    }
    
    @IBAction func clicouVoltou(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    

}
extension CadastroEndereco:UITextFieldDelegate{
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    switch textField {
    case self.ruaTextField:
        self.complementoTextField.becomeFirstResponder()
    case self.complementoTextField:
        self.cidadeTextField.becomeFirstResponder()
    case self.cidadeTextField:
        self.estadoTextField.becomeFirstResponder()
    default:
        self.estadoTextField.resignFirstResponder()
    }
    return true
}
}
