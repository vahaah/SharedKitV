import Foundation

extension String? {

    public func apply(with patch: String?) -> String? {
        if let existing = self {
            return existing + (patch ?? "")
        } else {
            return patch
        }
    }
}

extension String {

    public func apply(with patch: String?) -> String {
        guard let patch else { return self }
        return self + patch
    }

    public func apply(context: [String: any StringProtocol]) -> String {
        var out = self
        for (key, value) in context {
            out = out.replacingOccurrences(of: "{\(key)}", with: value)
        }
        return out
    }
    public static var id: String {
        UUID().uuidString
    }
}
