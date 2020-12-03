//
//  ClimaManager.swift
//  AppClima
//
//  Created by Mac12 on 30/11/20.
//

import Foundation

protocol ClimaManagerDelegate {
    func actualizarClima(clima: ClimaModelo)
}

struct ClimaManager {
    var delegado: ClimaManagerDelegate?
    
    let climaURL = "https://api.openweathermap.org/data/2.5/weather?appid=698cb29c0a1e70d1a30a0a9982f6a95a&units=metric&lang=es"
    
    func fetchClima(nombreCiudad: String){
        let urlString = "\(climaURL)&q=\(nombreCiudad)"
        realizarSolicitud(urlString: urlString)
    }
    
    func realizarSolicitud(urlString: String){
        if let url = URL(string: urlString){
            let session = URLSession(configuration: .default)
            let tarea = session.dataTask(with: url) { (data, respuesta, error) in
                if error != nil {
                    print(error!)
                    return
                }
                if let datosSeguros = data {
                    if let clima = self.parseJSON(climaData: datosSeguros){
                        print("realizarSolicitud")
                        delegado?.actualizarClima(clima: clima)
                    }
                }
            }
            tarea.resume()
        }
    }
    
    func parseJSON(climaData: Data) -> ClimaModelo? {
        let decoder = JSONDecoder()
        do{
            let dataDecodificada = try decoder.decode(ClimaData.self, from: climaData)
            let id = dataDecodificada.weather[0].id
            let nombre = dataDecodificada.name
            let descripcion = dataDecodificada.weather[0].description
            let temperatura = dataDecodificada.main.temp
            let ObjClima = ClimaModelo(condicionID: id, nombreCiudad: nombre, descripcionClima: descripcion, temperaturaCelsius: temperatura)
            print("parseJSON")
            return ObjClima
        } catch{
            print(error)
            return nil
        }
    }
}
