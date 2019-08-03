//
//  DownloadClientTests.swift
//  Image DownloaderTests
//
//  Created by Vinoth Vino on 03/08/19.
//  Copyright © 2019 Vinoth Vino. All rights reserved.
//

import XCTest
@testable import Image_Downloader

class DownloadClientTests: XCTestCase {

    var sut: DownloadClient!
    var mockUrlSession: MockURLSession!
    
    override func setUp() {
        super.setUp()
        sut = DownloadClient()
        mockUrlSession = MockURLSession()
        sut.session = mockUrlSession
    }

    override func tearDown() {
        sut = nil
        super.tearDown()
    }

    func testDownload_UsesExpectedHost() {
        let imageUrl = imageURLStrings[3]
        sut.downloadImage(withUrl: imageUrl)
        guard let url = URL(string: imageUrl) else { XCTFail(); return }
        let urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: true)
        XCTAssertEqual(urlComponents?.host, "images.pexels.com")
    }
    
    func testDownload_UsesExpectedPath() {
          let imageUrl = imageURLStrings[3]
          sut.downloadImage(withUrl: imageUrl)
          guard let url = URL(string: "https://images.pexels.com/photos") else { XCTFail(); return }
          let urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: true)
          XCTAssertEqual(urlComponents?.path, "/photos")
      }
    
    func testPerformanceTestableFunction() {
        measure {
            sut.performanceTestableFunction()
        }
    }

}

extension DownloadClientTests {
    class MockURLSession: SessionProtocol {
        var url: URL?
        
        func dataTask(with url: URL, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
            self.url = url
            return URLSession.shared.dataTask(with: url)
        }
    }
}
