import SwiftUI
import MapKit

// Favorites View
struct FavoritesView: View {
    var nereColor: Color
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Favorilerim İçeriği")
                Spacer()
            }
            .navigationTitle("Favorilerim")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    NereLogoView(nereColor: nereColor)
                }
            }
        }
    }
}
