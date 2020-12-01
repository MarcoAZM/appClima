//
//  ClimaManager.swift
//  AppClima
//
//  Created by Mac12 on 30/11/20.
//

import Foundation

struct ClimaManager {
    let climaURL = "https://api.openweathermap.org/data/2.5/weather?appid=698cb29c0a1e70d1a30a0a9982f6a95a&units=metric"
    
    func fetchClima(nombreCiudad: String){
        let urlString = "\(climaURL)&q=\(nombreCiudad)"
        realizarSolicitud(urlString: urlString)
    }
    
    func realizarSolicitud(urlString: String){
        if let url = URL(string: urlString){
            let session = URLSession(configuration: .default)
            let tarea = session.dataTask(with: url, completionHandler: handle(data:respuesta:error:))
            tarea.resume()
        }
    }
    
    func handle(data: Data?, respuesta: URLResponse?, error: Error?){
        if error != nil {
            print(error!)
            return
        }
        if let datosSeguros = data {
            let dataString = String(data: datosSeguros, encoding: .utf8)
            print(dataString!)
        }
    }
}
