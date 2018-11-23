//
//  Perfil.swift
//  Easy Assistant
//
//  Created by Karen on 31/10/18.
//  Copyright © 2018 Karen. All rights reserved.
//

import UIKit

class Perfil: UIViewController {
    
    @IBOutlet var nombre: UILabel!
    @IBOutlet var materia: UILabel!
    @IBOutlet var nivel: UILabel!
    @IBOutlet var grupo: UILabel!
    @IBOutlet var correo: UILabel!
    @IBOutlet var telefono: UILabel!
    @IBOutlet var imagen: UIImageView!
    
    var paso:Int!
    override func viewDidLoad() {
        super.viewDidLoad()
        nombre.text = alumnos[paso].nombre
        materia.text = alumnos[paso].materia
        nivel.text = alumnos[paso].nivel
        grupo.text = alumnos[paso].grupo
        correo.text = alumnos[paso].correo
        telefono.text = alumnos[paso].telefono
        imagen.image = alumnos[paso].imagen
    }
    

    

}
