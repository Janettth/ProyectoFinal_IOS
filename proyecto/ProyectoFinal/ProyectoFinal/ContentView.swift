//
//  ContentView.swift
//  ProyectoFinal
//
//  Created by alumno on 9/5/25.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        MenuNavegacion()
    }
}

#Preview {
    ContentView()
        .environment(ControladorAplicacion())
}
