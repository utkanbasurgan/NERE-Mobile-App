import SwiftUI
import MapKit

struct ProfileView: View {
    var nereColor: Color
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 0) { // Changed spacing to 0
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
                .padding(.top) // Changed from .vertical to just .top
                .padding(.bottom, 10) // Add smaller bottom padding
                
                Divider()
                    .padding(.bottom, 0) // Ensure no padding below divider
                
                VStack(spacing: 0) {
                    MenuItemView(icon: "person.fill", title: "Profil Bilgilerim")
                    MenuItemView(icon: "heart.fill", title: "Favorilerim")
                    MenuItemView(icon: "clock.fill", title: "Sipariş Geçmişim")
                    MenuItemView(icon: "location.fill", title: "Adreslerim")
                    MenuItemView(icon: "creditcard.fill", title: "Ödeme Yöntemlerim")
                    MenuItemView(icon: "gearshape.fill", title: "Ayarlar")
                    MenuItemView(icon: "questionmark.circle.fill", title: "Yardım ve Destek")
                }
                
                Spacer() // Add this to push content up
                
                // Çıkış yap butonu
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
        }
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
