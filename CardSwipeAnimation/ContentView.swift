//
//  ContentView.swift
//  CardSwipeAnimation
//
//  Created by Nazar Babyak on 24.02.2022.
//

import SwiftUI

struct ContentView: View {
    
    @State var backgroundViewSize: CGFloat = 80
    @State var size: CGSize = .zero
    
    var body: some View {
        GeometryReader { reader in
            ZStack(alignment: .center){
                Color.black.opacity(0.73)
                    .edgesIgnoringSafeArea(.all)
                VStack {
                    PageThree()
                }
                .frame(width: reader.size.width - 160, height: 550)
                .cornerRadius(30)
                .shadow(color: .black, radius: 5, x: 4, y: 4)
                .offset(x: 50, y: -50)
                VStack {
                    PageOne()
                }
                .frame(width: reader.size.width - self.backgroundViewSize, height: 550)
                .cornerRadius(30)
                .shadow(color: .black, radius: 5, x: 4, y: 4)
                .offset(x: 25, y: -25)
                VStack {
                    PageTwo()
                }
                .frame(width: reader.size.width - 50, height: 550)
                .cornerRadius(30)
                .shadow(color: .black, radius: 5, x: 4, y: 4)
                .gesture(DragGesture().onChanged({ (value) in
                    self.size = value.translation
                    self.backgroundViewSize = 50
                }).onEnded({ (value) in
                    self.size = .zero
                    self.backgroundViewSize = 80
                })
                )
                .offset(self.size)
            }
        }
        .animation(.spring())
    }
}

struct PageOne: View {
    var body: some View {
        VStack {
            HStack{
                Image("aaa")
                    .resizable()
                    .scaledToFill()
            }
        }
    }
}

struct PageTwo: View {
    var body: some View {
        VStack {
            HStack{
                Image("ccc")
                    .resizable()
                    .scaledToFill()
            }
        }
    }
}

struct PageThree: View {
    var body: some View {
        VStack {
            HStack{
                Image("bbb")
                    .resizable()
                    .scaledToFill()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
