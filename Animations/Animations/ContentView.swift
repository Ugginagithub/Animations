//
//  ContentView.swift
//  Animations
//
//  Created by Tarun on 15/06/26.
//

import SwiftUI

struct ContentView: View {
    @State private var animationAmount = 1.0
    
    var body: some View {
        
        //MARK: Implicit animation
//        Button("Tap me") {
//            animationAmount += 1
//        }
//        .padding(50)
//        .background(.red)
//        .foregroundColor(.white)
//        .clipShape(.circle)
//        .scaleEffect(animationAmount)
//        .blur(radius: (animationAmount - 1) * 3) //Applying blur effect
//        .animation(.default, value: animationAmount) //MARK: this animates smoothly, it is an implicit animations (we have bounce animation .spring(duration: 1, bounce: 0.9),easeInOut(duration: 2), overlay .. etc)
        
        //MARK: Animation bindings
        // we will be binding the animations to views
        VStack {
            Stepper("Scale amount", value: $animationAmount.animation(), in: 1...10)
            
            Spacer()
            
            Button("Tap me"){
                animationAmount += 1
            }
            .padding(40)
            .background(.red)
            .foregroundColor(.white)
            .clipShape(.circle)
            .scaleEffect(animationAmount)
        }
    }
}

#Preview {
    ContentView()
}
