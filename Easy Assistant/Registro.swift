//
//  Registro.swift
//  Easy Assistant
//
//  Created by Karen on 31/10/18.
//  Copyright © 2018 Karen. All rights reserved.
//
import UIKit
import Foundation
class Registro: UIViewController {
    @IBOutlet weak var nombres: UITextField!
    @IBOutlet weak var materias: UITextField!
    @IBOutlet weak var nivel: UITextField!
    @IBOutlet weak var grupo: UITextField!
    @IBOutlet weak var correo: UITextField!
    @IBOutlet weak var telefono: UITextField!
    @IBOutlet var imagen: UIButton!
    var imagee: UIImage!
    var imagePick = UIImagePickerController()
    override func viewDidLoad() {
        super.viewDidLoad()
       // imagePick.delegate = self
    }
    
    @IBAction func agreFoto(_ sender: Any) {
        imagePick.sourceType = .photoLibrary
        //Para celular usar esta linea de codigo
        //imagePick.sourceType = .camera
        imagePick.allowsEditing = true
        imagePick.delegate = self
        present(imagePick, animated: true, completion: nil)
    }
    
    
    @IBAction func agregar(_ sender: Any) {
        
        let nombre = nombres.text
        let materia = materias.text
        let niv = nivel.text
        let grup = grupo.text
        let corre = correo.text
        let tel = telefono.text
        if((nombres.text?.isEmpty)! || (materias.text?.isEmpty)! || (nivel.text?.isEmpty)! || (grupo.text?.isEmpty)! || (correo.text?.isEmpty)! || (telefono.text?.isEmpty)!){
            let alerta2 = UIAlertController(title: "Alerta", message: "Se deben de registrar todos los campos", preferredStyle: .alert)
            alerta2.addAction(UIAlertAction(title: "Aceptar", style: .default, handler: {(action) in
                
            }))
            self.present(alerta2, animated: true, completion: nil)
        }else{
            let alerta = UIAlertController(title: "Se agregara tarea", message: "Pulsa Ok para agregar", preferredStyle: .alert)
            alerta.addAction(UIAlertAction(title: NSLocalizedString("Ok", comment: "Default action"), style: .default, handler: { _ in
                
                alumnos.append(Alumno(nombre: nombre! , materia: materia!, nivel: niv!, grupo: grup!, correo: corre!, telefono: tel!, imagen: self.imagee))
                
            }))
            alerta.addAction(UIAlertAction(title: "Cancelar", style: .default, handler: {(action) in
                
            }))
            self.present(alerta, animated: true, completion: nil)
        }
        
    }
    
}
extension Registro: UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let image = info[UIImagePickerControllerEditedImage] as? UIImage {
            imagen.setImage(image, for: .normal)
            imagee = image
        }
        dismiss(animated: true, completion: nil)
    }
}

