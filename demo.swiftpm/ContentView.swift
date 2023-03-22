import SwiftUI
import RxSwift
import RxCocoa
struct ContentView: View {
    @ObservedObject private var _viewModel:ViewModelWrapper
    @State private var _searchText:String = ""
    
    init(viewModel:SearchViewModel){
        _viewModel = ViewModelWrapper(searchViewModel: viewModel)
    }
    var body: some View {
        VStack {
            TextField("Search",  text: $_searchText).textFieldStyle(RoundedBorderTextFieldStyle()).padding().onChange(of: _searchText){
                val in _viewModel.updateSearchText(val)
            }
            List(_viewModel.result){
                u in Text(u.name)
            }
        }
    }
}


private extension ContentView {
    class ViewModelWrapper: ObservableObject {
        let searchViewModel: SearchViewModel
        private let _result = BehaviorSubject<[User]>(value: [])
        
        var result: [User] {
            do {
                return try _result.value()
            }catch {
                return []
            }
        }
        
        init(searchViewModel:SearchViewModel) {
            self.searchViewModel = searchViewModel
            
            self.searchViewModel.searchUsers.observeOn(MainScheduler.instance).bind(to: _result)
            
            self._result.subscribe(onNext: {_ in self.objectWillChange.send()})
        }
        
        func updateSearchText(_ newText:String) {
            self.searchViewModel.searchText.accept(newText)
        }
    }
}
