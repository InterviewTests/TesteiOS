//
//  FundAPI.swift
//  TesteSantander
//
//  Created by Marcel Mendes Filho on 04/05/2018.
//  Copyright © 2018 Marcel Mendes Filho. All rights reserved.
//

import UIKit

class FundAPI: NSObject
{
    func fetchFundData( URL: String, completionHandler: @escaping (Bool, String?, FundModel?) -> Void)
    {
        let fundModelToReturn = FundModel()

        // valida se a URL foi populada
        if URL == ""
        {
            completionHandler(false, "URL do formulário não foi definida", nil)
            return
        }
        
        let url = NSURL(string: URL)
        
        // faz o fetch do form
        URLSession.shared.dataTask(with: (url as URL?)!, completionHandler: {(data, response, error) -> Void in
            // se houve erro (timeout ou qualquer outro tipo de falha na obtenção do JSON)
            if error != nil
            {
                completionHandler(false, (error?.localizedDescription)!, nil)
            }
            else if let jsonObj = try? JSONSerialization.jsonObject(with: data!, options: .allowFragments)
            {
                if let dictionary = jsonObj as? [String: Any] {
                    if let nestedDictionary = dictionary["screen"] as? [String: Any] {
                        
                        if let title = nestedDictionary["title"] as? String
                        {
                            fundModelToReturn.title = title
                        }
                        
                        if let fundName = nestedDictionary["fundName"] as? String
                        {
                            fundModelToReturn.fundName = fundName
                        }

                        if let whatIs = nestedDictionary["whatIs"] as? String
                        {
                            fundModelToReturn.whatIs = whatIs
                        }
                        
                        if let definition = nestedDictionary["definition"] as? String
                        {
                            fundModelToReturn.definition = definition
                        }
                        if let riskTitle = nestedDictionary["riskTitle"] as? String
                        {
                            fundModelToReturn.riskTitle = riskTitle
                        }
                        
                        if let risk = nestedDictionary["risk"] as? Int
                        {
                            fundModelToReturn.risk = risk
                        }
                        
                        if let infoTitle = nestedDictionary["infoTitle"] as? String
                        {
                            fundModelToReturn.infoTitle = infoTitle
                        }
                        
                        if let nestedDictionary1 = nestedDictionary["moreInfo"] as? [String: Any]
                        {
                            if let nestedDictionary2 = nestedDictionary1["month"] as? [String: Any]
                            {
                                fundModelToReturn.fundPerformance.title = "No mês"

                                if let fund = nestedDictionary2["fund"] as? Double
                                {
                                    fundModelToReturn.fundPerformance.fund = fund
                                }

                                if let CDI = nestedDictionary2["CDI"] as? Double
                                {
                                    fundModelToReturn.fundPerformance.CDI = CDI
                                }
                                
                                fundModelToReturn.moreInfo.append(fundModelToReturn.fundPerformance)
                            }
                            
                            if let nestedDictionary3 = nestedDictionary1["year"] as? [String: Any]
                            {
                                fundModelToReturn.fundPerformance.title = "No ano"
                                
                                if let fund = nestedDictionary3["fund"] as? Double
                                {
                                    fundModelToReturn.fundPerformance.fund = fund
                                }
                                
                                if let CDI = nestedDictionary3["CDI"] as? Double
                                {
                                    fundModelToReturn.fundPerformance.CDI = CDI
                                }
                                
                                fundModelToReturn.moreInfo.append(fundModelToReturn.fundPerformance)
                            }
                            
                            if let nestedDictionary4 = nestedDictionary1["12months"] as? [String: Any]
                            {
                                fundModelToReturn.fundPerformance.title = "12 meses"
                                
                                if let fund = nestedDictionary4["fund"] as? Double
                                {
                                    fundModelToReturn.fundPerformance.fund = fund
                                }
                                
                                if let CDI = nestedDictionary4["CDI"] as? Double
                                {
                                    fundModelToReturn.fundPerformance.CDI = CDI
                                }
                                
                                fundModelToReturn.moreInfo.append(fundModelToReturn.fundPerformance)
                            }
                        }
                        
                        if let infoArray = nestedDictionary["info"] as? NSArray {
                            // loop através de todos os elementos
                            for thisInfo in infoArray
                            {
                                // converte cada elemento em um NSDictionary
                                if let infoDict = thisInfo as? NSDictionary
                                {
                                    if let name = infoDict.value(forKey: "name") as? String
                                    {
                                        fundModelToReturn.additionalInfo.name = name
                                    }
                                    
                                    if let data = infoDict.value(forKey: "data") as? String
                                    {
                                        fundModelToReturn.additionalInfo.data = data
                                    }
                                    
                                    fundModelToReturn.info.append(fundModelToReturn.additionalInfo)
                                }
                            }
                        }
                        
                        if let infoArray = nestedDictionary["downInfo"] as? NSArray {
                            // loop através de todos os elementos
                            for thisInfo in infoArray
                            {
                                // converte cada elemento em um NSDictionary
                                if let infoDict = thisInfo as? NSDictionary
                                {
                                    if let name = infoDict.value(forKey: "name") as? String
                                    {
                                        fundModelToReturn.additionalInfo.name = name
                                    }
                                    
                                    if let data = infoDict.value(forKey: "data") as? String
                                    {
                                        fundModelToReturn.additionalInfo.data = data
                                    }
                                    
                                    fundModelToReturn.downInfo.append(fundModelToReturn.additionalInfo)
                                }
                            }
                        }

                        completionHandler(true, nil, fundModelToReturn)
                        return
                    }
                    else
                    {
                        completionHandler(false, "Erro ao ler JSON", nil)
                        return
                    }
                }
                else
                {
                    completionHandler(false, "Formato JSON não compatível", nil)
                    return
                }
            }
            else
            {
                if let localizedError = error?.localizedDescription
                {
                    completionHandler(false, localizedError, nil)
                }
                else
                {
                    completionHandler(false, "Erro desconhecido", nil)
                }
                
                return
            }
        }).resume()
    }
}
