//
//  Parser.swift
//  SwiftLab
//
//  Created by julien gimenez on 09/10/2017.
//  Copyright © 2017 julien gimenez. All rights reserved.
//



// https://thatthinginswift.com/write-your-own-api-clients-swift/


import Foundation

func getAlbums() {
    
    let url = URL(string: "https://jsonplaceholder.typicode.com/albums")
    
    let session = URLSession(configuration: URLSessionConfiguration.default)
    
    if let usableUrl = url {
        
        let task = session.dataTask(with: usableUrl, completionHandler: { (data, response, error) in
            
            if let data = data {
                
                if let stringData = String(data: data, encoding: String.Encoding.utf8) {
                    print(stringData)
                }
            }
        })
        task.resume()
    }
    
}
