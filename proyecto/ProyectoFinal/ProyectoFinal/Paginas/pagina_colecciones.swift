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
                    HStack{
                        Text("COLEC-\nCIONES")
                            .font(.custom("Times", size: 55))
                       
                        Spacer()
                    }
                    .frame(width: 350)
                    .padding()
                    .foregroundColor(.green)
                    
                    ForEach(controlador.colecciones){ coleccion in
                        NavigationLink{
                            ColeccionSeleccionada()
                        }label: {
                            
                           
                            
                            ZStack{
                                
                                ZStack{
                                    AsyncImage(url: URL(string: coleccion.cover_photo.urls.regular)){ image in
                                        image.resizable()
                                    } placeholder: {
                                        ProgressView()
                                    }
                                    .cornerRadius(20)
                                    .frame(width: 350, height: 190)
                                    .padding(5)
                                    
                                    
                                    RoundedRectangle(cornerSize: CGSize(width: 25, height: 25))
                                        .foregroundColor(.white)
                                        .opacity(0.25)
                                    
                                }
                                Text(coleccion.title).foregroundStyle(Color.white)
                                    .bold()
                                    .font(.custom("Times", size: 35))
                            }
                          
                            
                            
                            
                        }.simultaneousGesture(TapGesture().onEnded({
                            controlador.descargar_imagenes_colec(id_colec: coleccion.id)
                        }))
                    }
                }
                
            }.background(  LinearGradient(gradient: Gradient(colors: [Color("ColorAmarilloClaro"), Color("ColorRosaClaro")]), startPoint: .top, endPoint: .bottom))
        }
    }
}

#Preview {
    PaginaColecciones()
        .environment(ControladorAplicacion())
}
