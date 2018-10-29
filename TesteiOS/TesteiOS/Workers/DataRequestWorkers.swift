import Foundation

public enum LoadError {
    case url
    case taskError(error: Error)
    case noResponse
    case noData
    case responseStatusCode(code: Int)
    case invalidJSON
}

struct StatementsRequest: Codable {
    let statementList: [StatementListRequest]
    let error: EmptyErrorData?
    
    init(statementList: [StatementListRequest], error: EmptyErrorData?) {
        self.statementList = statementList
        self.error = error
    }
}

struct StatementListRequest: Codable {
    var title: String
    var desc: String
    var date: String
    var value: Double
}

struct EmptyErrorData: Codable {
    
}

public struct TransactionDataList {
    public var transaction: TransactionDataModel
    
    public init(transaction: TransactionDataModel) {
        self.transaction = transaction
    }
}

public struct TransactionDataModel {
    var title: String
    var desc: String
    var date: String
    var value: Double
    
    public init(title: String, desc: String, date: String, value: Double) {
        self.title = title
        self.desc = desc
        self.date = date
        self.value = value
    }
}

public struct ViewModelOfTransaction {
    var title: String
    var desc: String
    var date: String
    var value: Double
}
