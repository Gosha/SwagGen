//
// Generated by SwagGen
// https://github.com/yonaskolb/SwagGen
//

import Foundation

public class QuestionItem: APIModel {

    public var id: String

    public var question: String

    public init(id: String, question: String) {
        self.id = id
        self.question = question
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: StringCodingKey.self)

        id = try container.decode("id")
        question = try container.decode("question")
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: StringCodingKey.self)

        try container.encode(id, forKey: "id")
        try container.encode(question, forKey: "question")
    }

    public func isEqual(to object: Any?) -> Bool {
      guard let object = object as? QuestionItem else { return false }
      guard self.id == object.id else { return false }
      guard self.question == object.question else { return false }
      return true
    }

    public static func == (lhs: QuestionItem, rhs: QuestionItem) -> Bool {
        return lhs.isEqual(to: rhs)
    }
}
