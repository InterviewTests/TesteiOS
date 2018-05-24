
//
//  WebService.swift
//  AppTest
//
//  Created by Luan Orlando on 10/04/2018.
//  Copyright © 2018 Luan Orlando. All rights reserved.
//

import Foundation

@objc protocol WebServicesDelegate
{
    func getJson(json: [String:AnyObject])
    @objc optional func getJsonArray(json: NSArray)
}

class WebService: WebServicesDelegate
{
    internal func getJsonArray(json: NSArray) {}
    internal func getJson(json:[String:AnyObject]) {}
    
    public var delegate: WebServicesDelegate? = nil

    private var urlServer = ""
    private var function: String         /*if it is "Get" send the concatenated paramenters
     (Function?Field=Value&Field=Value&...)*/
    
    private var fields: String         /*Field(s) to send (Field=Value&field=Value&...)
     OPCIONAL, send ""*/
    private var userAuth: String    //When user Authentication is optional, send ""/
    private var passwordAuth: String      //User Auth OPCIONAL, Send ""/
    private var type: String           //DELETE,GET,POST ou PUT/
    private var token: String
    
    //Full contructor.
    init(function:String,fields:String,authUser:String,authPassword:String,type:String, token: String)
    {
        self.function = function
        self.fields = fields
        self.passwordAuth = authPassword
        self.userAuth = authUser
        self.type = type
        self.token = token
    }
    
    //Empty constructor
    init()
    {
        self.function = ""
        self.fields = ""
        self.passwordAuth = ""
        self.userAuth = ""
        self.type = ""
        self.token = ""
    }
    
    /*
     * Gets and Sets
     * */
    
    public func setUrlServer(urlServer:String)
    {
        self.urlServer = urlServer
    }
    
    public func getUrlServer() -> String
    {
        return urlServer
    }
    
    public func setFunction(function:String)
    {
        self.function = function
    }
    
    public func getFunction() -> String
    {
        return function
    }
    
    public func setFields(fields:String)
    {
        self.fields = fields
    }
    
    public func getFields() -> String
    {
        return fields
    }
    
    public func setUserAuth(userAuth:String)
    {
        self.userAuth = userAuth
    }
    
    public func getUserAuth() -> String
    {
        return userAuth
    }
    
    public func setPasswordAuth(authSenha:String)
    {
        self.passwordAuth = authSenha
    }
    
    public func getPasswordAuth() -> String
    {
        return passwordAuth
    }
    
    public func setType(type:String)
    {
        self.type = type
    }
    
    public func getType() -> String
    {
        return type
    }
    
    public func getToken() -> String
    {
        return self.token
    }
    
    public func setToken(token: String)
    {
        self.token = token
    }
    
    /*
     *  WebServices specifc functions
     * */
    
    public func showData()
    {
        print("""
            Campos preenchidos:
            URL: \(getUrlServer())
            Função: \(getFunction())
            Tipo de requisição: \(getType())
            Usuário: \(getUserAuth())
            Senha: \(getPasswordAuth())
            Parametros: \(getFields())
            """);
    }
    
    public func conect()
    {
        //Show values before sending.
        self.showData()
        
        var validateType = ""
        if (self.getType() == "GET")
        {
            validateType += "\(self.getUrlServer())\(self.getFunction())\(self.getFields().addingPercentEncoding(withAllowedCharacters: .urlPathAllowed)!)"
        }
        else
        {
            validateType = "\(self.getUrlServer())\(self.getFunction())"
        }
        
        guard let url = URL(string: validateType) else {return}
        
        print("url =\(url)")
        
        var request = URLRequest(url:url)
        
        //Informs the type of shipment
        request.httpMethod = self.getType()
        
        //if authentication is completed
        if(self.getPasswordAuth() != "" && self.getUserAuth() != "")
        {
            //Use section.
            let user = self.getUserAuth()
            let password   = getPasswordAuth()
            //converting data to send in the HEADER
            let login = String(format: "%@:%@", user, password)
            let loginData = login.data(using: String.Encoding.utf8)!
            let base64LoginString = loginData.base64EncodedString()
            request.setValue("Basic \(base64LoginString)", forHTTPHeaderField: "Authorization")
        }
        
        //if not be "GET" and there is fields
        if(self.getType() != "GET" && self.getFields() != "")
        {
            let camposPost = self.getFields()
            //Association of an enconding type
            request.httpBody = camposPost.data(using: String.Encoding.utf8)
        }
        
        let config: URLSessionConfiguration = .default
        config.httpMaximumConnectionsPerHost = 2
        config.timeoutIntervalForRequest = 10
        let session: URLSession = URLSession(configuration: config)
        
        let task: URLSessionTask = session.dataTask(with: request) { (response, responseOrNil, errorOrNil)->() in
            DispatchQueue.main.async(){
                
                var errorDescription = ""
                
                if let error = errorOrNil
                {
                    switch error
                    {
                    case URLError.networkConnectionLost, URLError.notConnectedToInternet:
                        print("no network connection")
                        errorDescription = "Sem conexão com a internet!"
                    case URLError.cannotFindHost, URLError.notConnectedToInternet:
                        print("cannot find the host, could be too busy, try again in a little while")
                        errorDescription = "Não foi possível conectar ao servidor!"
                    case URLError.cancelled:
                        print("don´t bother the user, we are doing what they want")
                        errorDescription = "Operação foi cancelada!"
                    case URLError.timedOut:
                        print("caiu aqui no timeout")
                        errorDescription = "Parece que a conexão esta meio lenta, tente de novo em instantes!"
                    default:
                        print("unknown error")
                        errorDescription = "Ocorreu um erro, tente de novo em instantes!"
                    }
                    
                    let errorDictionary: Dictionary = ["status": -9, "result": errorDescription] as [String : AnyObject]
                    
                    if(self.delegate != nil)
                    {
                        self.delegate?.getJson(json: errorDictionary as [String: AnyObject] )
                    }
                    
                    return
                }
                
                guard let _: HTTPURLResponse = responseOrNil as? HTTPURLResponse
                    else{
                        print("not an http response")
                        return
                }
                
                if let response = response
                {
                    do
                    {
                        if let json = try JSONSerialization.jsonObject(with: response, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String: AnyObject]
                        {
                            //Retornando para o protocolo o jSON
                            if(self.delegate != nil)
                            {
                                self.delegate?.getJson(json: json)
                            }
                        }
                        
                        if let jsonArray = try JSONSerialization.jsonObject(with: response, options: JSONSerialization.ReadingOptions.mutableContainers) as? NSArray
                        {
                            //Retornando para o protocolo o jSON
                            if(self.delegate != nil)
                            {
                                self.delegate?.getJsonArray!(json: jsonArray)
                            }
                        }
                        //self.indicator.stopActivity()
                    }
                    catch
                    {
                        //se nao conseguir se conectar ao webservice ira mostrar o erro aqui
                        print("Erro ao usar o Webservice: \(String(describing: errorOrNil))")
                        //self.indicator.stopActivity()
                        let message = "parece que há um problema para conectar, tente novamente mais tarde 😅"
                        let errorDictionary: Dictionary = ["status": -9, "result": message] as [String : AnyObject]
                        
                        if(self.delegate != nil)
                        {
                            self.delegate?.getJson(json: errorDictionary as [String: AnyObject] )
                        }
                    }
                }
                //print("http status = \(httpResponse.statusCode)")
                print("completed")
            }
        }
        //group.enter()
        task.resume()
    }
}
