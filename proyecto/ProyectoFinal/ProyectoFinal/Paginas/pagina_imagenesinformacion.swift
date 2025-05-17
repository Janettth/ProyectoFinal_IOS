//
//  pagina_imagenesinformacion.swift
//  ProyectoFinal
//
//  Created by alumno on 16/5/25.
//

import SwiftUI

var ejemplourlsej = urlImagen(regular: "https://www.hola.com/horizon/square/2ba9dcaea342-husky-t.jpg", small: "dfufrfrufr")
var ejemplous = Usuario(id: "eferf", username: "ffrnfjr", name: "bfbejfebfj")
var imagenEjemplo = Imagen(id: "fbhfrb", description: "fbdfrbfjrf", user: ejemplous, urls: ejemplourlsej)

struct ImagenesInformacion: View {
    
    var ImagenInformacion: Imagen
    var body: some View {
        
        VStack{
            
            Spacer()
            
            
            
                
            
            AsyncImage(url: URL(string: ImagenInformacion.urls.regular)){ image in
                image.resizable()
            } placeholder: {
                ProgressView()
            }
            .cornerRadius(20)
            .frame(width: 300, height: 300)
            .padding(5)
            
            
            
            HStack{
                Text("Crado por:\(ImagenInformacion.user.username)")
                    .font(.system(size: 15))
                
                Spacer()
            }.frame(width: 300)
                .padding(.leading)
            
            
            Text(ImagenInformacion.description ?? "Sin descripción")
                .padding(10)
                .multilineTextAlignment(.leading)
                
            
            Spacer()
        }
        
        .frame(width: .infinity, height: .infinity)
        .padding(50)
        .background(Color.blue)
        
        
        
    }
}

#Preview {
    ImagenesInformacion(ImagenInformacion: imagenEjemplo)
}
