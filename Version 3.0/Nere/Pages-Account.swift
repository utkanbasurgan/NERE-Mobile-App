import SwiftUI
import MapKit

struct ProfileView: View {
    var nereColor: Color
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 0) { // Spacing 0 preserved
                // Profil bilgileri
                VStack(alignment: .leading, spacing: 15) {
                    HStack(spacing: 15) {
                        Image(systemName: "person.crop.circle.fill")
                            .resizable()
                            .frame(width: 80, height: 80)
                            .foregroundColor(nereColor)
                            .padding(5)
                        
                        VStack(alignment: .leading, spacing: 5) {
                            Text("Kullanıcı Adı")
                                .font(.title2)
                                .fontWeight(.bold)
                            
                            Text("kullanici@mail.com")
                                .font(.subheadline)
                                .foregroundColor(.gray)
                        }
                    }
                    .padding(.horizontal)
                }
                .padding(.top) // Original padding preserved
                .padding(.bottom, 10) // Original padding preserved
                
                Divider()
                    .padding(.bottom, 0) // Original padding preserved
                
                VStack(spacing: 0) { // Original spacing preserved
                    NavigationLink(destination: ProfileDetailsView(nereColor: nereColor)) {
                        MenuItemView(icon: "person.fill", title: "Profil Bilgilerim")
                    }
                    .buttonStyle(PlainButtonStyle()) // Removes default button styling
                    
                    NavigationLink(destination: FavoritesView(nereColor: nereColor)) {
                        MenuItemView(icon: "heart.fill", title: "Favorilerim")
                    }
                    .buttonStyle(PlainButtonStyle())
                    
                    NavigationLink(destination: AddressesView(nereColor: nereColor)) {
                        MenuItemView(icon: "location.fill", title: "Adreslerim")
                    }
                    .buttonStyle(PlainButtonStyle())
                    
                    NavigationLink(destination: SettingsView(nereColor: nereColor)) {
                        MenuItemView(icon: "gearshape.fill", title: "Ayarlar")
                    }
                    .buttonStyle(PlainButtonStyle())
                    
                    NavigationLink(destination: HelpSupportView(nereColor: nereColor)) {
                        MenuItemView(icon: "questionmark.circle.fill", title: "Yardım ve Destek")
                    }
                    .buttonStyle(PlainButtonStyle())
                }
                
                Spacer() // Preserved from original
                
                // Çıkış yap butonu - original styling preserved
                Button(action: {
                    // Çıkış işlemi
                }) {
                    HStack {
                        Image(systemName: "arrow.right.square.fill")
                        Text("Çıkış Yap")
                    }
                    .foregroundColor(.red)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(10)
                }
                .padding(.horizontal)
                .padding(.bottom)
            }
            .navigationTitle("Hesabım")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
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

// Example destination views with nereColor passed through
struct ProfileDetailsView: View {
    var nereColor: Color
    
    var body: some View {
        VStack {
            Text("Profil Bilgilerim")
                .font(.title)
                .padding()
            Spacer()
        }
        .navigationTitle("Profil Bilgilerim")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct FavoritesView: View {
    var nereColor: Color
    
    var body: some View {
        VStack {
            Text("Favorilerim")
                .font(.title)
                .padding()
            Spacer()
        }
        .navigationTitle("Favorilerim")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct AddressesView: View {
    var nereColor: Color
    
    var body: some View {
        VStack {
            Text("Adreslerim")
                .font(.title)
                .padding()
            Spacer()
        }
        .navigationTitle("Adreslerim")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct SettingsView: View {
    var nereColor: Color
    
    var body: some View {
        VStack {
            Text("Ayarlar")
                .font(.title)
                .padding()
            Spacer()
        }
        .navigationTitle("Ayarlar")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct HelpSupportView: View {
    var nereColor: Color
    
    var body: some View {
        VStack {
            Text("Yardım ve Destek")
                .font(.title)
                .padding()
            Spacer()
        }
        .navigationTitle("Yardım ve Destek")
        .navigationBarTitleDisplayMode(.inline)
    }
}

// Yardımcı görünüm komponenti
struct MenuItemView: View {
    var icon: String
    var title: String
    
    var body: some View {
        HStack {
            Image(systemName: icon)
                .frame(width: 30)
            
            Text(title)
                .padding(.leading, 8)
            
            Spacer()
            
            Image(systemName: "chevron.right")
                .foregroundColor(.gray)
        }
        .padding()
        .background(Color(.systemBackground))
        .overlay(
            Divider()
                .background(Color(.systemGray5)),
            alignment: .bottom
        )
    }
}
