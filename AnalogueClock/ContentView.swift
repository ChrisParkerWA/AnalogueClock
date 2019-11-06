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

struct ContentView: View {
    @State private var hours: Double = 0
    @State private var minutes: Double = 0
    @State private var seconds: Double = 0
    
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
  
    var body: some View {
        ZStack {
            ClockFace()
            
            HourHand()
                .rotationEffect(.degrees(hours * 30 - 90))
            
            MinuteHand()
                .rotationEffect(.degrees(minutes * 6 - 90))
            
            SecondHand()
                .rotationEffect(.degrees(seconds * 6 - 90))
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
        }
    }
    
    func configureTime() {
        let date = Date()
        let calendar = Calendar.current
        
        hours = Double(calendar.component(.hour, from: date))
        minutes = Double(calendar.component(.minute, from: date))
        seconds = Double(calendar.component(.second, from: date))
        
        minutes = minutes + seconds  / 60
        hours = hours + minutes / 60
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
