//
//  pantalla_principal_imagenes.swift
//  ProyectoFinal
//
//  Created by alumno on 14/5/25.
//

import SwiftUI

struct PantallaPrincipalImagenes: View {
    
    @Environment(ControladorAplicacion.self) var controlador
    
    var body: some View {
        Text("hola\(controlador.Paginaresultados?.user)")
    }
}

#Preview {
    PantallaPrincipalImagenes()
        .environment(ControladorAplicacion())
}
