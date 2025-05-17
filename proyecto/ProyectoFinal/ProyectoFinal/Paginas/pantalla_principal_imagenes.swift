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
                
                
                ZStack{
                    LinearGradient(gradient: Gradient(colors: [Color.red, Color.blue]), startPoint: .bottom, endPoint: .trailing)
                    
                    Text("Imagenes\nAleatorias")
                        .padding(20)
                        .multilineTextAlignment(.leading)
                        .foregroundColor(.white)
                        .font(.custom("Times", size: 80))
                        
                }
                
                
                LazyVGrid(columns: [
                    
                    GridItem(.flexible(minimum: 80, maximum: 250)),
                    GridItem(.flexible(minimum: 80, maximum: 250))
                    
                
                ]){
                    ForEach(controlador.Paginaresultados){
                        imagen in NavigationLink{
                            //Text("Hola \(imagen.urls.regular)")
                            ImagenesInformacion(ImagenInformacion: imagen)
                        }label: {
                            
                            AsyncImage(url: URL(string: imagen.urls.regular)){ image in
                                image.resizable()
                            } placeholder: {
                                ProgressView()
                            }
                            .cornerRadius(20)
                            .frame(width: 170, height: 190)
                            .padding(5)

                        }
                    }
                }
                
            } .padding(10)
            .background(Color.red)
               
        }
   
    
    }
}

#Preview {
    PantallaPrincipal()
        .environment(ControladorAplicacion())
}
