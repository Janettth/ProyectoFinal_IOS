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
    
    var ImagenRandom: Imagen? = nil
    
    init(){
        Task.detached(priority: .high){
            await self.descaragar_imagenes()
            
            await self.descargar_imagen_random()
        }
    }
    
    
    func descaragar_imagenes() async {
        guard let imagenes_descargadas: [Imagen] = try? await
                ImagenesAPI().descaragar_imagenes() else {return}
        
        Paginaresultados = imagenes_descargadas
    }
    
    func descargar_imagen_random() async {
        guard let ImagenRandom_descargada: Imagen = try? await
                ImagenesAPI().descargar_imagen_random() else {return}
        
        ImagenRandom = ImagenRandom_descargada
    }
    
}
