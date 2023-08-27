////
////  WeatherView.swift
////  WeatherAppProject
////
////
//
//import SwiftUI
//
//struct WeatherView: View {
//    @State var sesrch: String = ""
//    let columns:[GridItem]=[
//        GridItem(.flexible()),
//        GridItem(.flexible())]
//    
//    var body: some View {
//        NavigationStack{
//            ScrollView {
//                VStack{
//                    LazyVGrid(columns: columns ){
//                        ForEach (myCards, id: \.id){ i in
//                            NavigationLink(destination: {
//                                CityView()
//                            }, label: {
//                                ZStack{
//                                    Rectangle()
//                                        .frame(width: 175, height: 170 )
//                                        .foregroundColor(Color.brown.opacity(0.1))
//                                        .border(Color.brown.opacity(0.9))
//                                        .cornerRadius(12)
//                                    
//                                    VStack {
//                                        HStack{
//                                            VStack{
//                                                Text(i.degree)
//                                                    .font(.largeTitle)
//                                                    .foregroundColor(Color.black)
//                                                    .padding(.bottom)
//                                                Text(i.city)
//                                                .foregroundColor(Color.black)
//                                                
//                                            }
//                                            Image(i.img)
//                                                .resizable()
//                                                .frame(width: 60, height: 60)
//                                                .scaledToFit()
//                                                .cornerRadius(50)
//                                        }.padding(.bottom)
//                                        
//                                        HStack( spacing: 40){
//                                            
//                                            HStack{
//                                                Image(systemName: "drop.fill")
//                                                    .foregroundColor(Color.black)
//                                                Text(i.humidity)
//                                                    .foregroundColor(Color.black)
//                                            }
//                                          
//                                            HStack{
//                                                Image(systemName: "wind.circle")
//                                                    .foregroundColor(Color.black)
//                                                Text(i.wind)
//                                                    .foregroundColor(Color.black)
//                                            }
//                                        }
//                                    }
//                                    
//                                }//zstack
//                            }
//                         )
//                        }//forech
//                    }
//                }
//                .background(
//                    Image("backg").opacity(0.5))
//            }
//                .searchable(text: $sesrch, prompt: "Search")
//                .navigationTitle("All Cities")
//                .navigationBarTitleDisplayMode(.inline)
//                .toolbar{
//                    NavigationLink(destination:{
//                       SettingView()
//                    }, label: {
//                        
//                       Image(systemName: "gearshape")
//                            .foregroundColor(Color.black)
//                            .bold()
//                    })
//                    
//                }
//
//            
//        }
//    }
//}
//
//struct WeatherView_Previews: PreviewProvider {
//    static var previews: some View {
//        WeatherView()
//    }
//}
