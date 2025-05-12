//
//  pagina_imagenes_obtenidas.swift
//  ProyectoFinal
//
//  Created by alumno on 12/5/25.
//

struct PaginaImagenes: Codable{
    let id: String
    let description : String
    let user : [Usuario]
    let urls : [urls_imagene]
}

