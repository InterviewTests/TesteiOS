//
//  ItemUseCase.swift
//  ToDoList1.1
//
//  Created by Erika de Almeida Segatto on 17/02/18.
//  Copyright © 2018 Erika de Almeida Segatto. All rights reserved.
//

import Foundation
import RxSwift
import Realm
import RealmSwift

//protocol ItemUseCase {
//    func getObject(id: String, from category: Category) -> Item
//    func getAll(from category: Category, orderBy attribute: String?) -> Observable<[Item]>
//    func get(from category: Category, with predicate: NSPredicate, orderBy attribute: String?) -> Observable<[Item]>
//    func save(_ object: Item) -> Observable<Void>
//    func delete(_ object: Item) -> Observable<Void>
//}
//
//final class ItemUseCaseImplementation<Repository>: ItemUseCase where Repository: AbstractRepository, Repository.T == Item {
//    
//    private let repository: Repository
//    init(repository: Repository) {
//        self.repository = repository
//    }
//    
//    func getObject(id: String, from category: Category) -> Item {
//        return repository.queryObject(id: id) ?? Item(in: category)
//    }
//    
//    func getAll(from category: Category, orderBy attribute: String? = nil) -> Observable<[Item]> {
//        let predicate = NSPredicate(format: "category.id == '\(category.id)'")
//        let sd = getSortDescriptor(by: attribute)
//        
//        return repository.query(with: predicate, sortDescriptors: sd)
//            .subscribeOn(ConcurrentMainScheduler.instance)
//            .observeOn(MainScheduler.instance)
//    }
//    func get(from category: Category, with predicate: NSPredicate, orderBy attribute: String?) -> Observable<[Item]> {
//        let predicate1 = NSPredicate(format: "category.id == '\(category.id)'")
//        let pred = NSCompoundPredicate(andPredicateWithSubpredicates: [predicate, predicate1])
//        let sd = getSortDescriptor(by: attribute)
//        
//        return repository.query(with: pred, sortDescriptors: sd)
//            .subscribeOn(ConcurrentMainScheduler.instance)
//            .observeOn(MainScheduler.instance)
//    }
//    
//    private func getSortDescriptor(by attribute: String?) -> [NSSortDescriptor] {
//        var sd: [NSSortDescriptor] = []
//        if let attribute = attribute {
//            sd.append(NSSortDescriptor(key: attribute, ascending: true))
//        }
//        return sd
//    }
//    
//    func save(_ object: Item) -> Observable<Void> {
//        return repository.save(entity: object)
//            .subscribeOn(ConcurrentMainScheduler.instance)
//            .observeOn(MainScheduler.instance)
//    }
//    
//    func delete(_ object: Item) -> Observable<Void> {
//        return repository.delete(entity: object)
//            .subscribeOn(ConcurrentMainScheduler.instance)
//            .observeOn(MainScheduler.instance)
//    }
//}
