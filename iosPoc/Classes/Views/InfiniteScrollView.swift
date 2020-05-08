
import SwiftUI

public struct InfiniteScrollView: View {
    @ObservedObject var viewModel = InfiniteScrollViewModel()

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
                ForEach((self.viewModel.items).indices, id: \.self) { index in
                    VStack {
                        NewSavedSearchView(self.viewModel.items[index].asNewViewModel)
                        
                        ApplicationViewedView(self.viewModel.items[index].applicationViewedViewModel)
//                            .onAppear {
//                                self.viewModel.items[index].applicationViewedViewModel?.updateViewed(self.viewModel.items[index].id, index)
//                            }
//                            .onDisappear {
//                                self.viewModel.items[index].applicationViewedViewModel?.updateViewed(self.viewModel.items[index].id, index)
//                            }
//                            .background(self.viewModel.items[index].viewed ? self.viewedColor : self.notViewedColor)
                        
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
