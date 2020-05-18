//
//  ApplicationViewedView.swift
//
//  Created by Richard Fisk on 28/4/20.
//  Copyright © 2020 mac. All rights reserved.
//

import Foundation
import SwiftUI

struct ApplicationViewedView: View {
    var viewModel: Optional<ApplicationViewedViewModel>
    var theme: Dictionary<String, Color> = [:]
    var viewed: Bool
    
    init(_ viewModel: Optional<ApplicationViewedViewModel>, theme: Dictionary<String, Color>, viewed: Bool) {
        self.theme = theme
        self.viewModel = viewModel
        self.viewed = viewed
    }
    
    var body: some View {
        IfLet(self.viewModel, whenPresent: { appViewed in
            VStack(alignment: .center, spacing: 20) {
                HStack {
                   if !self.viewed {
                       Text("New")
                           .font(.caption)
                           .foregroundColor(self.theme["textPositive"])
                           .padding(.all, 3)
                           .background(self.theme["backgroundPositive"])
                           .cornerRadius(5)
                   }
                    Text(appViewed.node.title)
                        .foregroundColor(self.theme["textPrimary"])
                        .lineLimit(nil)
                        .multilineTextAlignment(.center)
                        .padding(.all, 20.0)
                        .font(.headline)
                        .fixedSize(horizontal: false, vertical: true)
                }

                NotificationJobView(appViewed.job, theme: self.theme)
                    .padding(.all, 8.0)
                RatingView(4, label: "Review")
                    .padding(.bottom, 20.0)
                ContentView(progressValue: 0.0, newProgressValue: 0.9)
            }
            .frame(width: UIScreen.main.bounds.width)
        }, whenNil: {
            EmptyView()
        })
    }
}
