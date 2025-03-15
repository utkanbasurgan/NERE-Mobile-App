import SwiftUI
import MapKit

// Makale Modeli
struct Article: Identifiable {
    let id = UUID()
    let title: String
    let subtitle: String
    let image: String
    let category: String
    let readTime: Int
}

// Nere Sosyal Harita Uygulaması İçin Örnek Veriler
let sampleArticles = [
    Article(title: "Kalabalıktan Kaçının", subtitle: "Ziyaret etmeden önce mağazaların doluluk oranını görün", image: "person.3.fill", category: "DOLULUK", readTime: 3),
    Article(title: "Yeni Ürünleri Keşfedin", subtitle: "Mağazaların satışta olan ürünlerini önceden inceleyin", image: "bag.fill", category: "ENVANTER", readTime: 4),
    Article(title: "Yakınınızdaki Popüler Mağazalar", subtitle: "Bu hafta mahallenizde trend olan yerler", image: "star.fill", category: "TREND", readTime: 2),
    Article(title: "Alışveriş Rotanızı Planlayın", subtitle: "Birden fazla mağazayı verimli şekilde ziyaret etmek için rota oluşturun", image: "map.fill", category: "PLANLAMA", readTime: 5)
]

// Tekli Makale Kart Görünümü
struct ArticleCardView: View {
    var article: Article
    var nereColor: Color
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                Text(article.category)
                    .font(.caption)
                    .fontWeight(.semibold)
                    .foregroundColor(nereColor)
                
                Spacer()
                
                Text("\(article.readTime) dk okuma")
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
            
            HStack(alignment: .top, spacing: 16) {
                VStack(alignment: .leading, spacing: 8) {
                    Text(article.title)
                        .font(.headline)
                        .fontWeight(.bold)
                    
                    Text(article.subtitle)
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                        .lineLimit(2)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                
                Image(systemName: article.image)
                    .font(.system(size: 36))
                    .foregroundColor(nereColor)
                    .frame(width: 60, height: 60)
                    .background(Color(UIColor.systemGray6))
                    .clipShape(RoundedRectangle(cornerRadius: 12))
            }
        }
        .padding(16)
        .background(Color(UIColor.systemBackground))
        .cornerRadius(16)
        .shadow(color: Color.black.opacity(0.05), radius: 5, x: 0, y: 2)
    }
}

// Nere Sosyal Harita Uygulaması için Güncellenmiş Ana Sayfa
struct HomeView: View {
    var nereColor: Color
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 20) {
                    // Makale Kartları
                    LazyVStack(spacing: 16) {
                        ForEach(sampleArticles) { article in
                            ArticleCardView(article: article, nereColor: nereColor)
                                .padding(.horizontal)
                        }
                    }
                    
                    Spacer(minLength: 50)
                }
                .padding(.top)
            }
            .navigationTitle("Ana Sayfa")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    NereLogoView(nereColor: nereColor)
                }
            }
        }
    }
}
