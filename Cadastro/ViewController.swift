//
//  ViewController.swift
//  Cadastro
//
//  Created by Cátia Souza on 28/09/20.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var nome: UITextField!
    @IBOutlet weak var dn: UITextField!
    @IBOutlet weak var cpf: UITextField!
    @IBOutlet weak var email: UITextField!
    
    @IBOutlet weak var viewEndereco: UIView!
    @IBOutlet weak var endercoView: UIView!
    @IBOutlet weak var estado: UITextField!
    @IBOutlet weak var cidade: UITextField!
    @IBOutlet weak var complemento: UITextField!
    @IBOutlet weak var rua: UITextField!
    @IBOutlet weak var bairro: UITextField!
    @IBOutlet weak var buttonCadastrar: UIButton!
    @IBOutlet weak var buttonCadastarEnd: UIButton!
    
   
    fileprivate func confiEscreen(){
        self.viewEndereco.isHidden = true
        self.buttonCadastrar.layer.cornerRadius = 10
        self.buttonCadastarEnd.layer.cornerRadius = 10
    }
    
    fileprivate func configuraTF(){
        self.nome.delegate = self
        self.cpf.delegate = self
        self.email.delegate = self
        self.dn.delegate = self
        
        
        self.rua.isUserInteractionEnabled = false
        self.complemento.isUserInteractionEnabled = false
        self.bairro.isUserInteractionEnabled = false
        self.cidade.isUserInteractionEnabled = false
        self.estado.isUserInteractionEnabled = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.configuraTF()
        self.confiEscreen()
        
        
    }
    

    @IBAction func cadastrar(_ sender: UIButton) {
        self.performSegue(withIdentifier: "cadastroEnderecoVC", sender: nil)
    }
    
    @IBAction func cadastrarEnd(_ sender: UIButton) {
        self.performSegue(withIdentifier: "EndVC", sender: nil)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc : EndVC? = segue.destination as? EndVC
        vc?.view.backgroundColor = .purple
       // vc?.label.text = sender as? String
    }
}

extension ViewController: UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        switch textField {
        case self.nome:
            self.cpf.becomeFirstResponder()
        case self.cpf:
            self.email.becomeFirstResponder()
        case self.email:
            self.dn.becomeFirstResponder()
        default:
            self.dn.resignFirstResponder()
        }
        return true
    }
    
}
