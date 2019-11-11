//
//  MinuteHand.swift
//  Shapes
//
//  Created by Chris Parker on 6/11/19.
//  Copyright © 2019 Chris Parker. All rights reserved.
//  Adapted from an original design by Amos Gyamfi 'nimbbble' on YouTube
//  https://www.youtube.com/watch?v=MAgHBAVxi-0
//

import SwiftUI

struct MinuteHand: View {
    var body: some View {
        
        ZStack {
            Group {
                Rectangle()
                    .frame(width: 300, height: 2, alignment: .center)
                    .foregroundColor(.clear)
                Rectangle() // minutes
                    .frame(width: 130, height: 2)
                    .foregroundColor(.white)
            }
            .offset(x: 75)
        }
    }
}

struct MinuteHand_Previews: PreviewProvider {
    static var previews: some View {
        MinuteHand()
    }
}
