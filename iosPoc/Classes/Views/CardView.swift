//
//  CardView.swift
//  iosPoc
//
//  Created by Richard Fisk on 18/5/20.
//

import Foundation

import SwiftUI

struct CardView<T>: View
    where T: View
{
    var theme: Dictionary<String, Color>
    var contentView: T
    
    var body: some View {
        VStack {
            Text("New")
                .multilineTextAlignment(.leading)
            contentView
        }
        .background(theme["backgroundPrimary"])
        .clipShape(RoundedRectangle(cornerRadius: 15.0))
        .padding(.all, 20.0)
    }
}
