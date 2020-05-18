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
    var theme: Dictionary<String, UIColor> = [:]
    init(_ viewModel: Optional<ApplicationViewedViewModel>) {
        self.viewModel = viewModel;
    }
    
    var body: some View {
        IfLet(self.viewModel, whenPresent: { appViewed in
            VStack(alignment: .center, spacing: 20) {
                Text(appViewed.node.title)
                    .multilineTextAlignment(.center)
                    .font(.headline)
                    .padding(.top, 20.0)
                NotificationJobView(appViewed.job)
                    .padding(.all, 8.0)
//                Star(corners: 5, smoothness: 0.4)
//                    .fill(Color.yellow)
//                    .frame(width: 200, height: 200)
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
