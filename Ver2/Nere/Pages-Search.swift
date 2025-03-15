import SwiftUI
import MapKit

// Home View
// Search View
struct SearchView: View {
    var nereColor: Color
    @State private var searchText = ""
    
    var body: some View {
        NavigationView {
            VStack {
                TextField("Ara...", text: $searchText)
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(10)
                    .padding(.horizontal)
                
                Spacer()
            }
            .navigationTitle("Ara")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    NereLogoView(nereColor: nereColor)
                }
            }
        }
    }
}
