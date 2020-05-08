//
//  ApplicationViewedView.swift
//
//  Created by Richard Fisk on 28/4/20.
//  Copyright © 2020 mac. All rights reserved.
//

import Foundation
import SwiftUI

struct ApplicationViewedView: View {
    @ObservedObject var viewModel: ApplicationViewedViewModel
    
    init?(_ viewModel: Optional<ApplicationViewedViewModel>) {
        if let viewModelValue = viewModel {
            self.viewModel = viewModelValue;
        }
        else {
            return nil
        }
    }
    
    var body: some View {
        VStack(alignment: .center, spacing: 20) {
            Text("Your application was viewed")
                .font(.headline)
                .padding(.top, 20.0)
            NotificationJobView(viewModel.job)
                .padding(.all, 8.0)
        }
        .frame(width: UIScreen.main.bounds.width)
        .onAppear {
            self.viewModel.updateViewed()
        }
        .onDisappear {
            self.viewModel.updateViewed()
        }
        .background(self.viewModel.viewed ? NotificationViewModel.viewedColor : NotificationViewModel.notViewedColor)
    }
}
