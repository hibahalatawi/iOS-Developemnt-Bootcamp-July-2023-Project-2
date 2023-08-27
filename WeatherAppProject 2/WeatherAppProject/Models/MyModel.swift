//
//  TabModel.swift
//  WeatherAppProject
//
//  Created by Hibah Abdullah Alatawi on 03/02/1445 AH.
//

import Foundation
import SwiftUI

struct MyModelModel: Identifiable {
    var id = UUID()
    var degree : String
    var city: String
    var icon1: Image
    var humidity: String
    var icon2: Image
    var wind: String
    var img : String
    
}

var card1 : MyModelModel = MyModelModel(degree: "27", city: "tabuk", icon1: Image(systemName:"drop.fill"), humidity: "8", icon2: Image(systemName:"wind.circle"), wind: "11", img: "windy")
var card2 : MyModelModel = MyModelModel(degree: "27", city: "new yourk", icon1: Image(systemName:"drop.fill"), humidity: "27", icon2: Image(systemName:"wind.circle"), wind: "11", img: "rainy")

var card3 : MyModelModel = MyModelModel( degree: "1", city: "Mosko", icon1:Image(systemName:"drop.fill"), humidity: "10", icon2:Image(systemName:"wind.circle"), wind: "22", img: "snowy")

var card4 : MyModelModel = MyModelModel( degree: "11", city: "Damam", icon1: Image(systemName:"drop.fill"), humidity: "30", icon2:Image(systemName:"wind.circle"), wind: "33", img: "stormy")

var card5 : MyModelModel = MyModelModel(degree: "40", city: "Riyadh", icon1: Image(systemName:"drop.fill"), humidity: "5", icon2: Image(systemName:"wind.circle"), wind: "12", img: "suny")


let myCards : [MyModelModel] = [
    card1,
    card2,
    card3,
    card4,
    card5
    
]

 
    
    

