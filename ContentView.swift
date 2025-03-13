import SwiftUI

struct ContentView: View
{
    init()
    {
        UITabBar.appearance().backgroundColor = UIColor.brown
    }

    var body: some View
    {
        TabView
        {
            NavigationView
            {
                VStack
                {
                    Text("")
                        .foregroundColor(.black) .toolbar
                        {
                            ToolbarItem(placement: .navigationBarLeading)
                            {
                                Button(action:
                                {
                                    print("Person button pressed")
                                })
                                {
                                    Image(systemName: "dollarsign.circle")
                                        .foregroundColor(.blue)
                                    Text("Coinarth")
                                        .foregroundColor(.blue)
                                }
                            }

                            ToolbarItem(placement: .navigationBarTrailing)
                            {
                                Button(action:
                                {
                                    print("Person button pressed")
                                })
                                {
                                    Text("Home")
                                        .foregroundColor(.black)
                                }
                            }
                        }
                    Divider()
                    Text("Hello, world!")
                    Divider()
                    ScrollViewReader { proxy in
                        Text("Home")
                        Divider()
                        Toggle(isOn: .constant(true))
                        {
                            Label("Label", systemImage: "star")
                        }
                        Divider()
                        ForEach(1...10, id: \.self) { count in
                            Toggle(isOn: .constant(false))
                            {
                                Label("Deneme", systemImage: "star")
                            }
                        }
                        Divider()
                    }
                }
            }
            .tabItem
            {
                Image(systemName: "house")
                Text("Ana Sayfa")
            }

            NavigationView
            {
                Text("Ara")
            }
            .tabItem
            {
                Image(systemName: "magnifyingglass")
                Text("Harita")
            }
            
            NavigationView
            {
                Text("Favoriler")
            }
            .tabItem
            {
                Image(systemName: "account")
                Text("Hesabım")
            }
            
            NavigationView
            {
                Text("Search1")
            }
            .tabItem
            {
                Image(systemName: "gear")
                Text("Settings")
            }
        }
        .accentColor(.white)
    }
}

#Preview {
    ContentView()
}
