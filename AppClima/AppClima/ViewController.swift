//
//  ViewController.swift
//  AppClima
//
//  Created by Mac12 on 30/11/20.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    let climaManager = ClimaManager()

    @IBOutlet weak var buscarTextField: UITextField!
    @IBOutlet weak var ciudadLabel: UILabel!
    @IBOutlet weak var temperaturaLabel: UILabel!
    @IBOutlet weak var climaImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        buscarTextField.delegate = self
        // Do any additional setup after loading the view.
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print(buscarTextField.text!)
        ciudadLabel.text = buscarTextField.text
        return true
    }

    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if buscarTextField.text != "" {
            return true
        } else {
            buscarTextField.placeholder = "Escriba nombre de una ciudad"
            return false
        }
    }
    
    @IBAction func buscarButton(_ sender: UIButton) {
        ciudadLabel.text = buscarTextField.text
        climaManager.fetchClima(nombreCiudad: buscarTextField.text!)
    }
}

