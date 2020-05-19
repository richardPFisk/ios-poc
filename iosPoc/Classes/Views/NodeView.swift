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
    var itemsViewModel: [JobViewModel]
    var theme: Dictionary<String, Color> = [:]
    var viewed: Bool
    
    init(_ viewModel: Notifications.Edge.Node, theme: Dictionary<String, Color>, viewed: Bool) {
        self.theme = theme
        self.viewModel = viewModel
        self.itemsViewModel = viewModel.items.map { JobViewModel($0.asJob) }.compactMap { $0 }
        self.viewed = viewed
    }
    
    var body: some View {
        IfLet(self.viewModel, whenPresent: { newSavedSearch in
            VStack {
                VStack(spacing: 2) {
                    if !self.viewed {
                        Text("New")
                            .font(.caption)
                            .foregroundColor(self.theme["textPositive"])
                            .padding(.all, 3)
                            .background(self.theme["backgroundPositive"])
                            .cornerRadius(5)
                        Divider()

                    }
                    Text("\(self.viewModel.title.text)")
                        .foregroundColor(self.theme["textPrimary"])
                        .lineLimit(nil)
                        .multilineTextAlignment(.center)
                        .padding(.all, 20.0)
                        .font(.headline)
                        .fixedSize(horizontal: false, vertical: true)
                }
                if self.itemsViewModel.count == 1 {
                    HStack {
                        NotificationJobView(self.itemsViewModel[0], theme: self.theme)
                            .padding(.all, 8.0)
                    }.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)
                }
                else {
                    ScrollView(.horizontal, content: {
                        HStack {
                            ForEach((self.itemsViewModel).indices, id: \.self) { index in
                                NotificationJobView(self.itemsViewModel[index], theme: self.theme)
                                    .padding(.all, 8.0)
                            }
                        }
                    })
                }
                
            }
        }, whenNil: {
            EmptyView()
        })
    }
}
