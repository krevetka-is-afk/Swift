//
//  ViewController.swift
//  seminar4
//
//  Created by Сергей Растворов on 11/5/24.
//

import UIKit

class ViewController: UIViewController {
    let jsonDecoder = JSONDecoder()

    override func viewDidLoad() {
        super.viewDidLoad()
        var worker = BaseURLWorker(baseURL: "https://www.flickr.com")
        var requet = Request(endpoint: FlickrEndpoint.feeds)
        
        worker.execute(with: requet) { response in
            switch response {
            case .success(let serverResponse):
                print(serverResponse)
//                jsonDecoder.    
            case .failure(let error):
                print(error)
            }
        }
    }


}

enum FlickrEndpoint: Endpoint {
    case feeds

    var compositePath: String {
        switch self {
        case .feeds:
            return "/services/feeds/photos_public.gne"
        }
    }
    
    var headers: [String: String] {
        return [:]
    }
    
    var parameters: [String : String]? {
        switch self {
        case .feeds:
            return ["tags": "soccer", "format": "json"]
        }
    }
    
}

// https://www.flickr.com/services/feeds/photos_public.gne?tags=soccer&format=json
