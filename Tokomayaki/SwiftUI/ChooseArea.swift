//
//  ChooseArea.swift
//  Tokomayaki
//
//  Created by Divyam Solanki on 21/06/21.
//


import MapKit
import SwiftUI

struct ChooseArea: View {
    @State private var userTrackingMode: MapUserTrackingMode = .follow
    @State var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 24.5, longitude: 73.7),
        span: MKCoordinateSpan(latitudeDelta: 40, longitudeDelta: 40))
    
    var body: some View {
        NavigationView{
            VStack{
                
                Map(coordinateRegion: $region,
                    interactionModes: MapInteractionModes.all,
                    showsUserLocation: true,
                    userTrackingMode: $userTrackingMode)
                    .edgesIgnoringSafeArea(.all)
                
                
            }.navigationBarTitle("Maps", displayMode: .large)
        }.navigationViewStyle(StackNavigationViewStyle())
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ChooseArea()
            .preferredColorScheme(.dark)
    }
}

