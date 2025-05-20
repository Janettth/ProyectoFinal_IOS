//
//  pantalla_perfil_seleccionado.swift
//  ProyectoFinal
//
//  Created by alumno on 19/5/25.
//

import SwiftUI

struct PerfilSeleccionado: View {
    @Environment(ControladorAplicacion.self) var controlador
    
    var body: some View {
        VStack{
          
            
            
            if(controlador.Imagenes_de_perfil != nil){
                NavigationStack{
                    ScrollView{
                        
                        
                        Spacer()
                        
                        AsyncImage(url: URL(string: controlador.PerfilSeleccionado?.profile_image.large ?? "https://static.nationalgeographic.es/files/styles/image_3200/public/336939012_834362331624638_3334172855623225389_n.jpg?w=1900&h=1425")){ image in
                            image.resizable()
                        } placeholder: {
                            ProgressView()
                        }.frame(width: 170, height: 170)
                            .cornerRadius(100)
                        
                        
                        Text("Usuario: \(controlador.PerfilSeleccionado?.username) ")
                        
                        
                       
                        Text("Usuario: \(controlador.PerfilSeleccionado?.name) ")
                        
                        
                        VStack{
                            
                            LazyVGrid(columns: [
                                
                                GridItem(.flexible(minimum: 80, maximum: 250)),
                                GridItem(.flexible(minimum: 80, maximum: 250))
                                
                            
                            ]){
                                
                                ForEach(controlador.Imagenes_de_perfil){
                                    imagen in
                                    NavigationLink{
                                        ImagenesInformacion()
                                    }label: {
                                        
                                        VStack{
                                            AsyncImage(url: URL(string: imagen.urls.regular)){ image in
                                                image.resizable()
                                            } placeholder: {
                                                ProgressView()
                                            }.frame(width: 170, height: 170)
                                                .cornerRadius(25)
                                                
                                        }
                                        
                                    }
                                }//llamar aqui a la informacion imagen
                            }
                        }
                    }
                }
            }
            
           
        }
    }
}

#Preview {
    PerfilSeleccionado()
        .environment(ControladorAplicacion())
}
