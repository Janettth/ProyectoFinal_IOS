//
//  pagina_colecciones.swift
//  ProyectoFinal
//
//  Created by alumno on 19/5/25.
//

import SwiftUI

struct PaginaColecciones: View {
    @Environment(ControladorAplicacion.self) var controlador
    var body: some View {
        Text("hola mundo")
    }
}

#Preview {
    PaginaColecciones()
        .environment(ControladorAplicacion())
}
