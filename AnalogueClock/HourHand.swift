//
//  HourHand.swift
//  Shapes
//
//  Created by Chris Parker on 6/11/19.
//  Copyright © 2019 Chris Parker. All rights reserved.
//  Adapted from an original design by Amos Gyamfi 'nimbbble' on YouTube
//  https://www.youtube.com/watch?v=MAgHBAVxi-0
//

import SwiftUI

struct HourHand: View {
    var body: some View {
        ZStack {
            Group {
                Rectangle()
                    .frame(width: 300, height: 2, alignment: .center)
                    .foregroundColor(.clear)
                Rectangle() // hours
                .frame(width: 60, height: 2)
                .foregroundColor(.red)
            }
            .offset(x: 40)
        }
    }
}

struct HourHand_Previews: PreviewProvider {
    static var previews: some View {
        HourHand()
    }
}
