//
//  NotificationJobView.swift
//
//  Created by Richard Fisk on 24/4/20.
//  Copyright © 2020 mac. All rights reserved.
//

import Foundation
import SwiftUI
import URLImage

struct NotificationJobView : View {
    let jobViewModel: JobViewModel?
    let ciContext = CIContext()
    var theme: Dictionary<String, Color>
    
    init(_ jobViewModel: JobViewModel?, theme: Dictionary<String, Color>) {
        self.jobViewModel = jobViewModel
        self.theme = theme
    }
    
    var body: some View {
        IfLet(self.jobViewModel, whenPresent: { job in
            ZStack {
                VStack {
                    IfLet(job.brandingLogo, whenPresent: { brandingLogo in
                        GeometryReader { geo in
                            ZStack {
                                Circle()
                                    .fill(Color.white)
                                    .frame(width: geo.size.width, height: geo.size.width)
                                    .shadow(radius: 4.0)
                                URLImage(brandingLogo,
                                    content: {
                                        $0.image
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                    })
                                    .frame(width: CGFloat(Double(geo.size.width) * Double(2.0).squareRoot()/2.0), height: CGFloat(Double(geo.size.width) * Double(2.0).squareRoot()/2.0))
                            }
                        }
                    },
                      whenNil: {
                        CircleImageView(text: (job.advertiser?.name ?? "New Job") as String, theme: self.theme)
                            .frame(width: 120, height: 120)
                    })
                    .frame(width: 120, height: 125)
                    
                    Text(job.title)
                        .font(.footnote)
                        .frame(width: 180, height: 50)
                }
            }.gesture(TapGesture().onEnded {

                let path = self.jobViewModel?.url.path ?? ""
                let customScheme = "seekjobs:/\(path)"
                let url = URL(string: customScheme)!
                
                UIApplication.shared.open(url, options: [:], completionHandler: { completed in
                    print("completed {} {}", completed, url)
                })
            })
        }, whenNil: {
            EmptyView()
        })
    }
}

struct NotificationJobView_Previews: PreviewProvider {
    static var previews: some View {
        NotificationJobView(JobViewModel(url: URL(string: "https://www.seek.com.au")!, title: "title", brandingLogo: URL(string: "https://image-service-cdn.cloud.seek.com.au/6aa399bad6c6109736adb6d1fdd0909a8438a5b7?timestamp=1587971674")), theme: [:])
    }
}
