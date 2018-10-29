import Foundation

class RequestAndPostDataWorker {
    private static let configuration: URLSessionConfiguration = {
        let config = URLSessionConfiguration.default
        config.timeoutIntervalForRequest = 30.0
        return config
    }()
    private static let session = URLSession(configuration: configuration)
    
    class func getData<T: Codable>(id: Int, completion: @escaping (T) -> Void, onError: @escaping (LoadError) -> Void) {
        
        let path = "https://bank-app-test.herokuapp.com/api/statements/\(id)"
        
        guard let url = URL(string: path) else {
            return onError(.url)
        }
        
        let dataTask = session.dataTask(with: url) { (data, response, error) in
            
            self.requestResponse(completion: completion, onError: onError)(data, response, error)
            
        }
        dataTask.resume()
    }
    
     class func postData(loginData: LoginData, completion: @escaping (Bool) -> Void, onError: @escaping (LoadError) -> Void) {
        
        let path = "https://bank-app-test.herokuapp.com/api/login"
        
        guard let url = URL(string: path) else {
            return onError(.url)
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        
        
        guard let data = try? JSONEncoder().encode(loginData) else {
            completion(false)
            return
        }
        print(data)
        request.httpBody = data
        
        let dataTask = session.dataTask(with: request) { (data, response, error) in
            
            self.postRequestResponse(completion: completion, onError: onError)(data, response, error)
            
        }
        dataTask.resume()
        
    }
    
    class func requestResponse<T: Codable>(completion: @escaping (T) -> Void, onError: @escaping (LoadError) -> Void) -> ((Data?, URLResponse?, Error?) -> Void) {
        
        return { data, response, error in
            if error == nil {
                guard let response = response as? HTTPURLResponse else {
                    onError(.noResponse)
                    return
                }
                if response.statusCode == 200 {
                    guard let data = data else { return }
                    do {
                        let returnData = try JSONDecoder().decode(T.self, from: data)
                        print("return data \(returnData)")
                        completion(returnData)
                    } catch {
                        onError(.invalidJSON)
                    }
                    
                } else {
                    onError(.responseStatusCode(code: response.statusCode))
                }
            } else {
                onError(.taskError(error: error!))
            }
        }
    }
    
    class func postRequestResponse(completion: @escaping(Bool) -> Void, onError: @escaping(LoadError) -> Void) -> ((Data?, URLResponse?, Error?) -> Void) {
        return { data, response, error in
            if error == nil {
                guard let response = response as? HTTPURLResponse, response.statusCode == 200, let _ = data else {
                    onError(.noResponse)
                    return
                }
                completion(true)
            } else {
                completion(false)
            }
        }
    }
}
