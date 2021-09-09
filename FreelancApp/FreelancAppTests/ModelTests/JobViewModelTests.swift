//
//  JobViewModelTests.swift
//  FreelancAppTests
//
//  Created by Rizvi on 9/8/21.
//

import XCTest
@testable import FreelancApp

class JobViewModelTests: XCTestCase {

    var jobModel : JobModel?

    var jobViewModel : JobViewModel?
    
    override func setUp() {
        super.setUp()
        
        let earnings = Earnings(amount: 15.5, currency: "EUR")
        let jobLinks = JobLinks(hero_380_image: "https://temper.works/photo/graaqy")
        let jobGeo = Coordinates(lat: 51.661583, lon: 5.032999)
        let jobAddress = Addresses(number: "77", street: "Hoofdstraat", city: "Kaatsheuvel", geo: jobGeo)
        
        let job = Jobs(id: "gzap6a", title: "Enthousiaste verkoper", extra_briefing: "Blokker is opzoek naar verkoopmedewerkers! Je bent enthousiast, hebt al winkelervaring of wilt graag ervaring opdoen in de detailhandel.", links: jobLinks, report_at_address: jobAddress)
        
        jobModel = JobModel(id: "1", status: "published", starts_at: "2021-09-06T11:00:00+02:00", ends_at: "2021-09-06T18:00:00+02:00", distance: "", earnings_per_hour: earnings, job: job)
        
        jobViewModel = JobViewModel.init(jobModel!)
    }
    
    override func tearDown() {
        jobModel = nil
        jobViewModel = nil
        super.tearDown()
    }
    
    /*================================================================
    Description : Test jobviewmodel common items
    =================================================================*/
    func testCommonItems () {
        XCTAssertEqual(jobViewModel?.id, jobModel?.id, "Expected result 1")
        XCTAssertEqual(jobViewModel?.status, jobModel?.status, "Expected result published")
        
        XCTAssertEqual(jobViewModel?.starts_at, jobModel?.starts_at, "Expected result 2021-09-06T11:00:00+02:00")
        XCTAssertEqual(jobViewModel?.ends_at, jobModel?.ends_at, "Expected result 2021-09-06T18:00:00+02:00")
        
        XCTAssertEqual(jobViewModel?.distance, jobModel?.distance, "Expected result nil")
    }
    
    /*================================================================
    Description : Test jobViewModel job earnings
    =================================================================*/
    func testJobEarnings () {
        XCTAssertEqual(jobViewModel?.amount, jobModel?.earnings_per_hour.amount, "Expected result 15.5")
        XCTAssertEqual(jobViewModel?.currency, jobModel?.earnings_per_hour.currency, "Expected result EUR")
    }
    
    /*================================================================
    Description : Test jobViewModel job links
    =================================================================*/
    func testJobLinks () {
        XCTAssertEqual(jobViewModel?.jobImage, jobModel?.job.links.hero_380_image, "Expected result https://temper.works/photo/graaqy")
    }
    
    /*================================================================
    Description : Test jobViewModel Coordinates
    =================================================================*/
    func testLocationCoordinates () {
        XCTAssertEqual(jobViewModel?.lat, jobModel?.job.report_at_address.geo.lat, "Expected result 51.661583")
        XCTAssertEqual(jobViewModel?.lon, jobModel?.job.report_at_address.geo.lon, "Expected result 5.032999")
    }
    
    /*================================================================
    Description : Test jobViewModel location address
    =================================================================*/
    func testLocationAddress () {
        XCTAssertEqual(jobViewModel?.number, jobModel?.job.report_at_address.number, "Expected result 77")
        XCTAssertEqual(jobViewModel?.street, jobModel?.job.report_at_address.street, "Expected result Hoofdstraat")
        XCTAssertEqual(jobViewModel?.city, jobModel?.job.report_at_address.city, "Expected result Kaatsheuvel")
    }
    
    /*================================================================
    Description : Test jobViewModel distance
    =================================================================*/
    func testJobDistance () {
        let expectedResults = "SERVING 75.73 km"
        let distance = jobViewModel?.jobDistance()
        
        XCTAssertNotNil(distance)
        XCTAssertEqual(distance, expectedResults)
    }
    
