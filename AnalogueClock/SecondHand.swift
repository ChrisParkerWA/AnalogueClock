//
//  SeocondHand.swift
//  Shapes
//
//  Created by Chris Parker on 5/11/19.
//  Copyright © 2019 Chris Parker. All rights reserved.
//  Adapted from an original design by Amos Gyamfi 'nimbbble' on YouTube
//  https://www.youtube.com/watch?v=MAgHBAVxi-0
//

import SwiftUI

struct SecondHand: View {
    var body: some View {
        ZStack {
            Group {
                Rectangle()
                .frame(width: 300, height: 20, alignment: .center)
                .foregroundColor(.clear)
                Rectangle()
                    .frame(width: 200, height: 1)
                    .foregroundColor(.orange)
                Circle()
                    .frame(maxWidth: 10, maxHeight: 10)
                    .foregroundColor(.orange)
                    .offset(x: -100)
                Circle()
                    .stroke()
                    .frame(maxWidth: 20, maxHeight: 20)
                    .foregroundColor(.orange)
                    .offset(x: 110)
            }
            .offset(x: 40)
        }
    }
}

struct SecondHand_Previews: PreviewProvider {
    static var previews: some View {
        SecondHand()
    }
}
