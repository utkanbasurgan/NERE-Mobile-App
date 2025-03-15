import SwiftUI
import MapKit

// Map View with actual MapKit implementation
struct MapView: View {
    var nereColor: Color
    
    // Initial region to display on the map (Istanbul coordinates)
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 41.0082, longitude: 28.9784),
        span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
    )
    
    // Sample locations to show on the map
    @State private var locations = [
        MapLocation(name: "Taksim", coordinate: CLLocationCoordinate2D(latitude: 41.0370, longitude: 28.9850)),
        MapLocation(name: "Sultanahmet", coordinate: CLLocationCoordinate2D(latitude: 41.0054, longitude: 28.9768)),
        MapLocation(name: "Galata", coordinate: CLLocationCoordinate2D(latitude: 41.0256, longitude: 28.9741))
    ]
    
    var body: some View {
        NavigationView {
            ZStack {
                // Map view using MapKit
                Map(coordinateRegion: $region, annotationItems: locations) { location in
                    MapAnnotation(coordinate: location.coordinate) {
                        VStack {
                            Image(systemName: "mappin.circle.fill")
                                .font(.title)
                                .foregroundColor(nereColor)
                            
                            Text(location.name)
                                .font(.caption)
                                .fontWeight(.bold)
                                .padding(5)
                                .background(Color.white.opacity(0.8))
                                .cornerRadius(5)
                        }
                    }
                }
                .edgesIgnoringSafeArea(.bottom)
                
                // Control buttons on top of the map
                VStack {
                    Spacer()
                    
                    HStack(spacing: 16) {
                        Spacer()
                        
                        // Zoom in button
                        Button(action: {
                            // Zoom in functionality
                            var newRegion = region
                            newRegion.span.latitudeDelta /= 2
                            newRegion.span.longitudeDelta /= 2
                            region = newRegion
                        }) {
                            Circle()
                                .foregroundColor(.white)
                                .frame(width: 44, height: 44)
                                .overlay(
                                    Image(systemName: "plus")
                                        .foregroundColor(nereColor)
                                        .font(.system(size: 20))
                                )
                                .shadow(radius: 3)
                        }
                        
                        // Current location button
                        Button(action: {
                            // Center map on user location (would need location permissions in real app)
                        }) {
                            Circle()
                                .foregroundColor(nereColor)
                                .frame(width: 56, height: 56)
                                .overlay(
                                    Image(systemName: "location.fill")
                                        .foregroundColor(.white)
                                        .font(.system(size: 24))
                                )
                                .shadow(radius: 4)
                        }
                        
                        // Zoom out button
                        Button(action: {
                            // Zoom out functionality
                            var newRegion = region
                            newRegion.span.latitudeDelta *= 2
                            newRegion.span.longitudeDelta *= 2
                            region = newRegion
                        }) {
                            Circle()
                                .foregroundColor(.white)
                                .frame(width: 44, height: 44)
                                .overlay(
                                    Image(systemName: "minus")
                                        .foregroundColor(nereColor)
                                        .font(.system(size: 20))
                                )
                                .shadow(radius: 3)
                        }
                        
                        Spacer()
                    }
                    .padding(.bottom, 20)
                }
            }
            .navigationTitle("Harita")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    NereLogoView(nereColor: nereColor)
                }
            }
        }
    }
}

// Location model for map annotations
struct MapLocation: Identifiable {
    let id = UUID()
    let name: String
    let coordinate: CLLocationCoordinate2D
}
