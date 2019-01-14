//
//  RequestSender.swift
//  SOA
//
//  Created by Петр Первухин on 14/01/2019.
//  Copyright © 2019 DropDead. All rights reserved.
//

import Alamofire


class RequestSender: IRequestSender {
    
    let session = URLSession.shared
    
    func send<Parser>(requestConfig config: RequestConfig<Parser>,
                      completionHandler: @escaping (Result<Parser.Model>) -> Void) {
        guard let urlRequest = config.request.urlRequest else {
            completionHandler(Result.error("url string can't be parsed to URL"))
            return
        }
        
        Alamofire.request(urlRequest).validate().responseData { response in
            switch response.result {
            case .success:
                guard let data = response.data,
                    let parserModel = config.parser.parse(data: data) else {
                        completionHandler(Result.error("received data can't be parsed"))
                        return
                }
                completionHandler(Result.success(parserModel))
            case .failure(let error):
                completionHandler(Result.error(error.localizedDescription))
                print("RequestSender:request error:",error)
            }
        }

    }
}
