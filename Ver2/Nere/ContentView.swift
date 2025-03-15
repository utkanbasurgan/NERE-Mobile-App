import SwiftUI
import MapKit

struct ContentView: View {
    @State private var selectedTab = 0
    
    // Define the yellow-orange color
    let nereColor = Color(red: 1.0, green: 0.7, blue: 0.0)
    
    var body: some View {
        TabView(selection: $selectedTab) {
            // Ana Sayfa
            HomeView(nereColor: nereColor)
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Ana Sayfa")
                }
                .tag(0)
            
            // Ara
            SearchView(nereColor: nereColor)
                .tabItem {
                    Image(systemName: "magnifyingglass")
                    Text("Ara")
                }
                .tag(1)
            
            // Harita (Yuvarlak logo içinde)
            MapView(nereColor: nereColor)
                .tabItem {
                    ZStack {
                        Image(systemName: "map.fill")
                    }
                    Text("Harita")
                }
                .tag(2)
            
            // Favorilerim
            FavoritesView(nereColor: nereColor)
                .tabItem {
                    Image(systemName: "heart.fill")
                    Text("Favorilerim")
                }
                .tag(3)
            
            // Hesabım
            ProfileView(nereColor: nereColor)
                .tabItem {
                    Image(systemName: "person.fill")
                    Text("Hesabım")
                }
                .tag(4)
        }
        .accentColor(nereColor) // Tab item accent color when selected
        .onAppear {
            // Customize tab bar appearance globally
            let tabBarAppearance = UITabBarAppearance()
            tabBarAppearance.configureWithDefaultBackground()
            tabBarAppearance.backgroundColor = .white
            
            UITabBar.appearance().standardAppearance = tabBarAppearance
            UITabBar.appearance().scrollEdgeAppearance = tabBarAppearance
        }
    }
}

// Custom View for the Nere logo and app name
struct NereLogoView: View {
    var nereColor: Color
    
    var body: some View {
        HStack {
            Image(systemName: "map.fill")
                .foregroundColor(nereColor)
            Text("Nere")
                .font(.title3)
                .fontWeight(.bold)
                .foregroundColor(nereColor)
        }
    }
}

#Preview {
    ContentView()
}
