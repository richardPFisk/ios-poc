//
//  RatingView.swift
//  iosPoc
//
//  Created by Richard Fisk on 15/5/20.
//

import Foundation
import SwiftUI
import Combine

struct RatingView : View {
    @State var rating: Int
    @State var label = ""
    
    var offColor: Color
    var onColor: Color
    
    init(_ rating: Int, onColor: Color = Color.yellow, offColor: Color = Color.gray) {
        _rating = State<Int>(initialValue: rating)
        self.onColor = onColor
        self.offColor = offColor
    }

    var maximumRating = 5

    var offImage: Image?
    var onImage = Image(systemName: "star.fill")

    func image(for number: Int) -> Image {
        if number > rating {
            return offImage ?? onImage
        } else {
            return onImage
        }
    }
    
    var body: some View {
        HStack {
            ForEach(1..<maximumRating + 1) { number in
                self.image(for: number)
                    .foregroundColor(number > self.rating ? self.offColor : self.onColor)
                    .onTapGesture {
                        self.rating = number
                        self.label = "\(number)/\(self.maximumRating)"
                    }
            }
            if label.isEmpty == false {
                Text(label)
            }
        }
    }
}
