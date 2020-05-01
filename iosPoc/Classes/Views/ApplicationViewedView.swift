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
    
    init(_ viewModel: Optional<ApplicationViewedViewModel>) {
        self.viewModel = viewModel;
    }
    
    var body: some View {
        IfLet(self.viewModel, whenPresent: { appViewed in
            VStack(alignment: .center, spacing: 20) {
                Text("Your application was viewed")
                    .font(.headline)
                    .padding(.top, 20.0)
                NotificationJobView(appViewed.job)
                    .padding(.all, 8.0)
            }
            .frame(width: UIScreen.main.bounds.width)
        }, whenNil: {
            EmptyView()
        })
    }
}
