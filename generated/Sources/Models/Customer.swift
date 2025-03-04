//
// Generated by SwagGen
// https://github.com/yonaskolb/SwagGen
//

import Foundation

public class Customer: APIModel {

    public var id: String

    public var events: [CustomerEvent]

    public init(id: String, events: [CustomerEvent]) {
        self.id = id
        self.events = events
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: StringCodingKey.self)

        id = try container.decode("id")
        events = try container.decodeArray("events")
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: StringCodingKey.self)

        try container.encode(id, forKey: "id")
        try container.encode(events, forKey: "events")
    }

    public func isEqual(to object: Any?) -> Bool {
      guard let object = object as? Customer else { return false }
      guard self.id == object.id else { return false }
      guard self.events == object.events else { return false }
      return true
    }

    public static func == (lhs: Customer, rhs: Customer) -> Bool {
        return lhs.isEqual(to: rhs)
    }
}
