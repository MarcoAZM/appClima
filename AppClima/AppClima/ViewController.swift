//
//  ViewController.swift
//  AppClima
//
//  Created by Mac12 on 30/11/20.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate, ClimaManagerDelegate {
    
    var climaManager = ClimaManager()
    let images = [#imageLiteral(resourceName: "default"),#imageLiteral(resourceName: "cloudyfog"),#imageLiteral(resourceName: "cloudybolt"),#imageLiteral(resourceName: "sunny")]
    
    @IBOutlet weak var buscarTextField: UITextField!
    @IBOutlet weak var temperaturaLabel: UILabel!
    @IBOutlet weak var climaImageView: UIImageView!
    @IBOutlet weak var ciudadLabel: UILabel!
    
    func actualizarClima(clima: ClimaModelo) {
        temperaturaLabel.text = clima.temperaturaDecimal
        climaImageView.image = images[2]
    }
    
    func dismissKeyboard() {
        view.endEditing(true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        climaManager.delegado = self
        buscarTextField.delegate = self
        //view.addGestureRecognizer(tap)
        // Do any additional setup after loading the view.
    }
    
    @IBAction func buscarButton(_ sender: UIButton) {
        ciudadLabel.text = "El clima de hoy para \(buscarTextField.text!):"
        climaManager.fetchClima(nombreCiudad: buscarTextField.text!)
    }
    
     func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        ciudadLabel.text = "El clima de hoy para \(buscarTextField.text!)"
        return true
     }

    @IBAction func cerrarTeclado(_ sender: UIButton) {
        print("Cerrar teclado")
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
         if buscarTextField.text != "" {
             return true
         } else {
             buscarTextField.placeholder = "Escriba nombre de una ciudad"
             return false
         }
     }
     
}

