import SwiftUI
import MapKit

struct ContentView: View
{
    @State private var selectedTab = 0
    
    // Define the yellow-orange color
    let nereColor = Color(red: 0.996, green: 0.78, blue: 0.0)
    let neresColor = Color(red: 0.0, green: 0.0, blue: 0.0)
    
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
            
            // Harita
            MapView(nereColor: nereColor)
                .tabItem {
                    Image(systemName: "map.fill")
                    Text("Harita")
                }
                .tag(2)
            
            // Favorilerim
            FriendsView(nereColor: nereColor)
                .tabItem {
                    Image(systemName: "heart.fill")
                    Text("Arkadaşlar")
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
        .onAppear {
            // Customize tab bar appearance globally
            let tabBarAppearance = UITabBarAppearance()
            tabBarAppearance.configureWithDefaultBackground()
            tabBarAppearance.backgroundColor = .white
            
            // Add shadow to the tab bar
            tabBarAppearance.shadowColor = UIColor.black.withAlphaComponent(0.2)
            tabBarAppearance.shadowImage = UIImage()
            
            // Create a custom selected background image with shadow
            let renderer = UIGraphicsImageRenderer(size: CGSize(width: 30, height: 30))
            let selectedBackgroundImage = renderer.image { context in
                // Fill with a very light gray or white
                UIColor.white.setFill()
                let rect = CGRect(x: 0, y: 0, width: 30, height: 30)
                context.fill(rect)
                
                // Add subtle shadow
                context.cgContext.setShadow(
                    offset: CGSize(width: 0, height: 0),
                    blur: 5,
                    color: UIColor.black.withAlphaComponent(0.15).cgColor
                )
                
                // Draw a slightly smaller rectangle with rounded corners
                let path = UIBezierPath(roundedRect: CGRect(x: 2, y: 2, width: 26, height: 26), cornerRadius: 8)
                UIColor.white.setFill()
                path.fill()
            }
            
            // Customize the selected item appearance
            let itemAppearance = UITabBarItemAppearance(style: .stacked)
            
            // Set selected icon color to yellow
            itemAppearance.selected.iconColor = UIColor(nereColor)
            
            // Set selected text color to black
            itemAppearance.selected.titleTextAttributes = [.foregroundColor: UIColor.black]
            
            // Apply subtle background effect for selected tab

            
            // Set unselected colors
            itemAppearance.normal.iconColor = UIColor.gray
            itemAppearance.normal.titleTextAttributes = [.foregroundColor: UIColor.gray]
            
            // Apply these appearances to the tab bar
            tabBarAppearance.stackedLayoutAppearance = itemAppearance
            tabBarAppearance.inlineLayoutAppearance = itemAppearance
            tabBarAppearance.compactInlineLayoutAppearance = itemAppearance
            
            UITabBar.appearance().standardAppearance = tabBarAppearance
            UITabBar.appearance().scrollEdgeAppearance = tabBarAppearance
        }
    }
}

// Custom View for the Nere logo and app name
struct NereLogoView: View {
    var nereColor: Color
    let neresColor = Color(red: 0.0, green: 0.0, blue: 0.0)
    
    var body: some View {
        HStack {
            Image("nere_logo")
                .resizable()
                .scaledToFit()
                .frame(width: 24, height: 24)
            Text("Nere")
                .font(.title3)
                .fontWeight(.bold)
                .foregroundColor(neresColor)
        }
    }
}

// Create Button View
struct CreateButtonView: View {
    var nereColor: Color
    let neresColor = Color(red: 0.0, green: 0.0, blue: 0.0)
    let neressColor = Color(red: 0.996, green: 0.78, blue: 0.0)
    
    var body: some View {
        Button(action: {
            // Action to perform when button is tapped
            print("Oluştur button tapped")
        }) {
            HStack(spacing: 3) {
                Image(systemName: "plus")
                    .font(.subheadline.weight(.bold))
                    .foregroundColor(neresColor)
                
                Text("Paylaş")
                    .font(.subheadline)
                    .fontWeight(.bold)
                    .foregroundColor(neresColor)
            }
            .foregroundColor(.white)
            .padding(.horizontal, 8)
            .padding(.vertical, 6)
            .background(neressColor)
            .cornerRadius(10)
        }
    }
}

#Preview {
    ContentView()
}
