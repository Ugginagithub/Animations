//
//  ContentView.swift
//  Animations
//
//  Created by Tarun on 15/06/26.
//

import SwiftUI

//Cusotm animations requirement
struct CornerRotateModifier : ViewModifier {
    let amount: Double
    let anchorPoint : UnitPoint
    
    func body(content: Content) -> some View {
        content.rotationEffect(.degrees(amount), anchor: anchorPoint)
            .clipped()
    }
}

extension AnyTransition{
    static var pivot : AnyTransition {
        .modifier(active: CornerRotateModifier(amount: -90, anchorPoint: .topLeading), identity: CornerRotateModifier(amount: 0, anchorPoint: .topLeading))
    }
}


struct ContentView: View {
    @State private var animationAmount = 1.0
    
    //explicit animation variables
    @State private var animationAmountEx = 0.0
    
    //Controlling animation Stack variables
    @State private var enabled = false
    
    //Animating gestures variables
    @State private var dragAmount = CGSize.zero
    let letters = Array("Hello SwiftUI")
    
    //Showing and hiding View transitions variables
    @State private var isShowingRed = false
    
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
//        VStack {
//            Stepper("Scale amount", value: $animationAmount.animation(), in: 1...10)
//            
//            Spacer()
//            
//            Button("Tap me"){
//                animationAmount += 1
//            }
//            .padding(40)
//            .background(.red)
//            .foregroundColor(.white)
//            .clipShape(.circle)
//            .scaleEffect(animationAmount)
//        }
        
        
        //MARK: Creating explict animations
//        Button("Tap Me"){
//            withAnimation(.spring(duration: 1, bounce: 0.5)){ //we will get smooth bouncy effect.
//                animationAmountEx += 360
//            }
//        }
//        .padding(50)
//        .foregroundStyle(.white)
//        .background(.red)
//        .clipShape(.circle)
//        .rotation3DEffect(.degrees(animationAmountEx), axis: (x:0, y:1, z:0)) //As y is 1 rotates on y-axis, same as x and z
        
        
        //MARK: Controlling the animation Stack.
//        Button("Tap me"){
//            enabled.toggle()
//        }
//        .frame(width: 200, height: 200)
//        .background(enabled ? .blue : .red)
//        .foregroundStyle(.white)
//        .clipShape(.rect(cornerRadius: enabled ? 60 : 0)) // we are customising the clipshape modifier. "animation modifier" should be last only, that makes the smoother animations. because the "animation moifier" will "controlls" the modifiers about it.
//        .animation(.default, value: enabled) // we are customising animation modifier
        
        
        
        //MARK: Animating gestures gestures + animation
//        LinearGradient(colors: [.yellow, .red], startPoint: .topLeading, endPoint: .bottomTrailing)
//            .frame(width: 300, height: 200)
//            .clipShape(.rect(cornerRadius: 10))
//            .offset(dragAmount)
//            .gesture( //Handling drag gestures
//                DragGesture()
//                    .onChanged{ dragAmount = $0.translation }
//                    .onEnded{_ in
//                        withAnimation{
//                            dragAmount = .zero
//                        }
//                        
//                    }
//            )
//            .animation(.bouncy, value: dragAmount)
        
        //Amazing string animation.
//        HStack(spacing: 0) {
//            ForEach(0..<letters.count, id: \.self){ num in
//                Text(String(letters[num]))
//                    .padding(5)
//                    .font(.title)
//                    .background(enabled ? .blue : .red)
//                    .offset(dragAmount)
//                    .animation(.linear.delay(Double(num) / 20), value: dragAmount)
//            }
//        }
//        .gesture(
//            DragGesture()
//                .onChanged { dragAmount = $0.translation }
//                .onEnded { _ in
//                    dragAmount = .zero
//                    enabled.toggle()
//                }
//        )
        
        
        //MARK: Showing and hiding View transitions
//        VStack{
//            Button("Tap me"){
//                withAnimation{
//                    isShowingRed.toggle()
//                }
//            }
//            if isShowingRed {
//                Rectangle()
//                    .fill(.red)
//                    .frame(width: 200, height: 200)
//                    .transition(.asymmetric(insertion: .scale, removal: .opacity))
//            }
//        }
        
        //MARK: Building custom modifiers.
        ZStack{
            Rectangle()
                .fill(.blue)
                .frame(width: 200,height: 200)
            
            if isShowingRed {
                Rectangle()
                    .fill(.red)
                    .frame(width: 200,height: 200)
                    .transition(.pivot)
            }
        }
        .onTapGesture {
            withAnimation{
                isShowingRed.toggle()
            }
        }
        
        
    }
}

#Preview {
    ContentView()
}
