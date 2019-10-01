//
//  Contacto.swift
//  informacion
//
//  Created by Alumno on 10/1/19.
//  Copyright © 2019 Alumno. All rights reserved.
//

import Foundation

class Contacto {
    var nombre : String?
    var telefono : String?
    var direccion : String?
    var correo : String?
    var foto : String?
    
    init(nombre:String, telefono:String, direccion:String, correo:String, foto:String){
        self.nombre = nombre
        self.telefono = telefono
        self.direccion = direccion
        self.correo = correo
        self.foto = foto
    }
}
