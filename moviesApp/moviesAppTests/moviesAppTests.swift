//
//  moviesAppTests.swift
//  moviesAppTests
//
//  Created by Federico Frias on 19/05/2019.
//  Copyright © 2019 ffrias. All rights reserved.
//

import XCTest
@testable import moviesApp

class moviesAppTests: XCTestCase {
    var newMovie:Movie!

    override func setUp() {
        super.setUp()
        let newMovie = Movie(id: 1, title: "Test Movie", voteAverage: 10, overview: "This is a testmovie", releaseDate: "01/01/2019", posterPath: "https://google.com")
    }

    override func tearDown() {
        super.tearDown()
        newMovie = nil
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testMovieModel(){
        let newMovie = Movie(id: 1, title: "Test Movie", voteAverage: 10, overview: "This is a testmovie", releaseDate: "01/01/2019", posterPath: "https://google.com")
       
        XCTAssertNotNil(newMovie, "The MOVIE model was created OK.")
        
    }

}
