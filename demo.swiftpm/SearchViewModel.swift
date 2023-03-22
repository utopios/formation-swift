//
//  SearchViewModel.swift
//  demo
//
//  Created by Ihab ABADI on 22/03/2023.
//

import Foundation

import RxSwift
import RxCocoa
class SearchViewModel : ObservableObject {
    
    private let _disposeBag = DisposeBag()
    let searchText = BehaviorRelay<String>(value: "")
    var allUsers:[User] = []
    let searchUsers: PublishSubject<[User]> = PublishSubject()
    init() {
        self.allUsers = [
            User(name: "toto"),
            User(name: "tata")
        ]
        searchText.distinctUntilChanged().debounce(.milliseconds(300), scheduler: MainScheduler.instance).map{
            c in self.allUsers.filter{
                u in u.name.lowercased().contains(c.lowercased())
            }
        }.bind{a in self.searchUsers.onNext(a)}.disposed(by: _disposeBag)
    }
    
    
    
    
}
