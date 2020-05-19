
import SwiftUI


public struct InfiniteScrollView: View {
    @ObservedObject var viewModel = InfiniteScrollViewModel()
    var theme: Dictionary<String, Color> = [:]
    
    public init(){
        self.viewModel.getNewItems(currentListSize: 0)
        UITableView.appearance().separatorStyle = .none
        UITableView.appearance().backgroundColor = UIColor.clear
    }
    public init(_ theme: Dictionary<String, Color>) {
        self.init()
        self.theme = theme
        
        if let backgroundSec = theme["backgroundSecondary"] {
            UITableViewCell.appearance().backgroundColor = backgroundSec.uiColor()
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
                        NodeView(listItem, theme: self.theme, viewed: listItem.viewed)
                            .background(self.theme["backgroundPrimary"])
                            .clipShape(RoundedRectangle(cornerRadius: 15.0))
                            .padding(.all, 20.0)
                            .onAppear {
                                self.viewModel.updateViewed(listItem.id, index)
                            }
                            .onDisappear {
                                self.viewModel.updateViewed(listItem.id, index)
                            }

                    }.onAppear {
                        let count = self.viewModel.items.count
                        if index == count-1 {
                            self.viewModel.getNewItems(currentListSize: count)
                        }
                    }
                    .frame(width: geo.size.width)
                    .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                    .background(self.theme["backgroundSecondary"])
                }
            }
            .background(self.theme["backgroundSecondary"])
            
        }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    InfiniteScrollView()
  }
}
