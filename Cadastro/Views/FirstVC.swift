//
//  CadastroEndViewController.swift
//  Cadastro
//
//  Created by Cátia Souza on 28/09/20.
//

import UIKit


class FirstVC: UIViewController {
    
    
    @IBOutlet weak var estadoTextField: UITextField!
    
    @IBOutlet weak var ruaTextField: UITextField!
    @IBOutlet weak var complementoTextField: UITextField!
    @IBOutlet weak var cidadeTextField: UITextField!
    @IBOutlet weak var bairroTextField: UITextField!
    
    @IBOutlet weak var enderecoView: UIView!
    
    @IBOutlet weak var dataNascimentoTextField: UITextField!
    @IBOutlet weak var nomeTextFiled: UITextField!
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var cpfTextField: UITextField!
    
    @IBOutlet weak var enderecoButton: UIButton!
    
    var isRegister:Bool = false
    var usuario:Usuario?
    
    fileprivate func configScreen(){
        
        self.enderecoView.isHidden = true
        self.enderecoButton.layer.cornerRadius = 6
    }
    
    fileprivate func configTextFields(){
        
        self.nomeTextFiled.delegate = self
        self.cpfTextField.delegate = self
        self.emailTextField.delegate = self
        self.dataNascimentoTextField.delegate = self
        
        //        self.ruaTextField.delegate = self
        //        self.bairroTextField.delegate = self
        //        self.cidadeTextField.delegate = self
        //        self.complementoTextField.delegate = self
        
        self.ruaTextField.isUserInteractionEnabled = false
        self.bairroTextField.isUserInteractionEnabled = false
        self.cidadeTextField.isUserInteractionEnabled = false
        self.complementoTextField.isUserInteractionEnabled = false
        self.estadoTextField.isUserInteractionEnabled = false
    }
    
    fileprivate func validadeFields(textField: UITextField) {
        
        if let value = textField.text {
            
            if value.isEmpty {
                self.isRegister = false
            }else{
                self.isRegister = true
            }
            
        }else {
            self.isRegister = false
        }
        
        print("=======validateFields=====  \(self.isRegister)")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configScreen()
        configTextFields()
        
        
        
        
    }
    override func viewWillAppear(_ animated: Bool) {
        print("viewWillAppear")
    }
    override func viewDidAppear(_ animated: Bool) {
        print("viewDidAppear")
    }
    override func viewWillDisappear(_ animated: Bool) {
        print("viewWillDisappear")
    }
    
    
    @IBAction func cadastrarEndereco(_ sender: UIButton) {
        
        if self.nomeTextFiled.text?.isEmpty == true || self.cpfTextField.text?.isEmpty == true || self.emailTextField.text?.isEmpty == true || self.dataNascimentoTextField.text?.isEmpty == true{
            print("campo p preencher")
            
        }else{
            self.usuario = Usuario(nome: self.nomeTextFiled.text, cpf: self.cpfTextField.text, email: self.emailTextField.text, dn: self.dataNascimentoTextField.text, endereco: nil)
            self.performSegue(withIdentifier: "CadastroEnderecoVC", sender: nil)
        }
        
    }
    
    
    
    
    @IBAction func tappedCadastrarButton(_ sender: UIButton) {
        
        self.performSegue(withIdentifier: "DetailVC", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "CadastroEnderecoVC"{
            
            let vc:  CadastroEndereco? = segue.destination as? CadastroEndereco
            vc?.delegate = self
        }else{
            
            let vc: DetailsVC? = segue.destination as? DetailsVC
            vc?.view.backgroundColor = .darkGray
            //vc?.myLabel.text = "Catia"
        }

    }
}
extension FirstVC: CadastroEnderecoProtocol{
    func successRegister(address: Endereco) {
        self.enderecoView.isHidden = false
        self.usuario?.endereco = address
        
        self.ruaTextField.text = self.usuario?.endereco?.rua
        self.complementoTextField.text = self.usuario?.endereco?.complemento
        self.cidadeTextField.text = self.usuario?.endereco?.cidade
        self.bairroTextField.text = self.usuario?.endereco?.bairro
        self.estadoTextField.text = self.usuario?.endereco?.estado
        
        
    }
}

extension FirstVC: UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.validadeFields(textField: textField)
        switch textField {
        case self.nomeTextFiled:
            self.cpfTextField.becomeFirstResponder()
        case self.cpfTextField:
            self.emailTextField.becomeFirstResponder()
        case self.emailTextField:
            self.dataNascimentoTextField.becomeFirstResponder()
        default:
            self.dataNascimentoTextField.becomeFirstResponder()
        }
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        self.validadeFields(textField: textField)
    }
}