    /*================================================================
    Description : Test jobViewModel distance negative
    =================================================================*/
    func testJobDistanceFailed () {
        let expectedResults = "SERVING 75.70 km"
        let distance = jobViewModel?.jobDistance()
        
        XCTAssertNotNil(distance)
        XCTAssertNotEqual(distance, expectedResults)
    }
    
    /*================================================================
    Description : Test jobViewModel Currency
    =================================================================*/
    func testCurrencyCode () {
        let modelCurrency = Locale.currencyCode((jobModel?.earnings_per_hour.currency)!)
        let currencyCode = Locale.currencyCode((jobViewModel?.currency)!)
        
        XCTAssertNotNil(currencyCode)
        XCTAssertNotNil(modelCurrency)
        XCTAssertEqual(currencyCode, modelCurrency)
    }
    
    /*================================================================
    Description : Test jobViewModel Currency Failed
    =================================================================*/
    func testCurrencyCodeFailed () {
        let modelCurrency = Locale.currencyCode((jobModel?.earnings_per_hour.currency)!)
        let currencyCode = Locale.currencyCode("USD")
        
        XCTAssertNotNil(currencyCode)
        XCTAssertNotNil(modelCurrency)
        XCTAssertNotEqual(currencyCode, modelCurrency)
    }
    
    /*================================================================
    Description : Test jobViewModel hourly rate
    =================================================================*/
    func testHourlyRate () {
        let currencyCode = Locale.currencyCode((jobViewModel?.currency)!)
        
        let expectedResults = "\(currencyCode)15.50"
        let rate = jobViewModel?.jobHourlyrate()
        
        XCTAssertNotNil(rate)
        XCTAssertEqual(rate, expectedResults)
    }
    /*================================================================
    Description : Test jobViewModel hourly rate failed
    =================================================================*/
    func testHourlyRateFailed () {
        let currencyCode = Locale.currencyCode((jobViewModel?.currency)!)
        
        let expectedResults = "\(currencyCode)15.55"
        let rate = jobViewModel?.jobHourlyrate()
        
        XCTAssertNotNil(rate)
        XCTAssertNotEqual(rate, expectedResults)
    }
    
    /*================================================================
    Description : Test jobViewModel job start time
    =================================================================*/
    func testJobStartTime () {
        let startTime = jobViewModel?.startTime()
        
        let expectedResults = "14:30"
        
        XCTAssertNotNil(startTime)
        XCTAssertEqual(startTime, expectedResults)
    }
    /*================================================================
    Description : Test jobViewModel job start time Failed
    =================================================================*/
    func testJobStartTimeFailed () {
        let startTime = jobViewModel?.startTime()
        
        let expectedResults = "14:35"
        
        XCTAssertNotNil(startTime)
        XCTAssertNotEqual(startTime, expectedResults)
    }
    
    /*================================================================
    Description : Test jobViewModel job End time
    =================================================================*/
    func testJobEndTime () {
        let startTime = jobViewModel?.endTime()
        
        let expectedResults = "21:30"
        
        XCTAssertNotNil(startTime)
        XCTAssertEqual(startTime, expectedResults)
    }
    
    /*================================================================
    Description : Test jobViewModel job End time Failed
    =================================================================*/
    func testJobEndTimeFailed () {
        let startTime = jobViewModel?.endTime()
        
        let expectedResults = "21:35"
        
        XCTAssertNotNil(startTime)
        XCTAssertNotEqual(startTime, expectedResults)
    }
    
    /*================================================================
    Description : Test jobViewModel working hours
    =================================================================*/
    func testWorkingHours () {
        let jobTime = jobViewModel?.jobTime()
        
        let expectedResults = "14:30 - 21:30"
        
        XCTAssertNotNil(jobTime)
        XCTAssertEqual(jobTime, expectedResults)
    }
    
    /*================================================================
    Description : Test jobViewModel working hours Failed
    =================================================================*/
    func testWorkingHoursFailed () {
        let jobTime = jobViewModel?.jobTime()
        
        let expectedResults = "14:30 - 21:40"
        
        XCTAssertNotNil(jobTime)
        XCTAssertNotEqual(jobTime, expectedResults)
    }
    

}
