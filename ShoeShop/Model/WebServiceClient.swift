//
//  WebServiceClient.swift
//  ShoeShop
//
//  Created by Wojciech Niemiec on 4/26/18.
//  Copyright © 2018 Wojciech Niemiec. All rights reserved.
//

import Foundation

typealias Completion = (ShoePage) -> Void

struct WebServiceClient {
    
    private var host = "www.shoeshop.us-east-2.elasticbeanstalk.com"
    private var findShoesPath = "/shoes/find"
    
    func getShoes(pagination: Pagination, completion: @escaping Completion) {

        var urlComponents = URLComponents()
        urlComponents.scheme = "http"
        urlComponents.host = host
        urlComponents.path = findShoesPath
        urlComponents.queryItems = pagination.toQueryItems()
        
        guard let url = urlComponents.url else {
            return
        }
        
        execute(request: URLRequest(url: url), with: completion)
    }
    
    private func execute(request: URLRequest, with completion: @escaping Completion) {
        URLSession.shared.dataTask(with: request, completionHandler: {(_data, _response, _error) in
            if let data = _data {
                do {
                    let shoePage = try JSONDecoder().decode(ShoePage.self, from: data)
                    completion(shoePage)
                } catch {}
            }
        }).resume()
    }
}
