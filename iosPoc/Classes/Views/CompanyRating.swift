//
//  CompanyRating.swift
//  iosPoc
//
//  Created by Richard Fisk on 19/5/20.
//

import Foundation
import SwiftUI

class CompanyRatingViewModel: ObservableObject {
    var selectedRecommend: Int = -1
}

struct CompanyRating : View {
    var viewModel: RatingViewModel
    var recommendSelections = ["Yes", "No"]
    
    init? (_ viewModel: RatingViewModel?) {
        if let viewModelValue = viewModel {
            self.viewModel = viewModelValue
        }
        else {
            return nil
        }
    }
    
    @ViewBuilder
    var body: some View {
        VStack {
//            Text(self.viewModel.title)
            RatingView(0)
                .padding(.all, 8.0)
                .padding(.bottom, 20.0)
//            Text("Would you recommend \(companyName)?")
            if self.viewModel.selectedCompanyRating == -1 {
//                Picker("Recommend?", selection: self.viewModel.$selectedCompanyRating) {
//                    Text("Not Selected").tag(-1)
//                    Text("Yes").tag(0)
//                    Text("No").tag(1)
//                }.pickerStyle(SegmentedPickerStyle())
//                .onReceive(viewModel.objectWillChange) { (value) in
//                    print(value)
//                }
            }
            else {
//                Text("\(recommendSelections[self.$viewModel.wouldRecommend ? 1 : 0])")
//                AnimatedProgressView(progressValue: 0, newProgressValue: self.$viewModel.companyRecommendedPercentage)
            }
        }
    }
}
