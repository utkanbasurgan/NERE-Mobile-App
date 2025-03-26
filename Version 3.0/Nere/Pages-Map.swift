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
    
    // Selected location for the sheet
    @State private var selectedLocation: MapLocation?
    @State private var showLocationSheet = false
    
    // Sample locations to show on the map
    @State public var locations = [
        MapLocation(
                name: "Yıldız Teknik Üniversitesi Kütüphanesi",
                coordinate: CLLocationCoordinate2D(latitude: 41.0256, longitude: 29.0150),
                description: "Library of Yıldız Technical University.",
                image: "kutuphane",
                logo: "yildiz"
            ),
        MapLocation(name: "Taksim", coordinate: CLLocationCoordinate2D(latitude: 41.0370, longitude: 28.9850),
                    description: "Famous square in Istanbul and a major tourist attraction.",
                    image: "taksim", logo: "yildiz"),
        MapLocation(name: "Sultanahmet", coordinate: CLLocationCoordinate2D(latitude: 41.0054, longitude: 28.9768),
                    description: "Historical area with the Blue Mosque and Hagia Sophia.",
                    image: "sultanahmet", logo: "yildiz")
    ]
    
    var body: some View {
        NavigationView {
            ZStack {
                // Map view using MapKit
                Map(coordinateRegion: $region, annotationItems: locations) { location in
                    MapAnnotation(coordinate: location.coordinate) {
                        Button(action: {
                            selectedLocation = location
                            showLocationSheet = true
                        }) {
                            VStack {
                                Image(systemName: "mappin.circle.fill")
                                    .font(.system(size: 30))
                                    .foregroundColor(nereColor)
                                
                                Text(location.name)
                                    .font(.caption)
                                    .fontWeight(.bold)
                                    .padding(5)
                                    .background(Color.white.opacity(0.8))
                                    .cornerRadius(5)
                            }
                            .padding(8)
                            .contentShape(Rectangle())
                        }
                        .buttonStyle(PlainButtonStyle())
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
            .sheet(isPresented: $showLocationSheet) {
                if let location = selectedLocation {
                    LocationDetailView(location: location, nereColor: nereColor)
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

// Location model for map annotations with additional details
struct MapLocation: Identifiable {
    let id = UUID()
    let name: String
    let coordinate: CLLocationCoordinate2D
    let description: String
    let image: String
    let logo: String
}



// MARK: - LocationDetailView Structure
// MARK: - LocationDetailView Structure
struct LocationDetailView: View
{
    // MARK: - Properties
    let location: MapLocation
    let nereColor: Color
    let neresColor = Color(red: 0.0, green: 0.0, blue: 0.0)
    let greenColor = Color(red: 40/255, green: 209/255, blue: 40/255) // #28D128
    let blueColor = Color(red: 32/255, green: 90/255, blue: 190/255)  // #205ABE
    
    // Sample products for demonstration
    let products = [
        (name: "Ürün 1", image: "product1"),
        (name: "Ürün 2", image: "product2"),
        (name: "Ürün 3", image: "product3"),
        (name: "Ürün 4", image: "product4")
    ]
    
    // MARK: - Body
    var body: some View
    {
        ScrollView
        {
            VStack(alignment: .leading, spacing: 16)
            {
                bannerView
                contentView
            }
        }
        .edgesIgnoringSafeArea(.top)
    }
    
    // MARK: - Banner View
    private var bannerView: some View
    {
        ZStack(alignment: .bottom)
        {
            // Container with fixed dimensions
            Rectangle()
                .fill(Color.clear)
                .frame(height: 250)
                .frame(maxWidth: .infinity)
            
            // Location image as banner with proper cropping
            if UIImage(named: location.image) != nil
            {
                Image(location.image)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: UIScreen.main.bounds.width) // Set the width to device's screen width
                    .frame(height: 250)
                    .clipped()
            }
            else
            {
                // Fallback image with consistent dimensions
                ZStack
                {
                    Rectangle()
                        .fill(Color.gray.opacity(0.2))
                        .frame(width: UIScreen.main.bounds.width) // Same as above
                        .frame(height: 250)
                    
                    Image(systemName: "photo")
                        .font(.largeTitle)
                        .foregroundColor(.gray)
                }
            }
            
            // Logo positioned 50% on banner and 50% on page
            ZStack
            {
                Circle()
                    .fill(Color.white)
                    .frame(width: 110, height: 110)
                    .shadow(radius: 4)
                
                if UIImage(named: location.logo) != nil
                {
                    Image(location.logo)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 100, height: 100)
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                }
                else
                {
                    ZStack
                    {
                        RoundedRectangle(cornerRadius: 20)
                            .fill(nereColor)
                            .frame(width: 100, height: 100)
                        
                        Text("LOGO")
                            .font(.title3)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                    }
                }
            }
            .offset(y: 50)
        }
        .frame(maxWidth: .infinity)
        .frame(height: 250)
    }
    
    // MARK: - Main Content View
    private var contentView: some View
    {
        VStack(alignment: .leading, spacing: 12)
        {
            // Spacing for overlapping logo
            Spacer()
                .frame(height: 50)
            
            // Location Details
            locationDetailsView
            
            // Buttons
            actionButtonsView
            
            // Ratings
            ratingsView
            
            // Products
            productListView
        }
        .padding(.horizontal, 16)
        .padding(.bottom, 16)
    }
    
    // MARK: - Location Details
    private var locationDetailsView: some View
    {
        VStack(alignment: .leading, spacing: 8)
        {
            // Location name
            Text(location.name)
                .font(.title)
                .fontWeight(.bold)
            
            // Location description
            Text(location.description)
                .font(.body)
                .foregroundColor(.secondary)
        }
    }
    
    // MARK: - Action Buttons
    private var actionButtonsView: some View
    {
        HStack(spacing: 10)
        {
            Button(action:
            {
                // Action for adding to favorites
            })
            {
                Text("Favorilere Ekle")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding(.vertical, 12)
                    .frame(maxWidth: .infinity) // Take up 50% of space
                    .background(neresColor)
                    .cornerRadius(10)
            }
            
            Button(action:
            {
                // Action for updating
            })
            {
                HStack(spacing: 3) {
                    Image(systemName: "plus")
                        .font(.subheadline.weight(.bold))
                        .foregroundColor(neresColor)
                    
                    Text("Paylaşım Yap")
                        .font(.subheadline)
                        .fontWeight(.bold)
                        .foregroundColor(neresColor)
                }
            }
        }
        .padding(.top, 8)
    }
    
    // MARK: - Ratings View
    private var ratingsView: some View
    {
        VStack(alignment: .leading, spacing: 16)
        {
            // Occupancy Section
            occupancySection
            
            // Divider between sections
            Rectangle()
                .fill(Color.gray.opacity(0.3))
                .frame(height: 1)
            
            // Two column rating section
            HStack(alignment: .top, spacing: 20)
            {
                // Quality Rating
                qualityRatingSection
                
                // Price Rating
                priceRatingSection
            }
        }
        .padding(16)
        .background(Color.gray.opacity(0.1))
        .cornerRadius(10)
        .padding(.top, 8)
    }
    
    // MARK: - Occupancy Section
    private var occupancySection: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                Text("Doluluk")
                    .font(.subheadline)
                    .fontWeight(.medium)
                
                Spacer()
                
                Button(action: {
                    // Add action here
                }) {
                    HStack {
                        Image(systemName: "eye.fill")
                        Text("Canlı Gör")
                    }
                    .font(.subheadline)
                    .foregroundColor(.blue)
                }
            }
            
            HStack {
                Text("5-10 kişi burada")
                    .foregroundColor(.secondary)
                    .font(.subheadline)
                Spacer()
            }
            
            HStack(spacing: 4) {
                // Custom person icons (5 total, 1 filled)
                ForEach(0..<5) { index in
                    Image(systemName: "person.fill")
                        .font(.body)
                        .foregroundColor(index < 4 ? blueColor : .gray.opacity(0.5))
                }
            }
            
            Text("1 dakika önce güncellendi")
                .font(.caption)
                .foregroundColor(.gray)
        }
    }
    
    // MARK: - Quality Rating Section
    private var qualityRatingSection: some View
    {
        VStack(alignment: .leading, spacing: 8)
        {
            Text("Kalite")
                .font(.subheadline)
                .fontWeight(.medium)
            
            HStack(spacing: 4)
            {
                // Star icons (5 total, 4 filled)
                ForEach(0..<5) { index in
                    Image(systemName: "star.fill")
                        .font(.body)
                        .foregroundColor(index < 4 ? .yellow : .gray.opacity(0.5))
                }
            }
            
            Text("en son 5 dakika önce")
                .font(.caption)
                .foregroundColor(.gray)
                
            Text("1448 değerlendirme")
                .font(.caption)
                .foregroundColor(.gray)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    // MARK: - Price Rating Section
    private var priceRatingSection: some View
    {
        VStack(alignment: .leading, spacing: 8)
        {
            Text("Pahalılık")
                .font(.subheadline)
                .fontWeight(.medium)
            
            HStack(spacing: 4)
            {
                // Money symbols (5 total, 3 filled)
                ForEach(0..<5) { index in
                    Image(systemName: "dollarsign.circle.fill")
                        .font(.body)
                        .foregroundColor(index < 4 ? greenColor : .gray.opacity(0.5))
                }
            }
            
            Text("ortalama fiyat")
                .font(.caption)
                .foregroundColor(.gray)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    // MARK: - Product List View
    private var productListView: some View
    {
        VStack(alignment: .leading)
        {
            HStack
            {
                Text("Ürün Listesi")
                    .font(.headline)
                    .fontWeight(.bold)
                
                Spacer()
                
                Button(action:
                {
                    // Action for viewing all products
                })
                {
                    Text("Tamamını Gör")
                        .font(.subheadline)
                        .foregroundColor(nereColor)
                }
            }
            .padding(.horizontal, 16)
            .padding(.top, 16)
            
            ScrollView(.horizontal, showsIndicators: false)
            {
                HStack(spacing: 16)
                {
                    ForEach(0..<4) { index in
                        productCell(index: index)
                    }
                }
                .padding(.horizontal, 16)
                .padding(.vertical, 12)
            }
        }
        .background(Color.gray.opacity(0.1))
        .cornerRadius(10)
        .padding(.top, 8)
    }
    
    // MARK: - Product Cell
    private func productCell(index: Int) -> some View
    {
        VStack
        {
            if UIImage(named: products[index].image) != nil
            {
                Image(products[index].image)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 80, height: 80)
                    .clipShape(RoundedRectangle(cornerRadius: 8))
            }
            else
            {
                ZStack
                {
                    RoundedRectangle(cornerRadius: 8)
                        .fill(Color.gray.opacity(0.2))
                        .frame(width: 80, height: 80)
                    
                    Image(systemName: "photo")
                        .foregroundColor(.gray)
                }
            }
            
            Text(products[index].name)
                .font(.caption)
                .multilineTextAlignment(.center)
        }
        .frame(width: 80)
    }
}
