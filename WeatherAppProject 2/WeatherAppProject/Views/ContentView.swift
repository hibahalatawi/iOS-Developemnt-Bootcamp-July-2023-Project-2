//
//  ContentView.swift
//  WeatherAppProject
//
//  Created by Hibah Abdullah Alatawi on 02/02/1445 AH.


import SwiftUI

struct ContentView: View {
    @ObservedObject var weatherViewModel = WeatherViewModel()
    @State var sesrch: String = ""
    let columns: [GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    @State private var searchHistory: [String] = UserDefaults.standard.stringArray(forKey: "seaarch") ?? []
    @State private var showCityView = false

    var body: some View {
        NavigationStack {
            VStack {
                // Search History
                Button("Show weather") {
                    weatherViewModel.loadDate(for: sesrch)
                    if !sesrch.isEmpty && !searchHistory.contains(sesrch) {
                        searchHistory.append(sesrch)
                        UserDefaults.standard.setValue(searchHistory, forKey: "SearchHistory")
                    }
                }   .padding()
                    .foregroundColor(.gray)
                    .overlay(
                        RoundedRectangle(cornerRadius: 16)
                            .stroke(.gray, lineWidth: 1)
                    )
                    .background(Color("Color1"))
                    .padding()
                ScrollView {
                   
                 
                    LazyVGrid(columns: columns) {
                        ForEach(searchHistory.filter { searchText in
                            sesrch.isEmpty || searchText.contains(sesrch)
                        }, id: \.self) { searchText in
                            ZStack {
                                Rectangle()
                                    .frame(width: 195, height: 195 )
                                    .foregroundColor(Color.brown.opacity(0.1))
                                    .background(Color.brown.opacity(0.2))
                                    .cornerRadius(12)
                                VStack{
                                    if let weatherData = weatherViewModel.weatherData {
                                        Text("City: \(weatherData.name)")
                                            .font(.title2)
                                        
                                        Text("Temperature: \(WeatherViewModel.TemperatureUnit.celsius.temperatureString(weatherData.main.temp))")
                                            .font(.headline)
                                           
                                        
                                        Text("Description: \(weatherData.weather[0].description)")
                                            .font(.subheadline)
                                           
                                    } else if let errorMessage = weatherViewModel.errorMessage {
                                        Text(errorMessage)
                                            .foregroundColor(.red)
                                            
                                    }
                                }
                            }
                            .onTapGesture {
                                showCityView = true
                            }
                            .sheet(isPresented: $showCityView) {
                                if let weatherData = weatherViewModel.weatherData {
                                    CityView(city: weatherData.name,
                                             temp_min: weatherData.main.temp_min,
                                             temp_max: weatherData.main.temp_max,
                                             humidity: weatherData.main.humidity,
                                             deg: weatherData.wind.deg,
                                                 description: weatherData.weather[0].description,
                                                 speed: weatherData.wind.speed)
                                }
                            }
                        }
                    }



                    .listStyle(InsetGroupedListStyle())
                    .padding()
                }
                

    }
            .searchable(text: $sesrch, prompt: "Search")
            .background(Image("backg").opacity(0.5))
            .navigationTitle("All Cities")
            .toolbar{
                NavigationLink(destination: {
                    SettingView()
                }, label: {
                    Image(systemName: "gearshape")
                        .foregroundColor(Color.black)
                        .bold()
                })
            }
        }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


