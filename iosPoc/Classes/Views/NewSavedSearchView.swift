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
    @ObservedObject var viewModel: AsNewViewModel
    
    init?(_ viewModel: Optional<AsNewViewModel>) {
        if let viewModelValue = viewModel {
            self.viewModel = viewModelValue
        }
        else {
            return nil
        }
    }
    
    var body: some View {
        VStack {
            Text("New saved search jobs")
                .padding(.top, 20.0)
                .font(.headline)
    
            ScrollView(.horizontal, content: {
                HStack {
                    ForEach((self.viewModel.jobs).indices, id: \.self) { index in
                        NotificationJobView(self.viewModel.jobs[index])
                            .padding(.all, 8.0)
                    }
                }
            })
        }.onAppear {
            self.viewModel.updateViewed()
        }
        .onDisappear {
            self.viewModel.updateViewed()
        }
        .background(self.viewModel.viewed ? NotificationViewModel.viewedColor : NotificationViewModel.notViewedColor)
    }
}
