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
    var Paginaresultados: Array<Imagen> = []
    
    init(){
        Task.detached(priority: .high){
            await self.descaragar_imagenes()
        }
    }
    
    
    func descaragar_imagenes() async {
        guard let imagenes_descargadas: [Imagen] = try? await
                ImagenesAPI().descaragar_imagenes() else {return}
        
        Paginaresultados = imagenes_descargadas
    }
}
