//
//  ViewController.swift
//  Cadastro
//
//  Created by Cátia Souza on 28/09/20.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var nome: UITextField!
    
    @IBOutlet weak var endercoView: UIView!
    @IBOutlet weak var dn: UITextField!
    @IBOutlet weak var cpf: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var buttonCadastrar: UIButton!
    @IBOutlet weak var buttonCadastarEnd: UIButton!
    
    @IBOutlet weak var estado: UITextField!
    @IBOutlet weak var cidade: UITextField!
    @IBOutlet weak var complemento: UITextField!
    @IBOutlet weak var rua: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.buttonCadastrar.layer.cornerRadius = 10
        self.buttonCadastarEnd.layer.cornerRadius = 10
        
        
        
        let tap = UITapGestureRecognizer(target: self, action:#selector (ViewController.dismissKeyboard))
        self.view.addGestureRecognizer(tap)
        self.view.addGestureRecognizer(tap)
    }
    @objc private func dismissKeyboard(){
        self.view.endEditing(true)
    }

    @IBAction func cadastrar(_ sender: UIButton) {
        self.performSegue(withIdentifier: "EndVC", sender: nil)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc: EndVC? = segue.destination as? EndVC
    }
}
extension ViewController: UITextFieldDelegate{
    
}
