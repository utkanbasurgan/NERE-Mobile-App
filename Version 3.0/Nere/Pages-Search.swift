import SwiftUI
import MapKit

struct SearchView: View {
    var nereColor: Color
    @State private var searchText = ""
    @State private var sortOption = "Name" // Default sort option
    
    // Reference to the locations from MapView
    var locations = [
        MapLocation(name: "Taksim", coordinate: CLLocationCoordinate2D(latitude: 41.0370, longitude: 28.9850),
                    description: "Famous square in Istanbul and a major tourist attraction.",
                    image: "taksim", logo: "yildiz"),
        MapLocation(name: "Sultanahmet", coordinate: CLLocationCoordinate2D(latitude: 41.0054, longitude: 28.9768),
                    description: "Historical area with the Blue Mosque and Hagia Sophia.",
                    image: "sultanahmet", logo: "yildiz"),
        MapLocation(name: "Galata", coordinate: CLLocationCoordinate2D(latitude: 41.0256, longitude: 28.9741),
                    description: "Known for the iconic Galata Tower with panoramic views of the city.",
                    image: "galata", logo: "yildiz")
    ]
    
    // Filtered and sorted locations based on search text and sort option
    var filteredLocations: [MapLocation] {
        let filtered = searchText.isEmpty ? locations : locations.filter {
            $0.name.localizedCaseInsensitiveContains(searchText)
        }
        
        switch sortOption {
        case "Name":
            return filtered.sorted { $0.name < $1.name }
        case "Distance":
            // You would need a reference to current location or map center to implement this
            // This is a placeholder implementation
            return filtered
        default:
            return filtered
        }
    }
    
    var body: some View {
        NavigationView {
            VStack {
                // Search bar
                TextField("Ara...", text: $searchText)
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(10)
                    .padding(.horizontal)
                
                // Sort picker
                Picker("Sort by", selection: $sortOption) {
                    Text("Name").tag("Name")
                    Text("Distance").tag("Distance")
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding(.horizontal)
                
                // List of locations
                List(filteredLocations) { location in
                    VStack(alignment: .leading) {
                        Text(location.name)
                            .font(.headline)
                        Text(location.description)
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                }
                .listStyle(PlainListStyle())
            }
            .navigationTitle("Ara")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    // Assuming NereLogoView is defined elsewhere
                    NereLogoView(nereColor: nereColor)
                }
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    CreateButtonView(nereColor: nereColor)
                }
            }
        }
    }
}

// For initializing the view in a parent view, you would do something like:
// SearchView(nereColor: yourColor, locations: yourMapView.locations)
