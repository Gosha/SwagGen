//
// Generated by SwagGen
// https://github.com/yonaskolb/SwagGen
//

import Foundation

public class PushTree: APIModel {

    public var customers: [Customer]

    public var errands: [Errand]

    public init(customers: [Customer], errands: [Errand]) {
        self.customers = customers
        self.errands = errands
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: StringCodingKey.self)

        customers = try container.decodeArray("customers")
        errands = try container.decodeArray("errands")
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: StringCodingKey.self)

        try container.encode(customers, forKey: "customers")
        try container.encode(errands, forKey: "errands")
    }

    public func isEqual(to object: Any?) -> Bool {
      guard let object = object as? PushTree else { return false }
      guard self.customers == object.customers else { return false }
      guard self.errands == object.errands else { return false }
      return true
    }

    public static func == (lhs: PushTree, rhs: PushTree) -> Bool {
        return lhs.isEqual(to: rhs)
    }
}
