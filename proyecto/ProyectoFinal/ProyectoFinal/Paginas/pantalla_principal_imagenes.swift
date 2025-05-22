//
//  pantalla_principal_imagenes.swift
//  ProyectoFinal
//
//  Created by alumno on 14/5/25.
//

import SwiftUI

struct PantallaPrincipal: View {
    
    @Environment(ControladorAplicacion.self) var controlador
    
    var body: some View {
        
            NavigationStack{
                ScrollView{
                    
                    
                    HStack{
                        
                        Text("Imagenes\nAleatorias")
                            .padding(20)
                            .foregroundColor(.green)
                            .font(.custom("Times", size: 50))
                        
                        Spacer()
                    }
                    
                    
                    LazyVGrid(columns: [ //probablemnte quite el grid porque no me convence
                        
                        GridItem(.flexible(minimum: 80, maximum: 250)),
                        GridItem(.flexible(minimum: 80, maximum: 250))
                        
                        
                    ]){
                        ForEach(controlador.Paginaresultados){
                            imagen in NavigationLink{
                                //Text("Hola \(imagen.urls.regular)")
                                ImagenesInformacion()
                            }label: {
                                
                                ZStack{
                                    RoundedRectangle(cornerSize: CGSize(width: 15, height: 15))
                                        .foregroundColor(Color.white)
                                        .opacity(0.8)
                                        .frame(height: 220)
                                      
                                        
                                    VStack{
                                     
                                        AsyncImage(url: URL(string: imagen.urls.regular)){ image in
                                            image.resizable()
                                        } placeholder: {
                                            ProgressView()
                                        }
                                        .cornerRadius(20)
                                        .frame(width: 150, height: 170)
                                        .padding(5)
                                        
                                        HStack{
                                            Text("\(imagen.user.username)")
                                                .font(.system(size: 13))
                                            Spacer()
                                        }
                                        .frame(width: 150, height: 15)
                                        .foregroundColor(.black)
                                     
                                        

                                        
                                    }
                                }
                                
                                
                            }.simultaneousGesture(TapGesture().onEnded({
                                controlador.descargar_imagen(id_imagen: imagen.id)
                            }))
                        }
                    }
                    
                } .padding(10)
                    /*.background(  LinearGradient(gradient: Gradient(colors: [Color("ColorRosaClaro"), Color("ColorRojo")]), startPoint: .top, endPoint: .leading))*/
                    .background(Color("ColorAmarilloClaro"))
                
            }
            
            
        }
}

#Preview {
    PantallaPrincipal()
        .environment(ControladorAplicacion())
}
