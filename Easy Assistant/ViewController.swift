//
//  ViewController.swift
//  Easy Assistant
//
//  Created by Karen on 10/9/18.
//  Copyright © 2018 Karen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var profe = [Profesor]()
    
    @IBOutlet weak var nip: UITextField!
    @IBOutlet weak var usuario: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let urlString = "https://pastebin.com/raw/57w98pn2"
        let url = URL(string: urlString)
        let peticion = URLSession.shared.dataTask(with: url!) { (data, response, error) in
            //Verificar si existe algún error
            if(error != nil){
                print("Error: \(String(describing: error))")
            } else {
                do {
                    let json = try JSONSerialization.jsonObject(with: data!, options: .allowFragments) as! [[String: AnyObject]]
                    //print(json)
                    //Llenado de contenedor local (usuarios)
                    for user in json{
                        //Extraer la info
                        let codigo = user["codigo"] as! String
                        let name = user["name"] as! String
                        let nip = user["nip"] as! String
                        let curso = user["curso"] as! String
                        //Agregar info al arreglo
                        print(codigo)
                        print(name)
                        self.profe.append(Profesor(codigo: codigo, name: name, nip: nip, curso: curso))
                    }
                    
                    //Refrescar la tabla
                    OperationQueue.main.addOperation({
                        //self.tableView.reloadData()
                    })
                    
                } catch let error as NSError{
                    print(error)
                }
            }
        }
        
        peticion.resume()
        
    }
    
    @IBAction func Inicio(_ sender: UIButton) {
        let user = usuario.text
        let cont = nip.text
        for profes in profe{
            if (profes.codigo == user) && (profes.nip == cont ){
                let alerta=UIAlertController(title: "Bienvenido "+profes.name, message: "Materia: "+profes.curso, preferredStyle: UIAlertControllerStyle.alert)
                    alerta.addAction(UIAlertAction(title: "Cerrar", style: .default, handler: {(action) in self.performSegue(withIdentifier: "home", sender: self)}))
                    present(alerta, animated: true, completion: nil)
            }
            
        }
        if((usuario.text?.isEmpty)! || (nip.text?.isEmpty)!){
            let alerta=UIAlertController(title: "Error", message: "Rellena los datos", preferredStyle: UIAlertControllerStyle.alert)
            alerta.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            present(alerta, animated: true, completion: nil)
        }
        print(profe[0].codigo)
        let alerta=UIAlertController(title: "Error", message: "Usuario invalido", preferredStyle: UIAlertControllerStyle.alert)
        alerta.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alerta, animated: true, completion: nil)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
class Profesor{
    var codigo = ""
    var name = ""
    var nip = ""
    var curso = ""
    init(codigo: String, name: String, nip: String, curso: String) {
        self.codigo = codigo
        self.curso = curso
        self.name = name
        self.nip = nip
    }
    
}

