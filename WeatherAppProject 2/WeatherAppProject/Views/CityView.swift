//
//  TodayView.swift
//  WeatherAppProject
//
//  Created by Hibah Abdullah Alatawi on 03/02/1445 AH.
//

import SwiftUI

struct CityView: View {
    @State var city : String
    @State var temp_min : Double
    @State var temp_max : Double
    @State var humidity : Int
    @State var deg : Int
    @State var description : String
    @State var speed : Double 
 var body: some View {
     VStack(alignment: .leading){
         HStack {
             Text("Discreption")
                    .font(.largeTitle)
                    .padding()
                    .bold()
             if description ==  "overcast clouds"{
                 Image("windy")
                 .resizable()
                 .frame(width: 100 , height: 100)
                 .cornerRadius(12)
                 
             }
         }
        
            Text("temp_min: \(temp_min)")
                .padding()
            Text("temp_max: \(temp_max)")
                .padding()
            Text("humidity: \(humidity)")
                .padding()
            Text("Wind:")
             .font(.largeTitle)
             .padding()
             .bold()
             Text("speed: \(speed)")
             .padding()
            Text("degree: \(deg)")
             .padding()
           
         
        }.background(
            Image("backg").opacity(0.7))
                
        
    }
}

