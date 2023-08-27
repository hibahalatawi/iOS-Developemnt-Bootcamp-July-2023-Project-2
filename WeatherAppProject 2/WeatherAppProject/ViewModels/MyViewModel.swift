//
//  MyViewModel.swift
//  WeatherAppProject
//
//  Created by Hibah Abdullah Alatawi on 02/02/1445 AH.
//

import Foundation
import SwiftUI


class WeatherViewModel: ObservableObject {
    @Published var weatherData: WeatherData?
    @Published var errorMessage: String?
    
    func loadDate(for city: String) {
        guard let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?q=\(city)&appid=a7991ff71fad594fcc4d888ed6b451d9") else {
            errorMessage = "Invalid URL"
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                self.errorMessage = error?.localizedDescription ?? "Unknown error"
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let weatherData = try decoder.decode(WeatherData.self, from: data)
                DispatchQueue.main.async {
                    self.weatherData = weatherData
                }
            } catch {
                DispatchQueue.main.async {
                    self.errorMessage = error.localizedDescription
                }
            }
        }.resume()
    }
    
    enum TemperatureUnit: String, CaseIterable {
        case celsius = "Celsius"
        case fahrenheit = "Fahrenheit"
        
        var unit: UnitTemperature {
            switch self {
            case .celsius:
                return .celsius
            case .fahrenheit:
                return .fahrenheit
            }
        }
        
        func temperatureString(_ temperature: Double) -> String {
            let measurement = Measurement(value: temperature, unit: UnitTemperature.kelvin)
            let convertedMeasurement = measurement.converted(to: unit)
            let formatter = MeasurementFormatter()
            formatter.numberFormatter.numberStyle = .decimal
            formatter.unitOptions = .providedUnit
            return formatter.string(from: convertedMeasurement)
        }
    }
}
