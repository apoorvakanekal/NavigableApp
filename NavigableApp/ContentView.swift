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
    
   
struct HelloPageView : View {
    
    @State var backgroundColor = Color.blue
    @State var circleColor = Color.yellow
    @State var changeColor = true
    @State var text = "Hello, Day"
    @State private var showingAlert = false
    @State private var navTitleColor = Color.black
    
    var body: some View {
        NavigationView{
            ZStack{
                backgroundColor
                    .ignoresSafeArea()
                VStack{
                    Text(text)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                    
                    Circle()
                        .foregroundColor(circleColor)
                        .scaleEffect(0.75)
                    
                    ZStack{
                        RoundedRectangle(cornerRadius: 8)
                            .foregroundColor(.white)
                            .frame(width:200,height:75)
                        
                        Button("Change Time"){
                            showingAlert = true
                        }
                        .foregroundColor(.black)
                        .alert("You are about to switch the timezone from which you are currently in. Continue?", isPresented: $showingAlert){
                            Button("No", role: .none){ }
                            Button("Yes", role: .cancel){
                                if changeColor{
                                    self.backgroundColor = Color.black
                                    self.circleColor = Color.white
                                    self.text = "Hello, Night"
                                    self.changeColor = false
                                }
                                
                                else{
                                    self.backgroundColor = Color.blue
                                    self.circleColor = Color.yellow
                                    self.text = "Hello, Day"
                                    self.changeColor = true
                                }
                            }
                        }}}
                    }
            .navigationBarTitle("Home")
                }
            }
        }
                        
                       
    
struct WeatherView: View {
    
    @State var backgroundColor = Color.blue
    @State private var showingSheet = false
    
    var body: some View {
        NavigationView{
            VStack(content:{
                Circle()
                    .foregroundColor(.yellow)
                    .scaleEffect(0.75)
                
                Button("Show Specifics"){
                    showingSheet = true
                }
                .foregroundColor(.black)
                .sheet(isPresented:$showingSheet){
                    SpecificsView()
                }
            })
            .padding()
            .navigationBarTitle("Weather")
        }
    }
}

struct ActivityView: View {
    var body: some View {
        NavigationView{
            VStack(content:{
            Text("Activities")
            })
            .padding()
            .navigationBarTitle("Activities")
        }
    }
}

struct SpecificsView: View {
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        Button("Press to Dismiss"){
            dismiss()
        }
        .foregroundColor(.black)
    }
}
    
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
}
