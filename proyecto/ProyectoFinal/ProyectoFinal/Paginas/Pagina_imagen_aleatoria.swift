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
        
        ZStack{
            
            /*LinearGradient(gradient: Gradient(colors: [Color.red, Color.blue]), startPoint: .bottom, endPoint: .trailing)*/
            VStack{
                Spacer()
                
                Text("El universo \nquiere que \nveas esta foto:")
                    .multilineTextAlignment(.leading)
                    .foregroundColor(.green)
                    .font(.custom("Times", size: 40))
                
                Spacer()
                
                AsyncImage(url: URL(string: imagenAleatoria?.urls.regular ?? "https://static.nationalgeographic.es/files/styles/image_3200/public/nationalgeographic_1468962.jpg?w=1900&h=1400")){ image in
                    image.resizable()
                } placeholder: {
                    ProgressView()
                }.frame(width: 340, height: 440)
                    .cornerRadius(25)
                
                Spacer()
            }
            .padding(20)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(  LinearGradient(gradient: Gradient(colors: [Color("ColorAmarilloClaro"), Color("ColorRosaClaro")]), startPoint: .top, endPoint: .bottom))
            
            //.background(Color.blue)
            
            
        }
        
        
    }
}

#Preview {
    ImagenAleatoria()
        .environment(ControladorAplicacion())
}
