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
            
            LinearGradient(gradient: Gradient(colors: [Color.red, Color.blue]), startPoint: .bottom, endPoint: .trailing)

            VStack{
                Spacer()
                
                Text("El universo quiere que veas esta foto:")
                    .multilineTextAlignment(.leading)
                    .foregroundColor(.white)
                    .font(.custom("Times", size: 40))
                
                Spacer()
                
                AsyncImage(url: URL(string: imagenAleatoria?.urls.regular ?? "")){ image in
                    image.resizable()
                } placeholder: {
                    ProgressView()
                }.frame(width: 350, height: 450)
                    .cornerRadius(25)
                
                Spacer()
            }
            .padding(20)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            
            //.background(Color.blue)
            
            
        }
        
        
    }
}

#Preview {
    ImagenAleatoria()
        .environment(ControladorAplicacion())
}
