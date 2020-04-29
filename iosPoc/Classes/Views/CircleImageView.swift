//
//  CircleImage.swift
//
//  Created by Richard Fisk on 27/4/20.
//  Copyright © 2020 mac. All rights reserved.
//

import Foundation
import SwiftUI

struct CircleImageView: View {
    var text: String
    
    var body: some View {
        GeometryReader { geo in
            ZStack {
                Circle()
                    .fill(Color.white)
                    .frame(width: geo.size.width, height: geo.size.width)
                    .shadow(radius: 4.0)
                Text(self.text)
                    .font(.caption)
                    .frame(width: CGFloat(Double(geo.size.width) * Double(2.0).squareRoot()/2.0), height: CGFloat(Double(geo.size.width) * Double(2.0).squareRoot()/2.0))
            }
        }
    }
}

struct CircleImageView_Previews: PreviewProvider {
    static var previews: some View {
        CircleImageView(text: "Advertiser name")
    }
}
