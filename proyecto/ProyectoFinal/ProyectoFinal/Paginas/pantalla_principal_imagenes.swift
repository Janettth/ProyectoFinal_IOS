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
                        
                        Text("Random\nPics :)")
                            .padding(20)
                            .foregroundColor(.black)
                            .font(.custom("Arial", size: 50))
                        
                        Spacer()
                    }
                    
                    
                    LazyVGrid(columns: [ //
                        
                        GridItem(.flexible(minimum: 80, maximum: 250)),
                        GridItem(.flexible(minimum: 80, maximum: 250))
                        
                        
                    ]){
                        ForEach(controlador.Paginaresultados){
                            imagen in NavigationLink{
                                //Text("Hola \(imagen.urls.regular)")
                                ImagenesInformacion()
                            }label: {
                                
                                VStack{
                                 
                                    AsyncImage(url: URL(string: imagen.urls.regular)){ image in
                                        image.resizable()
                                    } placeholder: {
                                        ProgressView()
                                    }
                                    .cornerRadius(20)
                                    .frame(width: 175, height: 200)
                                    .padding(5)
                                    
                                 
                                }
                                
                                
                                
                            }.simultaneousGesture(TapGesture().onEnded({
                                controlador.descargar_imagen(id_imagen: imagen.id)
                            }))
                        }
                    }
                    
                } .padding(10)
                    .background(  LinearGradient(gradient: Gradient(colors: [Color("ColorBaseDos"), Color("ColorBaseUno")]), startPoint: .top, endPoint: .bottom))
                    //.background(Color("ColorAmarilloClaro"))
                
            }
            
            
        }
}

#Preview {
    PantallaPrincipal()
        .environment(ControladorAplicacion())
}
