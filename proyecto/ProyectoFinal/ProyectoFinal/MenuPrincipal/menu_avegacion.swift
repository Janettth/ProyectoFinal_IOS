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
        
    
        TabView{
            PantallaPrincipal()
                .tabItem {
                    Label("Inicio", systemImage: "photo.on.rectangle.angled")
                        
                }
    
            ImagenAleatoria()
                .tabItem {
                    Label("Random", systemImage: "shuffle")
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
