//
//  Alumnos.swift
//  Easy Assistant
//
//  Created by Karen on 31/10/18.
//  Copyright © 2018 Karen. All rights reserved.
//

import UIKit
var alumnos:[Alumno] = []
class Alumnos: UIViewController, UITableViewDataSource, UITableViewDelegate{
    
    @IBOutlet weak var jku: UITableView!
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    override func viewWillAppear(_ animated: Bool) {
        jku.reloadData()
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return alumnos.count
    }
    var x = 0
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "celda", for: indexPath) as! Veer
        cell.imagen.image = alumnos[indexPath.row].imagen
        cell.nombre.text = alumnos[indexPath.row].nombre
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        x=indexPath.row
        self.performSegue(withIdentifier: "paso", sender: self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let DestViewController = segue.destination as! Perfil
        DestViewController.paso = x
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        jku.dataSource = self
        jku.delegate = self
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
}
class Veer:UITableViewCell{
    @IBOutlet var imagen: UIImageView!
    @IBOutlet var nombre: UILabel!
    
}
class Alumno{
    
    var nombre = String()
    var materia = String()
    var nivel = String()
    var grupo = String()
    var correo = String()
    var telefono = String()
    var imagen = UIImage()
    
    init(nombre: String, materia: String,nivel: String,grupo: String,correo: String,telefono: String,imagen: UIImage) {
        self.nombre = nombre
        self.materia = materia
        self.nivel = nivel
        self.grupo = grupo
        self.correo = correo
        self.telefono = telefono
        self.imagen = imagen
    }
}
