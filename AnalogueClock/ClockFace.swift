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
                
                //  Small Dots representing the minute intervals.
                SmallDots()
 
                //  Large Dots representing the 5 minute intervals and the Hours
                LargeDots()
                
            }
        }
    }
}

struct SmallDots: View {
    var body: some View {
        ZStack {
            ForEach(0..<60) { dot in
                Circle()
                    .frame(width: 2, height: 2)
                    .offset(y: -150)
                    .foregroundColor(.white)
                    .rotationEffect(.degrees(Double(dot) * 6))
            }
        }
    }
}

struct LargeDots: View {
    var body: some View {
        ZStack {
            ForEach(0..<12) { dot in
                Circle()
                    .frame(width: 8, height: 8)
                    .offset(y: -150)
                    .foregroundColor(.white)
                    .rotationEffect(.degrees(Double(dot) * 30))
            }
        }
    }
}

struct ClockFace_Previews: PreviewProvider {
    static var previews: some View {
        ClockFace()
    }
}
