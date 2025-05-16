//
//  pagina_imagenes_obtenidas.swift
//  ProyectoFinal
//
//  Created by alumno on 12/5/25.
//

struct Imagen: Identifiable, Codable{
    let id: String
    let description : String?
    let user : Usuario
    let urls : urlImagen
}

