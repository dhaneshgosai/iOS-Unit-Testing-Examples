//
//  PhotoViewControllerTests.swift
//  Image DownloaderTests
//
//  Created by Vinoth Vino on 02/08/19.
//  Copyright © 2019 Vinoth Vino. All rights reserved.
//

import XCTest
@testable import Image_Downloader

class PhotoViewControllerTests: XCTestCase {

    var sut: PhotoViewController!
    
    override func setUp() {
        super.setUp()
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        sut = storyboard.instantiateViewController(identifier: "PhotoViewController")
        sut.loadViewIfNeeded()
    }

    override func tearDown() {
        sut = nil
        super.tearDown()
    }

    func testPhotoDownload_ImageOrientationIsIdentical() {
        let expectedImageOrientation = UIImage(named: "pexels-photo-768562")?.imageOrientation
        guard let url = URL(string: imageURLStrings[0]) else { XCTFail(); return }
        let sessionAnsweredExpectation = expectation(description: "Session")
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                XCTFail(error.localizedDescription)
            }
            
            if let data = data {
                guard let image = UIImage(data: data) else { return }
                sessionAnsweredExpectation.fulfill()
                XCTAssertEqual(image.imageOrientation, expectedImageOrientation)
            }
        }.resume()
        
        waitForExpectations(timeout: 28, handler: nil)
    }

}
