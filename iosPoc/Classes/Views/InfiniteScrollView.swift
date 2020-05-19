
import SwiftUI


public struct InfiniteScrollView: View {
    @ObservedObject var viewModel = InfiniteScrollViewModel()
    var theme: Dictionary<String, Color> = ["blah" : Color(UIColor.blue), "viewed": Color(red: 225/255.0, green: 225/255.0, blue: 225/255.0)]
    
    public init(){
        self.viewModel.getNewItems(currentListSize: 0)
        UITableView.appearance().separatorStyle = .none
        UITableView.appearance().backgroundColor = UIColor.clear
    }
    public init(_ theme: Dictionary<String, Color>) {
        self.init()
        self.theme = theme
        
        if let backgroundNeutral = theme["backgroundNeutral"] {
            UITableViewCell.appearance().backgroundColor = backgroundNeutral.uiColor()
        }
    }

    @ViewBuilder
    public var body: some View {

        if self.viewModel.isLoading {
            LoadingView()
        }
        else {
        GeometryReader { geo in
            List {
                ForEach(self.viewModel.items.enumerated().map({ $0 }), id: \.1.self.id) { (index, listItem) in
                    VStack {
//                        NewSavedSearchView(listItem.value.asNewViewModel, self.theme, viewed: listItem.value.viewed)
//                            .onAppear {
//                                self.viewModel.updateViewed(listItem.value.id, index)
//                            }
//                            .onDisappear {
//                                self.viewModel.updateViewed(listItem.value.id, index)
//                            }
//                            .background(self.theme["backgroundPrimary"])
//                            .clipShape(RoundedRectangle(cornerRadius: 15.0))
//                            .padding(.all, 20.0)
//
//                        ApplicationViewedView(listItem.value.applicationViewedViewModel, theme: self.theme, viewed: listItem.value.viewed)
//                            .onAppear {
//                                self.viewModel.updateViewed(listItem.value.id, index)
//                            }
//                            .onDisappear {
//                                self.viewModel.updateViewed(listItem.value.id, index)
//                            }
//                            .background(self.theme["backgroundPrimary"])
//                            .clipShape(RoundedRectangle(cornerRadius: 15.0))
//                            .padding(.all, 20.0)
                            
                        
//                        NotificationView(listItem.value, viewed: listItem.value.viewed)
//                            .onAppear {
//                                self.viewModel.updateViewed(listItem.value.id, index)
//                            }
//                            .onDisappear {
//                                self.viewModel.updateViewed(listItem.value.id, index)
//                            }
//                            .background(self.theme["backgroundPrimary"])
//                            .clipShape(RoundedRectangle(cornerRadius: 15.0))
//                            .padding(.all, 20.0)
                        Text("fuck")

                    }.onAppear {
                        let count = self.viewModel.items.count
                        if index == count-1 {
                            self.viewModel.getNewItems(currentListSize: count)
                        }
                    }
                    .frame(width: geo.size.width)
                    .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                    .background(self.theme["backgroundNeutral"])
                }
            }
            .background(self.theme["backgroundNeutral"])
            
        }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    InfiniteScrollView()
  }
}
