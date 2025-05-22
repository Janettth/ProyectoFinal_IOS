//
//  coleccion.swift
//  ProyectoFinal
//
//  Created by alumno on 21/5/25.
//

struct Coleccion: Identifiable, Codable{
    let id: String
    let title: String
    let description : String?
    let cover_photo: Imagen
    let user : Usuario
    let links : LinksColeccion
}
