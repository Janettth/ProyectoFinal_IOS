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
                        
                        VStack{
                            
                            Spacer()
                            
                            Text("\(controlador.PerfilSeleccionado?.username) ")
                                .foregroundColor(.green)
                            
                            AsyncImage(url: URL(string: controlador.PerfilSeleccionado?.profile_image.large ?? "https://static.nationalgeographic.es/files/styles/image_3200/public/336939012_834362331624638_3334172855623225389_n.jpg?w=1900&h=1425")){ image in
                                image.resizable()
                            } placeholder: {
                                ProgressView()
                            }.frame(width: 170, height: 170)
                                .cornerRadius(100)
                            
                            
                            
                            
                            
                            
                            Text("\(controlador.PerfilSeleccionado?.name) ")
                                .foregroundColor(.green)
                            
                            
                            HStack{
                                Text("Más de \(controlador.PerfilSeleccionado?.id)")
                                    .font(.custom("Times", size: 20))
                                    .foregroundColor(.green)
                                Spacer()
                                
                            }
                           
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
                                                }.frame(width: 150, height: 170)
                                                    .cornerRadius(25)
                                                
                                            }
                                            
                                        }.simultaneousGesture(TapGesture().onEnded({
                                            controlador.descargar_imagen(id_imagen: imagen.id)
                                        }))
                                    }
                                }
                            }
                        }
                    }
                    .padding(40)
                    .background(  LinearGradient(gradient: Gradient(colors: [Color("ColorAmarilloClaro"), Color("ColorRosaClaro")]), startPoint: .top, endPoint: .bottom))
                       
                }
            }
            
           
        }.frame(width: .infinity, height: .infinity)
      
    }
}

#Preview {
    PerfilSeleccionado()
        .environment(ControladorAplicacion())
}
