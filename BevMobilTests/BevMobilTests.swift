//
//  SampleProjTests.swift
//  SampleProjTests
//
//  Created by Zack Sai on 5/26/22.
//

import XCTest
@testable import BevMobil


class BevMobilTests: XCTestCase {

    // Default test methods
    override func setUp()  {
        super.setUp()
    }

    override func tearDown()  {
        super.tearDown()
    }

    // Test profile constructor with no parameters initialized
    func testDefaultProfileConstructor() {
        
        // Create empty sample
        let sample = Profile()
        
        // Assert default values
        XCTAssert(sample.business == false)
        XCTAssert(sample.name == "")
        XCTAssert(sample.hours == "")
        XCTAssert(sample.phoneNumber == "")
        XCTAssert(sample.address == "")
    }
    
    // Test profile constructor with all parameters initialized
    func testProfileConstructor() {
        
        // Create full sample
        let sample = Profile(name: "MiraCosta Brewers", phoneNumber: "760.711.7111", address: "1 Barnard Dr", business: true, hours: "9-5")
        
        // Assert given values (play with assertfalse)
        XCTAssert(sample.business == true)
        XCTAssert(sample.name == "MiraCosta Brewers")
        XCTAssert(sample.hours == "9-5")
        XCTAssert(sample.phoneNumber == "760.711.7111")
        XCTAssert(sample.address == "1 Barnard Dr")
    }
        
    // Use more advanced tests to ensure altering profile objects works fine
    func testFalsePositiveProfiles(){
        
        // Simle false test
        let sample = Profile()
        XCTAssertFalse(sample.name == "MiraCosta Brewers")
        
        // Change value and test
        sample.name = "MiraCosta Brewers"
        XCTAssertFalse(sample.name == "")
        
        // Change value using another profile and test
        let newSample = Profile(name: "MiraCosta Brewers")
        XCTAssertEqual(newSample.name, sample.name)
        
        
        
    }

}
