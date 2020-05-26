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
    
    var interfaceTypesOnly = false
    
    func getNavigationAction(actions: [Notifications.Edge.Node.Item.Title.Action]?) -> URL? {
        let optionalAction = actions?.map { $0.asNavigationAction }.compactMap { $0 }.first
        let url = URL(string: optionalAction?.action ?? "")
        
        if let urlValue = url {
            let path = urlValue.path
            let customScheme = "seekjobs:/\(path)"
            let customUrl = URL(string: customScheme)

            return customUrl
        }
        return nil
    }
    
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
                if !self.interfaceTypesOnly && self.jobItemsViewModel.count == 1 {
                    HStack {
                        NotificationJobView(self.jobItemsViewModel[0], theme: self.theme)
                            .padding(.top, 8)
                            .padding(.bottom, 12.0)
                            .padding(.horizontal, 10.0)
                    }.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)
                }
                else if !self.interfaceTypesOnly && self.jobItemsViewModel.count > 1 {
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
                else if !self.interfaceTypesOnly && self.ratingItemsViewModel.count >= 1 {
                    HStack {
                        CompanyRating(self.ratingItemsViewModel[0])
                    }.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)
                }
                else {
                    ScrollView(.horizontal, content: {
                        HStack(spacing: 8) {
                            ForEach(self.viewModel.items.indices, id: \.self) { index in
                                Text("\(self.viewModel.items[index].title.text)")
                                    .foregroundColor(.purple)
                                    .lineLimit(nil)
                                    .multilineTextAlignment(.center)
                                    .padding()
                                    .font(.headline)
                                    .overlay(
                                        Capsule(style: .continuous)
                                            .stroke(Color.purple, lineWidth: 6)
                                ).onTapGesture {
                                    let url = self.getNavigationAction(actions: self.viewModel.items[index].title.actions)
 
                                    if let urlValue = url {
                                        UIApplication.shared.open(urlValue, options: [:], completionHandler: { completed in
                                            print("completed {} {}", completed, urlValue)
                                        })
                                    }
                                }
                            }
                        }
                        .padding(.all, 10.0)
                        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)
                    })
                    .padding(.all, 10.0)
                }
            }
        }, whenNil: {
            EmptyView()
        })
    }
}
