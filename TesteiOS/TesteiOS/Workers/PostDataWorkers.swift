import Foundation

struct PostData {
    let userAccount: DataFromPostData
}

struct DataFromPostData: Codable {
    let userID: Int
    let name: String
    let bankAccount: String
    let agency: String
    let balance: Double
    
    init(userID: Int, name: String, bankAccount: String, agency: String, balance: Double) {
        self.userID = userID
        self.name = name
        self.bankAccount = bankAccount
        self.agency = agency
        self.balance = balance
    }
}

struct DataToBePosted {
    var userAccount: DetailDataToBePosted
}

struct DetailDataToBePosted {
    var userId: Int
    var name: String
    var bankAccount: String
    var agency: String
    var balance: Double
}

struct ViewModelPostData {
    
}
