import Foundation


struct LoginData: Codable {
    let userData: UserDataForLogin
    let error: EmptyErrorData?
    
    init(userData: UserDataForLogin, error: EmptyErrorData?) {
        self.userData = userData
        self.error = error
    }
}

struct UserDataForLogin: Codable {
    let userId: Int
    let name: String
    let bankAccount: String
    let agency: String
    let balance: Double
    
    init(userId: Int, name: String, bankAccount: String, agency: String, balance: Double) {
        self.userId = userId
        self.name = name
        self.bankAccount = bankAccount
        self.agency = agency
        self.balance = balance
    }
}

