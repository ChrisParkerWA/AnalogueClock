//
//  ClockFace.swift
//  Shapes
//
//  Created by Chris Parker on 5/11/19.
//  Copyright © 2019 Chris Parker. All rights reserved.
//  Adapted from an original design by Amos Gyamfi 'nimbbble' on YouTube
//  https://www.youtube.com/watch?v=MAgHBAVxi-0
//

import SwiftUI

struct ClockFace: View {
    
    var body: some View {
        ZStack {
            ZStack {
                // Background
                RadialGradient(gradient: Gradient(colors: [Color.purple, Color.blue]), center: .center, startRadius: 5, endRadius: 500)
                    .scaleEffect(1.5)
                
                //  Outer intervals
                Group {
                    SmallDots()
                        .rotationEffect(.degrees(6))
                    SmallDots()
                        .rotationEffect(.degrees(12))
                    SmallDots()
                        .rotationEffect(.degrees(18))
                    SmallDots()
                        .rotationEffect(.degrees(24))
                    SmallDots()
                        .rotationEffect(.degrees(36))
                    SmallDots()
                        .rotationEffect(.degrees(42))
                    SmallDots()
                        .rotationEffect(.degrees(48))
                    SmallDots()
                        .rotationEffect(.degrees(54))
                }
                
                //  Large Dots representing the 5 minute intervals and the Hours
                LargeDots()
                LargeDots()
                    .rotationEffect(.degrees(30))
                
            }
        }
    }
}

struct SmallDots: View {
    var body: some View {
        Group {
            Circle()
                .offset(y: -150)
                .frame(maxWidth: 2, maxHeight: 2)
                .foregroundColor(.white)
                .rotationEffect(.degrees(0))
            Circle()
                .offset(y: -150)
                .frame(maxWidth: 2, maxHeight: 2)
                .foregroundColor(.white)
                .rotationEffect(.degrees(60))
            Circle()
                .offset(y: -150)
                .frame(maxWidth: 2, maxHeight: 2)
                .foregroundColor(.white)
                .rotationEffect(.degrees(120))
            Circle()
                .offset(y: -150)
                .frame(maxWidth: 2, maxHeight: 2)
                .foregroundColor(.white)
                .rotationEffect(.degrees(180))
            Circle()
                .offset(y: -150)
                .frame(maxWidth: 2, maxHeight: 2)
                .foregroundColor(.white)
                .rotationEffect(.degrees(240))
            Circle()
                .offset(y: -150)
                .frame(maxWidth: 2, maxHeight: 2)
                .foregroundColor(.white)
                .rotationEffect(.degrees(300))
        }
    }
}

struct LargeDots: View {
    var body: some View {
        Group {
            Circle()
                .offset(y: -150)
                .frame(maxWidth: 8, maxHeight: 8)
                .foregroundColor(.white)
                .rotationEffect(.degrees(0))
            Circle()
                .offset(y: -150)
                .frame(maxWidth: 8, maxHeight: 8)
                .foregroundColor(.white)
                .rotationEffect(.degrees(60))
            Circle()
                .offset(y: -150)
                .frame(maxWidth: 8, maxHeight: 8)
                .foregroundColor(.white)
                .rotationEffect(.degrees(120))
            Circle()
                .offset(y: -150)
                .frame(maxWidth: 8, maxHeight: 8)
                .foregroundColor(.white)
                .rotationEffect(.degrees(180))
            Circle()
                .offset(y: -150)
                .frame(maxWidth: 8, maxHeight: 8)
                .foregroundColor(.white)
                .rotationEffect(.degrees(240))
            Circle()
                .offset(y: -150)
                .frame(maxWidth: 8, maxHeight: 8)
                .foregroundColor(.white)
                .rotationEffect(.degrees(300))
        }
    }
}

struct ClockFace_Previews: PreviewProvider {
    static var previews: some View {
        ClockFace()
    }
}
