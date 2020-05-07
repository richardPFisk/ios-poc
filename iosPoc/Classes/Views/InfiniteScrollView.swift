
import SwiftUI

public struct InfiniteScrollView: View {
    @ObservedObject var viewModel = InfiniteScrollViewModel()
    
    private let viewedColor = Color(red: 225/255.0, green: 225/255.0, blue: 225/255.0)
    private let notViewedColor = Color(red: 253/255.0, green: 253/255.0, blue: 253/255.0)
    
    public init() {
        self.viewModel.getNewItems(currentListSize: 0)
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
                        NewSavedSearchView(listItem.value.asNewViewModel)
//                            .onAppear {
//                                listItem.value.asNewViewModel?.updateViewed(listItem.value.id, index)
//                            }
//                            .onDisappear {
//                                listItem.value.asNewViewModel?.updateViewed(listItem.value.id, index)
//                            }
                            .background(listItem.value.viewed ? self.viewedColor : self.notViewedColor)
                        
                        ApplicationViewedView(listItem.value.applicationViewedViewModel)
//                            .onAppear {
//                                listItem.value.applicationViewedViewModel?.updateViewed(listItem.value.id, index)
//                            }
//                            .onDisappear {
//                                listItem.value.applicationViewedViewModel?.updateViewed(listItem.value.id, index)
//                            }
                            .background(listItem.value.viewed ? self.viewedColor : self.notViewedColor)
                        
                    }.onAppear {
                        let count = self.viewModel.items.count
                        if index == count-1 {
                            self.viewModel.getNewItems(currentListSize: count)
                        }
                    }
                    .frame(width: geo.size.width)
                    .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                }
            }
        }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    InfiniteScrollView()
  }
}
