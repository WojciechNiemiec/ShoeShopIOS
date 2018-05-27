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
typealias SizesCompletion = ([SizeDTO]) -> Void

struct WebServiceClient {
    
    private var host = "www.shoeshop.us-east-2.elasticbeanstalk.com"
    private var shoesPath = "/shoes"
    private var findPath = "/find"
    private var sizePath = "/sizes"
    private let idPath = "/%d"
    private let picturePath = "/picture"
    
    func getShoes(pagination: Pagination, completion: @escaping PageCompletion) {

        guard let url = getFindComponents(pagination: pagination).url else {
            return
        }
        
        execute(request: URLRequest(url: url), with: completion)
    }
    
    func getShoes(phrase: String, pagination: Pagination, completion: @escaping PageCompletion) {
        
        var urlComponents = getFindComponents(pagination: pagination)
        urlComponents.path.append("/" + phrase)
        
        guard let url = urlComponents.url else {
            return
        }
        
        execute(request: URLRequest(url: url), with: completion)
    }
    
    func getShoes(filter: Filter, pagination: Pagination, completion: @escaping PageCompletion) {
        
        guard let url = getFindComponents(pagination: pagination).url else {
            return
        }
        
        do {
            var request = URLRequest(url: url)
            request.httpBody = try JSONEncoder().encode(filter)
            request.httpMethod = "POST"
            request.allHTTPHeaderFields = ["Content-Type": "application/json"]
            
            execute(request: request, with: completion)
        } catch {}
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
    
    func getSizes(for variantId: Int, completion: @escaping SizesCompletion) {
        var urlComponents = URLComponents()
        urlComponents.scheme = "http"
        urlComponents.host = host
        urlComponents.path = shoesPath.appendingFormat(idPath, variantId).appending(sizePath)
        
        URLSession.shared.dataTask(with: URLRequest(url: urlComponents.url!), completionHandler: {(_data, _response, _error) in
            if let data = _data {
                do {
                    let sizes = try JSONDecoder().decode(Array<SizeDTO>.self, from: data)
                    completion(sizes)
                } catch {}
            }
        }).resume()
    }
    
    private func getFindComponents(pagination: Pagination) -> URLComponents {
        var urlComponents = URLComponents()
        urlComponents.scheme = "http"
        urlComponents.host = host
        urlComponents.path = shoesPath.appending(findPath)
        urlComponents.queryItems = pagination.toQueryItems()
        
        return urlComponents
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
