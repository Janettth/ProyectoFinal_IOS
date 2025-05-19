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
    
    var PerfilSeleccionado: Usuario? = nil
    
    var Imagenes_de_perfil : Array<Imagen> = []
    
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
    
    
    func descargar_perfil(username_selec: String) async -> Void {
        guard let usuario : Usuario = try? await ImagenesAPI().descargar_perfil(username: username_selec) else {return}
        
        PerfilSeleccionado = usuario
    }
    
    func ver_perfil(username_selec: String) -> Void{
        Task.detached{
            await self.descargar_perfil(username_selec: username_selec)
            
            await self.descaragar_imagenes_perfil(username: username_selec)
        }
    }
    
    func descaragar_imagenes_perfil(username: String) async {
        guard let imagenes_perfil: [Imagen] = try? await
                ImagenesAPI().descargar_imagenes_de_perfil(username_para_imagen: username) else {return}
        
        Imagenes_de_perfil = imagenes_perfil
    }
    
}
