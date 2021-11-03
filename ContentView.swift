//
//  ContentView.swift
//  MapAnnotation
//
//  Created by omer sanli on 3.11.2021.
//

import SwiftUI
import MapKit

struct Place : Identifiable {
    let id = UUID()
    let name : String
    let coordinate : CLLocationCoordinate2D
}


struct ContentView: View {
    
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 39.885594, longitude: 32.8558374), latitudinalMeters: 200, longitudinalMeters: 200)
    
    
    let annotations = [
        
        Place(name: "Starbucks", coordinate: CLLocationCoordinate2D(latitude: 39.8856449, longitude: 32.8557175)),
        
        Place(name: "Ortodonti", coordinate: CLLocationCoordinate2D(latitude: 39.8855738, longitude: 32.8553711))
    ]
    
    
    var body: some View {
        Map(coordinateRegion: $region, annotationItems: annotations) {
            place in
            MapAnnotation(coordinate: place.coordinate) {
                HStack{
                    Image(systemName: "heart.fill")
                        .foregroundColor(.red)
                    Text("Puan: 5")
                        .fixedSize()
                
                }.padding()
                    .background(Color.white)
                    .clipShape(RoundedRectangle(cornerRadius: 25))
                    
            }
            
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
