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
    
    init(_ viewModel: Optional<AsNewViewModel>) {
        self.viewModel = viewModel;
    }
    
    var body: some View {
        IfLet(self.viewModel, whenPresent: { newSavedSearch in
            VStack {
                Text(newSavedSearch.node.title)
                    .lineLimit(nil)
                    .multilineTextAlignment(.center)
                    .padding(.all, 20.0)
                    .font(.headline)
                    .frame(width: UIScreen.main.bounds.width - 40)
                    .fixedSize(horizontal: false, vertical: true)
                
                ScrollView(.horizontal, content: {
                    HStack {
                        ForEach((newSavedSearch.jobs ?? []).indices, id: \.self) { index in
                            NotificationJobView(newSavedSearch.jobs?[index])
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
