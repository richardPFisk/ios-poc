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
                Text("New saved search jobs")
                    .padding(.top, 20.0)
                    .font(.headline)
        
                ScrollView(.horizontal, content: {
                    HStack {
                        ForEach((newSavedSearch.jobs ?? []).indices, id: \.self) { index in
                            NotificationJobView(newSavedSearch.jobs?[index])
                                .padding(.all, 8.0)
                        }
                    }
                })
                
            }
        }, whenNil: {
            EmptyView()
        }).onAppear {
            print("yo")
        }.onDisappear {
            print("bye")
        }
    }
}
