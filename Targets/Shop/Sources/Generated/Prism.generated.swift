// Generated using Sourcery 1.6.1 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
// swiftlint:disable all

import Foundation
#if os(iOS) || os(tvOS) || os(watchOS)
import UIKit
#elseif os(OSX)
import AppKit
#endif


extension ShopAction {
    public var changeSection: ShopState.Mode? {
        get {
            guard case let .changeSection(associatedValue0) = self else { return nil }
            return (associatedValue0)
        }
        set {
            guard case .changeSection = self, let newValue = newValue else { return }
            self = .changeSection(newValue)
        }
    }

    public var isChangeSection: Bool {
        self.changeSection != nil
    }

    public var buy: Item? {
        get {
            guard case let .buy(associatedValue0) = self else { return nil }
            return (associatedValue0)
        }
        set {
            guard case .buy = self, let newValue = newValue else { return }
            self = .buy(newValue)
        }
    }

    public var isBuy: Bool {
        self.buy != nil
    }

}
