//
//  menu_avegacion.swift
//  ProyectoFinal
//
//  Created by alumno on 16/5/25.
//

import SwiftUI

struct MenuNavegacion: View {
    
    @Environment(ControladorAplicacion.self) var controlador
    var body: some View {
        
        //encontrar otro titulo porque este de hueva
        //buscar como hacer que aparescan mas de 10 fotos con la url
        TabView{
            PantallaPrincipal()
                .tabItem {
                    Label("Inicio", systemImage: "photo.on.rectangle.angled")
                }
            
            ImagenAleatoria()
                .tabItem {
                    Label("Random", systemImage: "shuffle") //falta hacer que sea aleatorio al dar clic
                }
            
            PaginaColecciones()
                .tabItem {
                    Label("Colecciones" , systemImage: "sparkles")
                }
        }
        
        
    }
}

#Preview {
    MenuNavegacion()
        .environment(ControladorAplicacion())
}
