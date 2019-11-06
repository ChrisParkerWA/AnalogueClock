//
//  Fulcrum.swift
//  Shapes
//
//  Created by Chris Parker on 6/11/19.
//  Copyright © 2019 Chris Parker. All rights reserved.
//  Adapted from an original design by Amos Gyamfi 'nimbbble' on YouTube
//  https://www.youtube.com/watch?v=MAgHBAVxi-0
//

import SwiftUI

struct Fulcrum: View {
    var body: some View {
        ZStack {
            Circle()
                .frame(maxWidth: 20, maxHeight: 20)
                .foregroundColor(.white)
            Circle()
                .frame(maxWidth: 15, maxHeight: 15)
                .foregroundColor(.blue)
            Circle()
                .frame(maxWidth: 5, maxHeight: 5)
                .foregroundColor(.black)
        }
    }
}

struct Fulcrum_Previews: PreviewProvider {
    static var previews: some View {
        Fulcrum()
    }
}
