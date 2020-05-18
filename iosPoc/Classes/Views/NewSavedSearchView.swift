//
//  NewSavedSearchView.swift
//
//  Created by Richard Fisk on 28/4/20.
//  Copyright © 2020 mac. All rights reserved.
//

import Foundation

import Foundation
import SwiftUI

struct NewSavedSearchView: View {
    var viewModel: Optional<AsNewViewModel>
    var theme: Dictionary<String, Color>
    var viewed: Bool
    
    init(_ viewModel: Optional<AsNewViewModel>, _ theme: Dictionary<String, Color>, viewed: Bool) {
        self.viewModel = viewModel
        self.theme = theme
        self.viewed = viewed
    }
    
    var body: some View {
        IfLet(self.viewModel, whenPresent: { newSavedSearch in
            VStack {
                HStack {
                    if !self.viewed {
                        Spacer(minLength: 7)
                        Text("New")
                            .font(.caption)
                            .foregroundColor(self.theme["textPositive"])
                            .padding(.all, 3)
                            .background(self.theme["backgroundPositive"])
                            .cornerRadius(5)
                    }
                    Text(newSavedSearch.node.title)
                        .foregroundColor(self.theme["textPrimary"])
                        .lineLimit(nil)
                        .multilineTextAlignment(.center)
                        .padding(.all, 20.0)
                        .font(.headline)
                        .fixedSize(horizontal: false, vertical: true)
                }
                ScrollView(.horizontal, content: {
                    HStack {
                        ForEach((newSavedSearch.jobs ?? []).indices, id: \.self) { index in
                            NotificationJobView(newSavedSearch.jobs?[index], theme: self.theme)
                                .padding(.all, 8.0)
                        }
                    }
                })
                
            }
            .frame(width: UIScreen.main.bounds.width)
        }, whenNil: {
            EmptyView()
        })
    }
}
