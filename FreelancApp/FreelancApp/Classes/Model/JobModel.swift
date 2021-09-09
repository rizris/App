//
//  JobModel.swift
//  FreelancApp
//
//  Created by Rizvi on 9/6/21.
//

import Foundation

struct JobModelData: Codable {
    let data: [JobModel]
}

struct JobModel: Codable {
    let id: String?
    let status: String?
    let starts_at: String?
    let ends_at: String?
    let distance: String?
    let earnings_per_hour: Earnings
    let job: Jobs
}

struct Earnings: Codable {
    let amount: Double?
    let currency: String?
}

struct Jobs: Codable {
    let id: String?
    let title: String?
    let extra_briefing: String?
    let links: JobLinks
    let report_at_address: Addresses
}

struct JobLinks: Codable {
    let hero_380_image: String?
}

struct Addresses: Codable {
    let number: String?
    let street: String?
    let city: String?
    let geo: Coordinates
}

struct Coordinates: Codable {
    let lat: Double?
    let lon: Double?
}

