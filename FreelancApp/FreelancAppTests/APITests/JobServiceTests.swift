//
//  JobServiceTests.swift
//  FreelancAppTests
//
//  Created by Rizvi on 9/8/21.
//

import XCTest
@testable import FreelancApp

class JobServiceTests: XCTestCase {

    var jobService : JobService?
    
    override func setUp() {
        super.setUp()
        jobService = JobService()
    }
    
    override func tearDown() {
        jobService = nil
        super.tearDown()
    }

    /*================================================================
    Description : Test get job service
    =================================================================*/
    func testGetJobs(){
        let exceptions = self.expectation(description: "job list api parse exceptions")
        let parameter: [String: Any] = [
            "date": Utility.DateSection.getSimpleDate()
        ]
        
        let urlString = "\(Constant.App.BASE_URL)shifts?filter[date]=\(parameter["date"] as! String)"
        
        guard let url = URL(string: urlString) else {
            XCTFail()
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        request.setValue("application/json", forHTTPHeaderField: "accept")
        
        NetworkManager.baseRequest(request) { (success, message, data) in
            guard let data = data else {
                XCTFail()
                return
            }
            do {
                let jobModelData = try JSONDecoder().decode(JobModelData.self, from: data)
                if jobModelData.data.count > 0 {
                    XCTAssertNotNil(jobModelData.data, "Doctor list should not be nill")
                    XCTAssertEqual("", message)
                }else {
                    XCTAssertEqual(0,jobModelData.data.count)
                }
            } catch {
                XCTAssertNotNil(message, "It should return a error message")
            }
            exceptions.fulfill()
        }
        self.waitForExpectations(timeout: 10.0, handler: nil)
    }
    
    /*================================================================
    Description : Test get job service Failed
    =================================================================*/
    func testGetJobsFailed(){
        let exceptions = self.expectation(description: "job list api parse exceptions")
        let parameter: [String: Any] = [
            "date": "2021-09-01"
        ]
        
        let urlString = "\(Constant.App.BASE_URL)shifts?filter[date]=\(parameter["date"] as! String)"
        
        guard let url = URL(string: urlString) else {
            XCTFail()
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        request.setValue("application/json", forHTTPHeaderField: "accept")
        
        NetworkManager.baseRequest(request) { (success, message, data) in
            guard let data = data else {
                XCTFail()
                return
            }
            do {
                let jobModelData = try JSONDecoder().decode(JobModelData.self, from: data)
                if jobModelData.data.count > 0 {
                    XCTAssertNotNil(jobModelData.data, "Job list should not be nill")
                }else {
                    XCTAssertEqual(0,jobModelData.data.count)
                }
            } catch {
                XCTAssertNotNil(message, "It should return a error message")
            }
            exceptions.fulfill()
        }
        self.waitForExpectations(timeout: 10.0, handler: nil)
    }
}
