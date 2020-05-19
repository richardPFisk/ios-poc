//
//  NotificationView.swift
//  iosPoc
//
//  Created by Richard Fisk on 12/5/20.
//

import Foundation
import SwiftUI

struct NotificationView: View {
    var viewModel: Optional<NotificationViewModel>
    var viewed: Bool
    
    init?(_ viewModel: Optional<NotificationViewModel>, viewed: Bool) {
//        if let viewModelValue = viewModel, !viewModelValue.hasSpecificType {
//            self.viewModel = viewModel
//            self.viewed = viewed
//        }
//        else {
            return nil
//        }
    }
    
    var body: some View {
        IfLet(self.viewModel, whenPresent: { appViewed in
            VStack(alignment: .center, spacing: 20) {
                Text("NOPE title")
                    .multilineTextAlignment(.center)
                    .font(.headline)
                    .padding(.all, 30.0)

            }
            .frame(width: UIScreen.main.bounds.width)
            .gesture(TapGesture().onEnded {

//                let actionUrl = self.viewModel?.node.actionUrl ?? ""
//                let url = URL(string: actionUrl)!
//                
//                UIApplication.shared.open(url, options: [:], completionHandler: { completed in
//                    print("completed {} {}", completed, url)
//                })
            })
        }, whenNil: {
            EmptyView()
        })
    }
}
