//
//  ContentView.swift
//  AnalogueClock
//
//  Created by Chris Parker on 6/11/19.
//  Copyright © 2019 Chris Parker. All rights reserved.
//  Adapted from an original design by Amos Gyamfi 'nimbbble' on YouTube
//  https://www.youtube.com/watch?v=MAgHBAVxi-0
//

import SwiftUI

struct SquareView: ViewModifier {
    var frameWidth: CGFloat
    func body(content: Content) -> some View {
        content
            .frame(width: frameWidth, height: 20)
            .background(Color.white)
            .foregroundColor(Color.black)
            .font(.headline)
            .clipShape(RoundedRectangle(cornerSize: CGSize(width: 5, height: 5)))
            .overlay(RoundedRectangle(cornerSize: CGSize(width: 1, height: 1))
            .stroke(Color.black))
            .opacity(1)
            .padding(2)
            .overlay(RoundedRectangle(cornerSize: CGSize(width: 5, height: 5))
            .stroke(Color.blue)
            .blur(radius: 3)
                .opacity(0.6))
    }
}

extension View {
    func smallSquareStyle() -> some View {
        self.modifier(SquareView(frameWidth: 40))
    }
    
    func largeSquareStye() -> some View {
        self.modifier(SquareView(frameWidth: 65))
    }
    
    func reduceOpacity() -> some View {
        self.modifier(QuarterOpacity())
    }
}

struct QuarterOpacity: ViewModifier {
    func body(content: Content) -> some View {
    content
        .frame(width: 30, height: 30)
        .background(Color.white)
        .foregroundColor(Color.black)
        .font(.title)
        .clipShape(RoundedRectangle(cornerSize: CGSize(width: 10, height: 10)))
        .overlay(RoundedRectangle(cornerSize: CGSize(width: 2, height: 2))
        .stroke(Color.black))
        .opacity(0.25)
        .padding(1)
        .overlay(RoundedRectangle(cornerSize: CGSize(width: 10, height: 10))
        .stroke(Color.black)
        .blur(radius: 3)
            .opacity(0.7))
    }
}

struct ContentView: View {
    @State private var hours: Double = 0
    @State private var minutes: Double = 0
    @State private var seconds: Double = 0
    @State private var AMorPM = ""
    @State private var todaysDate = ""
    //  0 degees is actually facing 'East' so this offset fixes that
    @State private var offset: Double = 90
    
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
  
    var body: some View {
        ZStack {
            ClockFace()
            
            Text("\(AMorPM)")
            .smallSquareStyle()
                .offset(x: 75, y: 0)
            Text("\(todaysDate)")
            .largeSquareStye()
                .offset(x: -75, y: 0)
            
            HourHand()
                .rotationEffect(.degrees(hours * 30 - offset))
            
            MinuteHand()
                .rotationEffect(.degrees(minutes * 6 - offset))
            
            SecondHand()
                .rotationEffect(.degrees(seconds * 6 - offset))
            Fulcrum()
            
        }
        .onAppear(perform: configureTime)
        .onReceive(timer) { value in
            if self.seconds == 59 {
                self.seconds = 0
            } else {
                self.seconds += 1
                self.minutes += 1 / 60
                self.hours += 1 / 3600
            }
            self.configureTime()
        }
    }
    
    func configureTime() {
        let date = Date()
        let calendar = Calendar.current
        //  We need to determine if it is AM or PM
        let dateFormatter = DateFormatter()
        //  Extracts hour in 24 hour mode
        dateFormatter.dateFormat = "HH"
        //  Convert the dateFormatter string output into a Double
        hours = Double(dateFormatter.string(from: date))!
        
        dateFormatter.dateFormat = "MMM dd"
        todaysDate = dateFormatter.string(from: date)
        
        minutes = Double(calendar.component(.minute, from: date))
        seconds = Double(calendar.component(.second, from: date))
   
        if hours >= 12 {
            hours = hours - 12
            AMorPM = "PM"
        } else {
            AMorPM = "AM"
        }
        
        minutes = minutes + seconds  / 60
        hours = hours + minutes / 60
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
