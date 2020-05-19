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
    @ObservedObject var viewModel: CompanyRatingViewModel
    @State private var selectedRecommend: Int = -1
    var recommendSelections = ["Yes", "No"]
    var companyName: String
    
    @ViewBuilder
    var body: some View {
        VStack {
            Text("How would you rate working at \(companyName)")
            RatingView(0)
            Text("Would you recommend \(companyName)?")
            if selectedRecommend == -1 {
                Picker("Recommend?", selection: self.$viewModel.selectedRecommend) {
                    Text("Not Selected").tag(-1)
                    Text("Yes").tag(0)
                    Text("No").tag(1)
                }.pickerStyle(SegmentedPickerStyle())
                .onReceive(viewModel.objectWillChange) { (value) in
                    print(value)
                }
            }
            else {
                Text("\(recommendSelections[selectedRecommend])")
                AnimatedProgressView(progressValue: 0, newProgressValue: 0.8)
            }
        }
    }
}
