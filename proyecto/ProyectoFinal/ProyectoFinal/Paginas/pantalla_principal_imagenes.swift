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
                            .foregroundColor(.white)
                            .font(.custom("Times", size: 50))
                        
                        Spacer()
                    }
                    
                    
                    LazyVGrid(columns: [
                        
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
                                        
                                    VStack{
                                        AsyncImage(url: URL(string: imagen.urls.regular)){ image in
                                            image.resizable()
                                        } placeholder: {
                                            ProgressView()
                                        }
                                        .cornerRadius(20)
                                        .frame(width: 170, height: 190)
                                        .padding(5)
                                        
                                        HStack{
                                            Text("\(imagen.user.username)")
                                                .font(.system(size: 10))
                                            Spacer()
                                        }
                                        .frame(width: 150, height: 15)
                                        .foregroundColor(.black)
                                        .padding()
                                        
                                        
                                    }
                                }
                                
                                
                                
                            }.simultaneousGesture(TapGesture().onEnded({
                                controlador.descargar_imagen(id_imagen: imagen.id)
                            }))
                        }
                    }
                    
                } .padding(10)
                    .background(  LinearGradient(gradient: Gradient(colors: [Color("ColorAzul"), Color("ColoreCrema")]), startPoint: .top, endPoint: .leading))
                
            }
            
            
        }
}

#Preview {
    PantallaPrincipal()
        .environment(ControladorAplicacion())
}
