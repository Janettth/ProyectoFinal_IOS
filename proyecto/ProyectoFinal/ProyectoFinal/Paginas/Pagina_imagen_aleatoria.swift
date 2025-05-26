//
//  Pagina_imagen_aleatoria.swift
//  ProyectoFinal
//
//  Created by alumno on 16/5/25.
//

import SwiftUI

struct ImagenAleatoria: View {
    
    @Environment(ControladorAplicacion.self) var controlador
    var body: some View {
        
        let imagenAleatoria = controlador.ImagenRandom
        
        NavigationStack{
            ZStack{
                
                /*LinearGradient(gradient: Gradient(colors: [Color.red, Color.blue]), startPoint: .bottom, endPoint: .trailing)*/
                VStack{
                    
                    
                    NavigationLink{
                        ImagenesInformacion()
                    }label: {
                        VStack{
                            
                            HStack{
                                Text("Tu foto del momento")
                                    .bold()
                                    .multilineTextAlignment(.leading)
                                    .foregroundColor(Color("ColorBaseUno"))
                                    .font(.custom("Arial", size: 45))
                                Spacer()
                            }
                            .frame(width: 330, height: 200)
                            
                            AsyncImage(url: URL(string: imagenAleatoria?.urls.regular ?? "https://static.nationalgeographic.es/files/styles/image_3200/public/nationalgeographic_1468962.jpg?w=1900&h=1400")){ image in
                                image.resizable()
                            } placeholder: {
                                ProgressView()
                            }.frame(width: 340, height: 440)
                                .cornerRadius(25)
                            
                        }
                        
                        
                    }.simultaneousGesture(TapGesture().onEnded({
                        controlador.descargar_imagen(id_imagen: controlador.ImagenRandom!.id)
                    }))
                    
                    
        
                    NavigationLink{
                        PerfilSeleccionado()
                    }label: {
                        
                        
                        HStack{
                            
                            AsyncImage(url: URL(string: imagenAleatoria?.user.profile_image.large ?? "https://static.nationalgeographic.es/files/styles/image_3200/public/nationalgeographic_1468962.jpg?w=1900&h=1400")){ image in
                                image.resizable()
                            } placeholder: {
                                ProgressView()
                            }.frame(width: 45, height: 45)
                                .cornerRadius(25)
                            
                            Text(imagenAleatoria?.user.username ?? "username")
                                .foregroundStyle(Color("ColorBaseUno"))
                                .font(.system(size: 18))
                              
                            Spacer()
                        }
                        .frame(width: 300, height: 40)
                        .padding(10)
                        
                    }.simultaneousGesture(TapGesture().onEnded({
                        controlador.ver_perfil(username_selec: imagenAleatoria?.user.username ?? "")
                    }))
                }
                .padding(20)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                /*.background(  LinearGradient(gradient: Gradient(colors: [Color("ColorBaseUno"), Color("ColorBaseDos")]), startPoint: .center, endPoint: .bottom))*/
                
                .background(Color("ColorBaseDos"))
                Spacer()
                
            }.onAppear{
                Task{
                    await controlador.descargar_imagen_random()
                }
            }
            
        }
    }
}

#Preview {
    ImagenAleatoria()
        .environment(ControladorAplicacion())
}
