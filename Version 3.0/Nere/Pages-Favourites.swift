import SwiftUI
import MapKit

// Favorites View
import SwiftUI

struct FriendsView: View {
    var nereColor: Color
    let friends = [
        ("Ahmet", "person.fill", true),
        ("Mehmet", "person.fill", false),
        ("Zeynep", "person.fill", true),
        ("Ayşe", "person.fill", false),
        ("Emre", "person.fill", true),
        ("Elif", "person.fill", true),
        ("Burak", "person.fill", false),
        ("Cemre", "person.fill", true),
        ("Can", "person.fill", false),
        ("Selin", "person.fill", true)
    ]
    
    @State private var blink = false
    
    var body: some View {
        NavigationView {
            VStack {
                List(friends, id: \.0) { friend in
                    HStack {
                        Image(systemName: friend.1)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 40, height: 40)
                            .foregroundColor(.gray)
                            .background(Circle().fill(Color.white))
                            .overlay(Circle().stroke(Color.gray, lineWidth: 1))
                        
                        Text(friend.0)
                            .padding(.leading, 10)
                        
                        Spacer()
                        
                        if friend.2 {
                            Circle()
                                .foregroundColor(blink ? .green : .clear)
                                .frame(width: 10, height: 10)
                                .transition(.opacity)
                        }
                    }
                    .padding(.vertical, 5)
                }
                .listStyle(PlainListStyle())
                .onAppear {
                    withAnimation(.easeInOut(duration: 0.8).repeatForever(autoreverses: true)) {
                        blink.toggle()
                    }
                }
            }
            .navigationTitle("Arkadaşlarım")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    NereLogoView(nereColor: nereColor)
                }
            }
        }
    }
}
