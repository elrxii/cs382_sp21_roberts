// I had issues following along with instructions for this assignment.  I researched and utilized code from Big Nerd Ranch to complete this assignment.
// source:  Swift Programming: The Big Nerd Ranch Guide (3rd Edition)

//
//  Item.swift
//  Photorama
//
//  Created by Ethan Roberts on 04/02/21.
//

import Foundation

class Photo: Codable {
    let title: String
    let remoteURL: URL?
    let photoID: String
    let dateTaken: Date
    
    enum CodingKeys: String, CodingKey {
        case title
        case remoteURL = "url_z"
        case photoID = "id"
        case dateTaken = "datetaken"
    }
    
}
