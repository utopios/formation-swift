//
//  DependencyContainer.swift
//  DiANDIoC
//
//  Created by Ihab ABADI on 02/05/2023.
//

import Foundation

class DependencyContainer {
    
    private var dependencies: [ObjectIdentifier: Any] = [:]
    
    //Register pour enregistrer la dépendance.
    
    func register<T>(_ type: T.Type, factory: @escaping () -> T) {
        let key = ObjectIdentifier(type)
        dependencies[key] = factory
    }
    //Resolver pour créer l'instance à partir du type enregistrée
    
    func resolver<T>() -> T {
        let key = ObjectIdentifier(T.self)
        guard let factory = dependencies[key] as? () -> T else {
            fatalError("Aucun type n'est enregistré dans container")
        }
        return factory()
    }
}
