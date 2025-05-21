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
        NavigationStack{
            ScrollView{
                LazyVStack{
                    ForEach(controlador.colecciones){ coleccion in
                        NavigationLink{
                            
                        }label: {
                            Text(coleccion.title)
                            
                            /*AsyncImage(url: URL(string: coleccion.links.photos)){ image in
                                image.resizable()
                            } placeholder: {
                                ProgressView()
                            }
                            .cornerRadius(20)
                            .frame(width: 170, height: 190)
                            .padding(5)*/
                            
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    PaginaColecciones()
        .environment(ControladorAplicacion())
}
