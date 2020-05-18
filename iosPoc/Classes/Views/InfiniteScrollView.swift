
import SwiftUI

//extension Color {
//    var rgba: (red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat) {
//        var red: CGFloat = 0
//        var green: CGFloat = 0
//        var blue: CGFloat = 0
//        var alpha: CGFloat = 0
//        getRed(&red, green: &green, blue: &blue, alpha: &alpha)
//
//        return (red, green, blue, alpha)
//    }
//}

public struct InfiniteScrollView: View {
    @ObservedObject var viewModel = InfiniteScrollViewModel()
    var theme: Dictionary<String, Color> = ["blah" : Color(UIColor.blue), "viewed": Color(red: 225/255.0, green: 225/255.0, blue: 225/255.0)]
    
    private let viewedColor = Color(red: 225/255.0, green: 225/255.0, blue: 225/255.0)
    private let notViewedColor = Color(red: 253/255.0, green: 253/255.0, blue: 253/255.0)
    
    public init(){
        self.viewModel.getNewItems(currentListSize: 0)
        UITableView.appearance().separatorStyle = .none
    }
    public init(_ theme: Dictionary<String, Color>) {
        self.init()
        self.theme = theme
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
                            .onAppear {
                                self.viewModel.updateViewed(listItem.value.id, index)
                            }
                            .onDisappear {
                                self.viewModel.updateViewed(listItem.value.id, index)
                            }
                            .background(listItem.value.viewed ? self.viewedColor : self.notViewedColor)
                            .clipShape(RoundedRectangle(cornerRadius: 15.0))
                            .padding(.all, 20.0)
                            
                        ApplicationViewedView(listItem.value.applicationViewedViewModel)
                            .onAppear {
                                self.viewModel.updateViewed(listItem.value.id, index)
                            }
                            .onDisappear {
                                self.viewModel.updateViewed(listItem.value.id, index)
                            }
                            .background(listItem.value.viewed ? self.viewedColor : self.notViewedColor)
                            .clipShape(RoundedRectangle(cornerRadius: 15.0))
                            .padding(.all, 20.0)
                        
                        NotificationView(listItem.value)
                            .onAppear {
                                self.viewModel.updateViewed(listItem.value.id, index)
                            }
                            .onDisappear {
                                self.viewModel.updateViewed(listItem.value.id, index)
                            }
                            .background(listItem.value.viewed ? self.viewedColor : self.notViewedColor)
                            .clipShape(RoundedRectangle(cornerRadius: 15.0))
                            .padding(.all, 20.0)
                    }.onAppear {
                        let count = self.viewModel.items.count
                        if index == count-1 {
                            self.viewModel.getNewItems(currentListSize: count)
                        }
                    }
                    .frame(width: geo.size.width)
                    .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                    .background(Color.black)
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
