//
//  ContentView.swift
//  FloatingCard
//
//  Created by Rahul Narayanan on 3/6/22.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject private var motionManager = MotionManager()
    @State private var xChange: CGFloat = 0.0
    @State private var yChange: CGFloat = 0.0
    
    var body: some View {
        VStack {
            Image("DemoImage")
                .resizable()
                .frame(width: 325, height: 275, alignment: .center)
                .cornerRadius(8.0)
                .shadow(color: .black, radius: 10.0, x: -motionManager.roll*15, y: -motionManager.pitch*15)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
