//
//  pagina_imagenesinformacion.swift
//  ProyectoFinal
//
//  Created by alumno on 16/5/25.
//

import SwiftUI

var ejemplourlsej = urlImagen(regular: "https://www.hola.com/horizon/square/2ba9dcaea342-husky-t.jpg", small: "dfufrfrufr")

var ejemplourlsperfil = urlPerfil(small: "brjbr", medium: "edbjd", large: "ebjbejd")

var ejemplous = Usuario(id: "edhedeh", username: "bdejbedj", name: "njjdbde", profile_image: ejemplourlsperfil)
var imagenEjemplo = Imagen(id: "fbhfrb", description: "fbdfrbfjrf", user: ejemplous, urls: ejemplourlsej)

struct ImagenesInformacion: View {
    
    @Environment(ControladorAplicacion.self) var controlador
    
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
            
            
            NavigationLink{
                PerfilSeleccionado()
            }label:{
                
                HStack{
                    Text("Crado por:\(ImagenInformacion.user.username)")
                        .font(.system(size: 15))
                    
                    Spacer()
                }.frame(width: 300)
                    .padding(.leading)
                    .foregroundColor(.black)
                
            }.simultaneousGesture(TapGesture().onEnded({
                controlador.ver_perfil(username_selec: ImagenInformacion.user.username)
                
            }))
            
            
            
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
        .environment(ControladorAplicacion())
}
