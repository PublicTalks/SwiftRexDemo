// Generated using Sourcery 1.6.1 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

// MARK: ShopAction

public extension ShopAction {
    enum CaseName: String {
        case changeSection
        case buy
    }
    var caseName: CaseName {
        switch self {
        case .changeSection: return .changeSection
        case .buy: return .buy
        }
    }
}

