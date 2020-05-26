//
//  LoadingView.swift
//  AWSAppSync
//
//  Created by Richard Fisk on 30/4/20.
//

import Foundation
import SwiftUI

struct LoadingView: View {
    var theme: Dictionary<String, Color> = [:]
    
    init(_ theme: Dictionary<String, Color>) {
        self.theme = theme
    }
    
    var body: some View {
        List {
            ForEach((1...10).reversed(), id: \.self) { index in
                return VStack(alignment: .center) {
                    HStack {
                        Spacer()
                    }
                    Text("Your application was viewed")
                        .font(.headline)
                        .disabled(true)
                        .blur(radius: 3)
                    CircleImageView(text: "Loading...", theme: [:])
                        .frame(width: 120, height: 120)
                        .padding(.all, 8.0)
                        .disabled(true)
                        .blur(radius: 3)
                    Text("Job title here")
                        .font(.footnote)
                        .padding(.bottom, 20.0)
                        .disabled(true)
                        .blur(radius: 3)
                }
                .padding(.all, 20.0)
                .background(self.theme["backgroundPrimary"])
            }
        }
    }
}
