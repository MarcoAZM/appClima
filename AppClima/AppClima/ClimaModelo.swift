//
//  ClimaModelo.swift
//  AppClima
//
//  Created by Mac12 on 02/12/20.
//

import Foundation

struct ClimaModelo {
    let condicionID: Int
    let nombreCiudad: String
    let descripcionClima: String
    let temperaturaCelsius: Double
    
    var condicionClima: String {
        switch condicionID {
        case 200...232:
            return "cloud.bolt"
        case 701...781:
            return "cloud.fog"
        case 800:
            return "sun.min"
        default:
            return "cloud"
        }
    }
    
    var temperaturaDecimal: String {
        return String(format: "%.1f%", temperaturaCelsius)
    }
}
