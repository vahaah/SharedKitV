import Foundation

extension Optional where Wrapped == String {
    public func apply(with patch: String?) -> String {
        guard let self = self else { return patch ?? "" }
        return self + (patch ?? "")
    }
}

extension String {
    public func apply(with patch: String?) -> String {
        self + (patch ?? "")
    }

    public func apply(context: [String: CustomStringConvertible]) -> String {
        reduce(into: self) { result, char in
            if char == "{" {
                if let endIndex = result.firstIndex(of: "}"),
                   let key = String(result[result.index(after: char.startIndex)..<endIndex]),
                   let value = context[key]?.description {
                    result.removeSubrange(char.startIndex...endIndex)
                    result.insert(contentsOf: value, at: char.startIndex)
                }
            }
        }
    }

    public static var id: String { UUID().uuidString }
}
