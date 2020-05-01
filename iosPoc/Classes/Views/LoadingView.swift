//
//  LoadingView.swift
//  AWSAppSync
//
//  Created by Richard Fisk on 30/4/20.
//

import Foundation
import SwiftUI

struct LoadingView: View {

    var body: some View {
        List {
            ForEach((1...10).reversed(), id: \.self) { index in
                return VStack {
                    Text("Your application was viewed")
                        .font(.headline)
                        .padding(.all, 8.0)
                        .frame(width: UIScreen.main.bounds.width)
                    CircleImageView(text: "Loading...")
                        .frame(width: 120, height: 120)
                    Text("Job title here")
                        .font(.footnote)
                }.frame(width: UIScreen.main.bounds.width - 60)
            }
        }.frame(width: UIScreen.main.bounds.width - 40, height: UIScreen.main.bounds.height)
        .disabled(true)
        .blur(radius: 3)
    }
}
