//
//  WeatherView.swift
//  NavigableApp
//
//  Created by Apoorva Kanekal on 9/20/23.
//

import SwiftUI

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

struct SpecificsView: View {
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        Button("Press to Dismiss"){
            dismiss()
        }
        .foregroundColor(.black)
    }
}
