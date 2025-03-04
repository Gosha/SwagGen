//
// Generated by SwagGen
// https://github.com/yonaskolb/SwagGen
//

import Foundation

public class Question: APIModel {

    public var questionId: String

    public var message: Message

    public var question: QuestionType

    public init(questionId: String, message: Message, question: QuestionType) {
        self.questionId = questionId
        self.message = message
        self.question = question
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: StringCodingKey.self)

        questionId = try container.decode("questionId")
        message = try container.decode("message")
        question = try container.decode("question")
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: StringCodingKey.self)

        try container.encode(questionId, forKey: "questionId")
        try container.encode(message, forKey: "message")
        try container.encode(question, forKey: "question")
    }

    public func isEqual(to object: Any?) -> Bool {
      guard let object = object as? Question else { return false }
      guard self.questionId == object.questionId else { return false }
      guard self.message == object.message else { return false }
      guard self.question == object.question else { return false }
      return true
    }

    public static func == (lhs: Question, rhs: Question) -> Bool {
        return lhs.isEqual(to: rhs)
    }
}
