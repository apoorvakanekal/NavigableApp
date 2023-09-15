//
//  ContentView.swift
//  NavigableApp
//
//  Created by Apoorva Kanekal on 9/14/23.
//

import SwiftUI

var Bg = Color.blue

struct ContentView: View {
    
    var body: some View {
        
        TabView{
            HelloPageView()
                .toolbarBackground(.yellow, for: .tabBar) //helps the icon contrast on blue
                .tabItem{
                    Label("Home", systemImage:"house")
                }
            WeatherView()
                .tabItem{
                    Label("Weather", systemImage: "cloud")
                }
            ActivityView()
                .tabItem{
                    Label("Activities", systemImage:"person")
                }
        }
    }
    
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
}
