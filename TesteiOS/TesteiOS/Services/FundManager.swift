import Moya
import RxSwift

public class FundManager {
  
  static let provider = MoyaProvider<SantanderService>()

  public static func getFund() -> Observable<Fund>{
    return self.provider.rx.request(.fund)
      .asObservable()
      .filterSuccessfulStatusCodes()
      .map(Fund.self)
  }
}
