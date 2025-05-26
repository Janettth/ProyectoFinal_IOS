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
                
                
                
                LazyVStack{
                    ForEach(controlador.Imagenes_de_coleccion){ imagenColec in
                        NavigationLink(){
                            ImagenesInformacion()
                        }label: {
                            ZStack{
                                
                                RoundedRectangle(cornerSize: CGSize(width: 15, height: 15))
                                    .frame(width: 360, height: 400)
                                    .foregroundColor(Color("ColorBaseDos"))
                                  
                                
                                VStack{
                                    AsyncImage(url: URL(string: imagenColec.urls.regular)){ image in
                                        image.resizable()
                                    } placeholder: {
                                        ProgressView()
                                    }
                                    .frame(width: 320, height: 250)
                                 
                                    .cornerRadius(25)
                                    
                                    HStack{
                                        AsyncImage(url: URL(string: imagenColec.user.profile_image.large )){ image in
                                            image.resizable()
                                        } placeholder: {
                                            ProgressView()
                                        }
                                        .frame(width: 50, height: 50)
                                        .cornerRadius(100)
                                        .padding(10)
                                        
                                        Text(imagenColec.user.username)
                                            .foregroundStyle(Color.white)
                                            .font(.title3)
                                        Spacer()
                                    }
                                    .frame(width: 320)
                                    
                                }
                            }.padding()
                            Spacer()
                            
                                
                        }.simultaneousGesture(TapGesture().onEnded({
                            controlador.descargar_imagen(id_imagen: imagenColec.id)
                        }))
                    }
                }
                
            }
            /*.background(  LinearGradient(gradient: Gradient(colors: [Color("ColorAmarilloClaro"), Color("ColorRosaClaro")]), startPoint: .top, endPoint: .bottom))*/
            .background(Color("ColorBaseUno"))
        }
    }
}

#Preview {
    ColeccionSeleccionada()
        .environment(ControladorAplicacion())
        
}
