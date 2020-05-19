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
    var label = ""
    
    var offColor: Color
    var onColor: Color
    
    init(_ rating: Int, label: String, onColor: Color = Color.yellow, offColor: Color = Color.gray) {
        _rating = State<Int>(initialValue: rating)
        self.label = label
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
            if label.isEmpty == false {
                Text(label)
            }

            ForEach(1..<maximumRating + 1) { number in
                self.image(for: number)
                    .foregroundColor(number > self.rating ? self.offColor : self.onColor)
                    .onTapGesture {
                        self.rating = number
                    }
            }
        }
    }
}
