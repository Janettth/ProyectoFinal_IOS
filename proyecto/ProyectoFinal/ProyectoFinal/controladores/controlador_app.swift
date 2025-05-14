//
//  controlador_app.swift
//  ProyectoFinal
//
//  Created by alumno on 14/5/25.
//

import SwiftUI

@Observable
@MainActor

public class ControladorAplicacion{
    var Paginaresultados: PaginaImagenes? = nil
    
    init(){
        Task.detached(priority: .high){
            await self.descaragar_imagenes()
        }
    }
    
    
    func descaragar_imagenes() async {
        guard let imagenes_descargadas: PaginaImagenes = try? await
                ImagenesAPI().descaragar_imagenes() else {return}
        
        self.Paginaresultados = imagenes_descargadas
    }
}
