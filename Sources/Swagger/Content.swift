import Foundation
import JSONUtilities

public struct Content {
    public let mediaItems: [String: MediaItem]

    public enum MediaType: String {
        case json = "application/json"
        case jsonUtf8 = "application/json;charset=utf-8"
        case form = "application/x-www-form-urlencoded"
        case xml = "application/xml"
        case multipartForm = "multipart/form-data"
        case text = "text/plain"
    }

    public func getMediaItem(_ type: MediaType) -> MediaItem? {
        return mediaItems[type.rawValue] ?? mediaItems.first { type.rawValue.contains($0.key.replacingOccurrences(of: "*", with: "")) }?.value
    }

    public var jsonSchema: Schema? {
        if let json = getMediaItem(.json)?.schema {
            return json
        }

        if let jsonUt8 = getMediaItem(.jsonUtf8)?.schema {
            return jsonUt8
        }

        return nil
    }

    public var formSchema: Schema? {
        return getMediaItem(.form)?.schema
    }

    public var multipartFormSchema: Schema? {
        return getMediaItem(.multipartForm)?.schema
    }

    public var xmlSchema: Schema? {
        return getMediaItem(.xml)?.schema
    }
}

extension Content: JSONObjectConvertible {

    public init(jsonDictionary: JSONDictionary) throws {
        var mediaItems: [String: MediaItem] = [:]
        for key in jsonDictionary.keys {
            let mediaItem: MediaItem = try jsonDictionary.json(atKeyPath: .key(key))
            mediaItems[key] = mediaItem
        }
        self.mediaItems = mediaItems
    }
}

public struct MediaItem {
    public let schema: Schema
}

extension MediaItem: JSONObjectConvertible {

    public init(jsonDictionary: JSONDictionary) throws {
        schema = try jsonDictionary.json(atKeyPath: "schema")
    }
}
