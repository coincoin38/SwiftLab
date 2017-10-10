//
//  Parser.swift
//  SwiftLab
//
//  Created by julien gimenez on 09/10/2017.
//  Copyright © 2017 julien gimenez. All rights reserved.
//

import Foundation

let urlRoot : String = "https://jsonplaceholder.typicode.com/"
let albumPath : String = "albums"
let getMethod : String = "GET"

func getAlbums(completion: @escaping (Bool, Any) ->())
{
    dataTask(path: albumPath, method: getMethod)
    {
        (success, data) in completion(success, data)
    }
}

private func dataTask(path : String, method : String, completion: @escaping (Bool, Any) ->())
{
    let url = URL(string: urlRoot + path)
    
    let request = URLRequest(url: url!)
    
    SLPrint(title: "Request",content: request)
    
    let session = URLSession(configuration: URLSessionConfiguration.default)
    
    session.dataTask(with: request, completionHandler: {
        
        (data, response, error) in
        
        let statusCode = (response as? HTTPURLResponse)?.statusCode
        
        if httpResponseHandler(statusCode: statusCode!)
        {
            if let data = data
            {
                let json = try? JSONSerialization.jsonObject(with: data, options: [])
                
                SLPrint(title: "Response",content: json!)
                
                completion(true, json as Any)
            }
        }
        else
        {
            let error = httpResponseError(statusCode: statusCode!)
            completion(false, error)
        }
  
    }).resume()
}

private func httpResponseHandler(statusCode: Int)->(Bool)
{
    SLPrint(title: "Status code",content: statusCode)
    
    let success : Bool = (200 ... 299).contains(statusCode)
    
    return success;
}

private func httpResponseError(statusCode : Int)->(String)
{
    switch statusCode {
    
    case 401:
        
        return "Unauthorized"
        
    case 404:
        
        return "Not found"
        
    default:
        
        return "Unknown error"
    }
}
