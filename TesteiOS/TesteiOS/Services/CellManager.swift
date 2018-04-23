import Moya
import RxSwift

public class CellManager {
  
  static let provider = MoyaProvider<SantanderService>()
  
  public static func getCells() -> Observable<Cells>{
    return self.provider.rx.request(.cells)
      .asObservable()
      .filterSuccessfulStatusCodes()
      .map(Cells.self)
  }
}
