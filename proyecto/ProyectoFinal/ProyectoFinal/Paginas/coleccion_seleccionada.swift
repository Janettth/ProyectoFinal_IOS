//
//  coleccion_seleccionada.swift
//  ProyectoFinal
//
//  Created by alumno on 21/5/25.
//

import SwiftUI

struct ColeccionSeleccionada: View {
    @Environment(ControladorAplicacion.self) var controlador
    
    var body: some View {
        NavigationStack{
            ScrollView{
                VStack{
                    
                    ForEach(controlador.Imagenes_de_coleccion){ imagen in
                        NavigationLink{
                            
                        }label: {
                            
                            VStack{
                                
                                AsyncImage(url: URL(string: imagen.urls.regular)){ image in
                                    image.resizable()
                                } placeholder: {
                                    ProgressView()
                                }
                                .cornerRadius(20)
                                .frame(width: 170, height: 190)
                                .padding(5)
                                
                                Text(imagen.description ?? "no hay")
                                
                            }.background(  LinearGradient(gradient: Gradient(colors: [Color("ColorAmarilloClaro"), Color("ColorRosaClaro")]), startPoint: .top, endPoint: .bottom))
                            
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    ColeccionSeleccionada()
        .environment(ControladorAplicacion())
        
}
