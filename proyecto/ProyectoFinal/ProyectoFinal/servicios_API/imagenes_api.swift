//
//  imagenes_api.swift
//  ProyectoFinal
//
//  Created by alumno on 12/5/25.
//

import SwiftUI

class ImagenesAPI: Codable{
    let url_base = "https://api.unsplash.com/"
    let accesskey = "THNOFvVX69hdvSrcYwrqmWzcKhjLEmUfy21HC34iPVs"
    
    func descaragar_imagenes() async -> PaginaImagenes?{
        let endpoint = "/photos"
        
        return await descargar(recurso: endpoint)
    }

    private func descargar<TipoGenerico: Codable>(recurso: String) async ->
    TipoGenerico?{
        
        do{
            guard let url = URL(string: "\(url_base)\(recurso)") else { throw
                ErroresDeRed.BadRequest}
            
            let(datos, respuesta) = try await URLSession.shared.data(from: url)
            
            
        }
            
    }
}
