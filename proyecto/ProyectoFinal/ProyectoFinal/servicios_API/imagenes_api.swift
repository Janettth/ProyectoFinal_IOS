//
//  imagenes_api.swift
//  ProyectoFinal
//
//  Created by alumno on 12/5/25.
//

import SwiftUI

class ImagenesAPI: Codable{
    let url_base = "https://api.unsplash.com/"
    //let accesskey = "THNOFvVX69hdvSrcYwrqmWzcKhjLEmUfy21HC34iPVs" //esta es la key primera
    let accesskey = "9VQvEkap4123YivIRyEQVoahXDKW-vm2ww5-sCPLjRo" //esta es la key segunda
    
    func descaragar_imagenes() async throws -> [Imagen]?{
        let endpoint = "/photos?per_page=30"
        
        return await descargar(recurso: endpoint)
    }
    
    func descargar_imagen_random() async -> Imagen?{
        let endpoint = "/photos/random"
        
        return await descargar(recurso: endpoint)
    }
    
    func descargar_perfil(username: String) async -> Usuario? {
        let endpoint = "/users/\(username)"
        
        return await descargar(recurso: endpoint)
    }
    
    func descargar_imagenes_de_perfil(username_para_imagen: String) async -> [Imagen]?{
        let endpoint = "/users/\(username_para_imagen)/photos"
        return await descargar(recurso: endpoint)
    }
    
    func decsargar_imagen_selecionada(id: String) async -> Imagen?{
        
        let enpoint = "/photos/\(id)"
        return await descargar(recurso: enpoint)
    }
    
    
    
    func descargar_coleccion() async throws -> [Coleccion]?{
        let endpoint = "/collections"
        
        return await descargar(recurso: endpoint)
    }
    
    func descargar_imagenes_coleccion(id_coleccion: String) async throws -> [Imagen]?{
        let endpoint = "/collections/\(id_coleccion)/photos"
        
        return await descargar(recurso: endpoint)
    }
    
    
    private func descargar<TipoGenerico: Codable>(recurso: String) async  -> TipoGenerico?{
        
        do{
            guard let url = URL(string: "\(url_base)\(recurso)") else { throw ErroresDeRed.malaDireccionUrl}
            
            var request = URLRequest(url: url)
            request.setValue("Client-ID \(accesskey)", forHTTPHeaderField: "Authorization")
            
            let (datos, respuesta) = try await URLSession.shared.data(for: request)
            
            guard let respuesta = respuesta as? HTTPURLResponse else {throw ErroresDeRed.badResponse}
            
            guard respuesta.statusCode >= 200 && respuesta.statusCode < 300 else {
                throw ErroresDeRed.badStatus}
            
            do{
                let respuesta_decodificada = try JSONDecoder().decode(TipoGenerico.self, from: datos)
                return respuesta_decodificada
            }
            catch let error as NSError{
                print("El error en tu modelo es: \(error.debugDescription)")
                throw ErroresDeRed.fallaAlConvertirLaRespuesta
            }
            //return respuesta_decodificada
        }
        
        catch ErroresDeRed.malaDireccionUrl {
            print("mala url")
        }
        
        catch ErroresDeRed.badResponse {
            print("algo esta mal con la respuesta")
        }
        catch ErroresDeRed.badStatus {
            print("estatus negativo")
        }
        catch ErroresDeRed.fallaAlConvertirLaRespuesta {
            print("mal modelo y su implementacion")
        }
        
        catch ErroresDeRed.invalidRequest {
            print("¿como llegasta hasta aqui?")
        }
        catch{
            print("Algo nalo acaba de suceder")
        }
        return nil
    }
}
