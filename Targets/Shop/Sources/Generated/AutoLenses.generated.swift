// Generated using Sourcery 1.6.1 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
// swiftlint:disable variable_name


infix operator .~: MultiplicationPrecedence
infix operator |>: AdditionPrecedence

public struct Lens<Whole, Part> {
    let get: (Whole) -> Part
    let set: (Part, Whole) -> Whole
}

public func + <A, B, C> (lhs: Lens<A, B>, rhs: Lens<B, C>) -> Lens<A, C> {
    return Lens<A, C>(
        get: { a in rhs.get(lhs.get(a)) },
        set: { (c, a) in lhs.set(rhs.set(c, lhs.get(a)), a) }
    )
}

public func .~ <A, B> (lhs: Lens<A, B>, rhs: B) -> (A) -> A {
    return { a in lhs.set(rhs, a) }
}

public func |> <A, B> (x: A, f: (A) -> B) -> B {
    return f(x)
}

public func |> <A, B, C> (f: @escaping (A) -> B, g: @escaping (B) -> C) -> (A) -> C {
    return { g(f($0)) }
}


public extension Weapon {
    enum lens {
        static func name() -> Lens<Weapon, String> {
            .init(
                get: { $0.name },
                set: { name, weapon in
                    Weapon(name: name, damage: weapon.damage, price: weapon.price)
                }
            )
        }
        static func damage() -> Lens<Weapon, Float> {
            .init(
                get: { $0.damage },
                set: { damage, weapon in
                    Weapon(name: weapon.name, damage: damage, price: weapon.price)
                }
            )
        }
        static func price() -> Lens<Weapon, Int> {
            .init(
                get: { $0.price },
                set: { price, weapon in
                    Weapon(name: weapon.name, damage: weapon.damage, price: price)
                }
            )
        }
    }
}
