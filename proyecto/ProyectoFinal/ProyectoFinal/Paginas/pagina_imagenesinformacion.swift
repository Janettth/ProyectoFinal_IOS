//
//  pagina_imagenesinformacion.swift
//  ProyectoFinal
//
//  Created by alumno on 16/5/25.
//

import SwiftUI


struct ImagenesInformacion: View {
    
    @Environment(ControladorAplicacion.self) var controlador
    
    var body: some View {
        
        VStack{
            
            NavigationLink{
                PerfilSeleccionado()
            }label: {
                HStack{
                   
                    AsyncImage(url: URL(string: controlador.imagen_seleccionada?.user.profile_image.large ?? "https://www.radioromance.com/wp-content/uploads/2025/01/PATOS.jpeg")){ image in
                        image.resizable()
                    } placeholder: {
                        ProgressView()
                    }
                    .cornerRadius(100)
                    .frame(width: 50, height: 50)
                    .padding(5)
                    
                    Text(controlador.imagen_seleccionada?.user.username ?? "nul")
                    
                    Spacer()
                    
                }
                
                .frame(width: 320, height: 30)
                .padding()
            }.simultaneousGesture(TapGesture().onEnded({
                controlador.ver_perfil(username_selec: controlador.imagen_seleccionada?.user.username ?? "")
            }))
            

            AsyncImage(url: URL(string: controlador.imagen_seleccionada?.urls.regular ?? "https://wwflac.awsassets.panda.org/img/young_panda__brad_josephs_720115.jpg")){ image in
                image.resizable()
            } placeholder: {
                ProgressView()
            }
            .cornerRadius(20)
            .frame(width: 350, height: 350)
            .padding(5)
            
            
            Text("\(controlador.imagen_seleccionada?.description ?? "" )")
                .multilineTextAlignment(.leading)
            
        }
    }
}

#Preview {
    ImagenesInformacion()
        .environment(ControladorAplicacion())
}
