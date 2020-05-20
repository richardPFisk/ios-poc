//
//  NotificationItemView.swift
//  iosPoc
//
//  Created by Richard Fisk on 19/5/20.
//

import Foundation
import SwiftUI

struct NodeView: View {
    var viewModel: Notifications.Edge.Node
    var jobItemsViewModel: [JobViewModel]
    var ratingItemsViewModel: [RatingViewModel]
    
    var theme: Dictionary<String, Color> = [:]
    var viewed: Bool
    
    init(_ viewModel: Notifications.Edge.Node, theme: Dictionary<String, Color>, viewed: Bool) {
        self.theme = theme
        self.viewModel = viewModel
        self.jobItemsViewModel = viewModel.items.map { JobViewModel($0.asJob) }.compactMap { $0 }
        self.ratingItemsViewModel = viewModel.items.map { RatingViewModel($0.asRatingNotificationItem) }.compactMap { $0 }
        
        self.viewed = viewed
    }
    
    var body: some View {
        IfLet(self.viewModel, whenPresent: { newSavedSearch in
            VStack {
                VStack(spacing: 1) {
                    Text("New")
                        .font(.caption)
                        .foregroundColor(self.theme["textPositive"])
                        .padding(.all, 3)
                        .background(self.theme["backgroundPositive"])
                        .cornerRadius(5)
                        .opacity(!self.viewed ? 1 : 0)
                    Divider()
                        .opacity(!self.viewed ? 1 : 0)
                        .padding(.bottom, 0.0)
                    Text("\(self.viewModel.title.text)")
                        .foregroundColor(self.theme["textPrimary"])
                        .lineLimit(nil)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal, 10.0)
                        .font(.headline)
                        .fixedSize(horizontal: false, vertical: true)
                }
                if self.jobItemsViewModel.count == 1 {
                    HStack {
                        NotificationJobView(self.jobItemsViewModel[0], theme: self.theme)
                            .padding(.top, 8)
                            .padding(.bottom, 12.0)
                            .padding(.horizontal, 10.0)
                    }.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)
                }
                else if self.jobItemsViewModel.count > 1 {
                    ScrollView(.horizontal, content: {
                        HStack {
                            ForEach((self.jobItemsViewModel).indices, id: \.self) { index in
                                NotificationJobView(self.jobItemsViewModel[index], theme: self.theme)
                                    .padding(.top, 8)
                                    .padding(.bottom, 12.0)
                                    .padding(.horizontal, 10.0)
                            }
                        }
                    })
                }
                else if self.ratingItemsViewModel.count == 1 {
                    HStack {
                        CompanyRating(self.ratingItemsViewModel[0])
                    }.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)
                }
            }
        }, whenNil: {
            EmptyView()
        })
    }
}
