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
                    Label("pantalla1", systemImage: "pencil")
                }
            
            ImagenAleatoria()
                .tabItem {
                    Label("pantalla2", systemImage: "pencil")
                }
            Rectangle()
                .tabItem {
                    Label("Shufle", systemImage: "shuffle")
                }
            
            Rectangle()
                .tabItem {
                    Label("Pantalla4" , systemImage: "pencil")
                }
        }
        
        
    }
}

#Preview {
    MenuNavegacion()
        .environment(ControladorAplicacion())
}
