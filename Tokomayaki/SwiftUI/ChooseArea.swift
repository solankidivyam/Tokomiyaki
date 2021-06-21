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
        center: CLLocationCoordinate2D(latitude: 36.6, longitude: 139.6),
        span: MKCoordinateSpan(latitudeDelta: 5, longitudeDelta: 5))
    
    var body: some View {
        NavigationView{
            ZStack {
                VStack{
                    
                    Map(coordinateRegion: $region,
                        interactionModes: MapInteractionModes.all,
                        showsUserLocation: true,
                        userTrackingMode: $userTrackingMode)
                        .edgesIgnoringSafeArea(.all)
                    
                    
                }.navigationBarTitle("Choose Area", displayMode: .large)
//                Button
                Spacer()
                
                Button(action:{print("Continue")}){
                           Text("Choose this")
                               .foregroundColor(.white)
                               .padding(20)
                               .background(Color.black)
                            .cornerRadius(10)
                       }
                .frame(width: 200, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .frame(maxHeight: .infinity, alignment: .bottom)
            }
            
        }.navigationViewStyle(StackNavigationViewStyle())
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ChooseArea()
            .preferredColorScheme(.dark)
    }
}

