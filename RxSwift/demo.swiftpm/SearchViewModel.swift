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
    
    var allUsers = BehaviorRelay<[User]>(value: [])
    var searchUsers: PublishSubject<[User]> = PublishSubject()
    
    init() {
        self.allUsers.accept([
            User(name: "toto"),
            User(name: "tata")
        ])
        searchText.throttle(.microseconds(300), scheduler: MainScheduler.instance).distinctUntilChanged().map{
            [unowned self] q in
            if(q == ""){
                return self.allUsers.value
            }else {
                return self.allUsers.value.filter {
                    f in f.name.contains(q.lowercased())
                }
            }
            
        }.bind{
            [unowned self] f in self.searchUsers.onNext(f)
        }.disposed(by: _disposeBag)
        
    }
    
    func removeUser(_ id:UUID) {
        var users = self.allUsers.value
                if let index = users.firstIndex(where: { $0.id == id }) {
                    users.remove(at: index)
                    self.allUsers.accept(users)
                }
    }
    
    
}
