//
//  SavingSong.swift
//  ScreenRecorder
//
//  Created by Aryan Garg on 11/01/23.
//

import Foundation

var userSong = UserSong()

class DataTemplate: Identifiable, Codable {
    var id = UUID()

    var Song : String

    init(Song: String) {
        self.Song = Song    }
}

func fileURL() throws -> URL {

    try FileManager.default.url(for: .documentDirectory,
                                in: .userDomainMask,
                                appropriateFor: nil,
                                create: false)
    .appendingPathComponent("ScreenRecorder.data")

}

func loadAppData(completion: @escaping (Result<DataTemplate, Error>)->Void) {
    DispatchQueue.global(qos: .background).async {
        do {
            let fileURL = try fileURL()
            guard let file = try? FileHandle(forReadingFrom: fileURL) else {
                DispatchQueue.main.async {
                    completion(.success(appData))
                }

                return
            }

            let decoded = try JSONDecoder().decode(DataTemplate.self, from: file.availableData)

            DispatchQueue.main.async {
                completion(.success(decoded))
            }

        } catch {
            DispatchQueue.main.async {
                completion(.failure(error))

            }
        }
    }
}


func saveAppData(completion: @escaping (Result<Int, Error>)->Void) {
    DispatchQueue.global(qos: .background).async {
        do {
            let data = try JSONEncoder().encode(appData)
            let outfile = try fileURL()
            try data.write(to: outfile)

            DispatchQueue.main.async {
                completion(.success(1))
            }

        } catch {
            DispatchQueue.main.async {
                completion(.failure(error))
            }
        }
    }
}


var appData: DataTemplate = DataTemplate(Song: userSong.savedText)

