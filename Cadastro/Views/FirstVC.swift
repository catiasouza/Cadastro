//
//  CadastroEndViewController.swift
//  Cadastro
//
//  Created by Cátia Souza on 28/09/20.
//

import UIKit


class FirstVC: UIViewController {
    
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
        self.performSegue(withIdentifier: "CadastroEnderecoVC", sender: nil)
    }
    
    @IBAction func tappedCadastrarButton(_ sender: UIButton) {
        
        self.performSegue(withIdentifier: "DetailVC", sender: nil)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let vc: DetailsVC? = segue.destination as? DetailsVC
        vc?.view.backgroundColor = .darkGray
        vc?.myLabel.text = "Catia"
    }
}
extension FirstVC: UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
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
}
