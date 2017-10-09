//
//  Parser.swift
//  SwiftLab
//
//  Created by julien gimenez on 09/10/2017.
//  Copyright © 2017 julien gimenez. All rights reserved.
//



// https://thatthinginswift.com/write-your-own-api-clients-swift/


import Foundation

let urlRoot : String = "https://jsonplaceholder.typicode.com/"
let albumPath : String = "albums"
let getMethod : String = "GET"

func dataTask(path : String, method : String, completion:@escaping (Bool,AnyObject) ->()){
    
    let url = URL(string: urlRoot + path)
    
    let request = URLRequest(url:url!)
    
    let session = URLSession(configuration: URLSessionConfiguration.default)
    
    session.dataTask(with: request, completionHandler: { (data, response, error) in
        
        if let data = data {
            
            let json = try? JSONSerialization.jsonObject(with: data, options: [])
            
            completion(true,json as AnyObject)
            
        }
        
    }).resume()
}


