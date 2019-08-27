//
//  Repository.swift
//  ToDoList1.1
//
//  Created by Erika de Almeida Segatto on 17/02/18.
//  Copyright © 2018 Erika de Almeida Segatto. All rights reserved.
//

import Foundation
import Realm
import RealmSwift
import RxSwift
import RxRealm

protocol AbstractRepository {
    associatedtype T
    func queryObject(id: String) -> T?
    func countObject() -> Int
    
    func queryAll() -> Observable<[T]>
    func query(with predicate: NSPredicate?,
               sortDescriptors: [NSSortDescriptor]) -> Observable<[T]>
    func save(entity: T) -> Observable<Void>
    func delete(entity: T) -> Observable<Void>
}

final class Repository<T:RealmRepresentable>: AbstractRepository where T == T.RealmType.DomainType, T.RealmType: Object {
    private let configuration: Realm.Configuration
    private let scheduler: RunLoopThreadScheduler
    
    private var realm: Realm {
        return try! Realm(configuration: self.configuration)
    }
    
    init(configuration: Realm.Configuration) {
        self.configuration = configuration
        let threadName = "com.todolist.realm.repository"
        self.scheduler = RunLoopThreadScheduler(threadName: threadName)
    }
    
    func queryObject(id: String) -> T? {
        return self.realm.object(ofType: T.RealmType.self, forPrimaryKey: id)?.asDomain()
    }
    
    func countObject() -> Int {
        return self.realm.objects(T.RealmType.self).count
    }
    
    func queryAll() -> Observable<[T]> {
        return Observable.deferred {
                let objects = self.realm.objects(T.RealmType.self)
                return Observable.array(from: objects).mapToDomain()
            }
            .subscribeOn(scheduler)
            .observeOn(MainScheduler.instance)
    }
    
    func query(with predicate: NSPredicate?,
               sortDescriptors: [NSSortDescriptor] = []) -> Observable<[T]> {
        return Observable.deferred {
                var objects = self.realm.objects(T.RealmType.self)
                if let predicate = predicate {
                    objects = objects.filter(predicate)
                }
                let sortedObjects = objects.sorted(by: sortDescriptors.map(SortDescriptor.init))
                return Observable.array(from: sortedObjects).mapToDomain()
            }
            .subscribeOn(scheduler)
            .observeOn(MainScheduler.instance)
    }
    
    func save(entity: T) -> Observable<Void> {
        return Observable.deferred {
                return self.realm.rx.save(entity: entity)
            }.subscribeOn(scheduler)
    }
    
    func delete(entity: T) -> Observable<Void> {
        return Observable.deferred {
                return self.realm.rx.delete(entity: entity)
            }.subscribeOn(scheduler)
    }
    
}
