//
//  ViewController.swift
//  informacion
//
//  Created by Alumno on 10/1/19.
//  Copyright © 2019 Alumno. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var contactos : [Contacto] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        contactos.append(Contacto(nombre: "Juan", telefono: "1542789325", direccion: "calle 1 #1", correo: "juan@algo.com", foto: "foto1"))
        contactos.append(Contacto(nombre: "Jose", telefono: "4201325478", direccion: "calle 2 #2", correo: "jose@algo.com", foto: "foto2"))
        contactos.append(Contacto(nombre: "Joel", telefono: "5012478962", direccion: "calle 3 #3", correo: "joel@algo.com", foto: "foto3"))
        contactos.append(Contacto(nombre: "Joaquin", telefono: "2011401287", direccion: "calle 4 #4", correo: "joaquin@algo.com", foto: "foto4"))
    }

    func numberOfSections(in tableView: UITableView) -> Int {
            return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contactos.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celda = tableView.dequeueReusableCell(withIdentifier: "celdaContacto") as? CeldaContactoController
        
        celda?.imgContacto.image = UIImage(named: contactos[indexPath.row].foto!)
        celda?.lblNombre.text = contactos[indexPath.row].nombre
        celda?.lblTelefono.text = contactos[indexPath.row].telefono
        
        return celda!
    }
    
    @IBOutlet weak var TVContactos: UITableView!
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToEditar"{
            let destino = segue.destination as? EditarContactoController
            destino?.contacto = contactos[TVContactos.indexPathForSelectedRow!.row]
            destino?.callbackActuaizarTabla = recargarTabla
        } else if segue.identifier == "goToAdd"{
            let destino = segue.destination as? EditarContactoController
            contactos.append(Contacto(nombre: "", telefono: "", direccion: "", correo: "", foto: "foto4"))
            destino?.contacto = contactos[contactos.count-1]
            destino?.callbackActuaizarTabla = recargarTabla
        }
    }
    
    func recargarTabla(){
        TVContactos.reloadData()
    }

    @IBAction func doTapAgregar(_ sender: Any) {
        contactos.append(Contacto(nombre: "Felipe", telefono: "4521302147", direccion: "calle 5 #5", correo: "felipe@algo.com", foto: "foto4"))
        TVContactos.reloadData()
    }
}

