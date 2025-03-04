//
// Generated by SwagGen
// https://github.com/yonaskolb/SwagGen
//

import Foundation

public class QuestionType: APIModel {

    public var freeText: Bool?

    public var multiChoice: [QuestionItem]?

    public var singleChoice: [QuestionItem]?

    public var yesNo: Bool?

    public init(freeText: Bool? = nil, multiChoice: [QuestionItem]? = nil, singleChoice: [QuestionItem]? = nil, yesNo: Bool? = nil) {
        self.freeText = freeText
        self.multiChoice = multiChoice
        self.singleChoice = singleChoice
        self.yesNo = yesNo
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: StringCodingKey.self)

        freeText = try container.decodeIfPresent("FreeText")
        multiChoice = try container.decodeArrayIfPresent("MultiChoice")
        singleChoice = try container.decodeArrayIfPresent("SingleChoice")
        yesNo = try container.decodeIfPresent("YesNo")
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: StringCodingKey.self)

        try container.encodeIfPresent(freeText, forKey: "FreeText")
        try container.encodeIfPresent(multiChoice, forKey: "MultiChoice")
        try container.encodeIfPresent(singleChoice, forKey: "SingleChoice")
        try container.encodeIfPresent(yesNo, forKey: "YesNo")
    }

    public func isEqual(to object: Any?) -> Bool {
      guard let object = object as? QuestionType else { return false }
      guard self.freeText == object.freeText else { return false }
      guard self.multiChoice == object.multiChoice else { return false }
      guard self.singleChoice == object.singleChoice else { return false }
      guard self.yesNo == object.yesNo else { return false }
      return true
    }

    public static func == (lhs: QuestionType, rhs: QuestionType) -> Bool {
        return lhs.isEqual(to: rhs)
    }
}
