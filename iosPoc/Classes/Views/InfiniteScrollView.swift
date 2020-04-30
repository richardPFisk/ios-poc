
import SwiftUI

public struct InfiniteScrollView: View {
    @ObservedObject var viewModel = InfiniteScrollViewModel()
     
    public init() {
        self.viewModel.getNewItems(currentListSize: 0)
    }
    
    public var body: some View {
        GeometryReader { geo in
            List {
                ForEach(self.viewModel.items.enumerated().map({ $0 }), id: \.1.self.id) { (index, listItem) in
                    VStack {
                        Spacer()
                            .frame(width: geo.size.width)
                        
                        NewSavedSearchView(listItem.value.asNewViewModel)
                            .onAppear {
                                listItem.value.notificationUpdateViewed() 
                            }
                        ApplicationViewedView(listItem.value.applicationViewedViewModel)
                            .onAppear {
                                listItem.value.notificationUpdateViewed()
                            }

                        
                    }.onAppear {
                        let count = self.viewModel.items.count
                        if index == count-1 {
                            self.viewModel.getNewItems(currentListSize: count)
                        }
                    }
                    .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
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
