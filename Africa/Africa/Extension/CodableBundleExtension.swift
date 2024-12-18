//
//  CodableBundleExtension.swift
//  Africa
//
//  Created by Singgih Aji Sasongko on 06/11/24.
//

import Foundation

extension Bundle {
    func decode<Kocak: Codable>(_ file: String) -> Kocak {
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("Failed to locate \(file) in bundle")
        }
        
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Failed to load \(file) from bundle.")
        }
        
        let decoder = JSONDecoder()
        
        guard let loaded = try? decoder.decode(Kocak.self, from: data) else {
            fatalError("Failed to decode \(file) from bundle.")
        }
        
        return loaded
    }
}
