//
//  WebServiceClient.swift
//  ShoeShop
//
//  Created by Wojciech Niemiec on 4/26/18.
//  Copyright © 2018 Wojciech Niemiec. All rights reserved.
//

import Foundation
import UIKit

typealias PageCompletion = (ShoePage) -> Void
typealias ImageCompletion = (Int, UIImage) -> Void

struct WebServiceClient {
    
    private var host = "www.shoeshop.us-east-2.elasticbeanstalk.com"
    private var shoesPath = "/shoes"
    private var findPath = "/find"
    private let idPath = "/%d"
    private let picturePath = "/picture"
    
    func getShoes(pagination: Pagination, completion: @escaping PageCompletion) {

        var urlComponents = URLComponents()
        urlComponents.scheme = "http"
        urlComponents.host = host
        urlComponents.path = shoesPath.appending(findPath)
        urlComponents.queryItems = pagination.toQueryItems()
        
        guard let url = urlComponents.url else {
            return
        }
        
        execute(request: URLRequest(url: url), with: completion)
    }
    
    func getPictures(for shoeIds: [Int], completion: @escaping ImageCompletion) {
        for id in shoeIds {
            var urlComponents = URLComponents()
            urlComponents.scheme = "http"
            urlComponents.host = host
            urlComponents.path = shoesPath.appendingFormat(idPath, id).appending(picturePath)
            
            guard let url = urlComponents.url else {
                return
            }
            
            execute(request: URLRequest(url: url), with: completion, relatedTo: id)
        }
    }
    
    private func execute(request: URLRequest, with completion: @escaping PageCompletion) {
        URLSession.shared.dataTask(with: request, completionHandler: {(_data, _response, _error) in
            if let data = _data {
                do {
                    let shoePage = try JSONDecoder().decode(ShoePage.self, from: data)
                    completion(shoePage)
                } catch {}
            }
        }).resume()
    }
    
    private func execute(request: URLRequest, with completion: @escaping ImageCompletion, relatedTo id: Int) {
        URLSession.shared.dataTask(with: request, completionHandler: {(_data, _response, _error) in
            if let data = _data {
                let shoeImage = UIImage(data: data)!
                completion(id, shoeImage)
            }
        }).resume()
    }
}
