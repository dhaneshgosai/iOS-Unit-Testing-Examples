//
//  DownloadClient.swift
//  Image Downloader
//
//  Created by Vinoth Vino on 03/08/19.
//  Copyright © 2019 Vinoth Vino. All rights reserved.
//

import Foundation

protocol SessionProtocol {
    func dataTask(with url: URL, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask
}

class DownloadClient {
    var session: SessionProtocol = URLSession.shared
    
    func downloadImage(withUrl url: String) {
        guard let url = URL(string: url) else { fatalError() }
        session.dataTask(with: url) { (data, response, error) in
            // code to create image
        }.resume()
    }
}

extension URLSession: SessionProtocol {}
