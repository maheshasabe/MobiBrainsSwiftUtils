
import UIKit

extension Dictionary {
    
    // Returns a random element inside Dictionary
    public func random() -> Value {
        let index: Int = Int(arc4random_uniform(UInt32(self.count)))
        return Array(self.values)[index]
    }

    // Union of self and the input dictionaries.
    public func union(_ dictionaries: Dictionary...) -> Dictionary {
        var result = self
        dictionaries.forEach { (dictionary) -> Void in
            dictionary.forEach { (key, value) -> Void in
                _ = result.updateValue(value, forKey: key)
            }
        }
        return result
    }

    // Checks if a key exists in the dictionary.
    public func has(_ key: Key) -> Bool {
        return index(forKey: key) != nil
    }

    // Creates an Array with values generated by running
    /// each [key: value] of self through the mapFunction.
    public func toArray<V>(_ map: (Key, Value) -> V) -> [V] {
        var mapped: [V] = []
        forEach {
            mapped.append(map($0, $1))
        }
        return mapped
    }

    // Creates a Dictionary with the same keys as self and values generated by running
    /// each [key: value] of self through the mapFunction.
    public func mapValues<V>(_ map: (Key, Value) -> V) -> [Key: V] {
        var mapped: [Key: V] = [:]
        forEach {
            mapped[$0] = map($0, $1)
        }
        return mapped
    }

    // Creates a Dictionary with the same keys as self and values generated by running
    /// each [key: value] of self through the mapFunction discarding nil return values.
    public func mapFilterValues<V>(_ map: (Key, Value) -> V?) -> [Key: V] {
        var mapped: [Key: V] = [:]
        forEach {
            if let value = map($0, $1) {
                mapped[$0] = value
            }
        }
        return mapped
    }

    // Creates a Dictionary with keys and values generated by running
    /// each [key: value] of self through the mapFunction discarding nil return values.
    public func mapFilter<K, V>(_ map: (Key, Value) -> (K, V)?) -> [K: V] {
        var mapped: [K: V] = [:]
        forEach {
            if let value = map($0, $1) {
                mapped[value.0] = value.1
            }
        }
        return mapped
    }

    // Creates a Dictionary with keys and values generated by running
    /// each [key: value] of self through the mapFunction.
    public func map<K, V>(_ map: (Key, Value) -> (K, V)) -> [K: V] {
        var mapped: [K: V] = [:]
        forEach {
            let (_key, _value) = map($0, $1)
            mapped[_key] = _value
        }
        return mapped
    }

    // Constructs a dictionary containing every [key: value] pair from self
    /// for which testFunction evaluates to true.
    public func filter(_ test: (Key, Value) -> Bool) -> Dictionary {
        var result = Dictionary()
        for (key, value) in self {
            if test(key, value) {
                result[key] = value
            }
        }
        return result
    }

    // Checks if test evaluates true for all the elements in self.
    public func testAll(_ test: (Key, Value) -> (Bool)) -> Bool {
        for (key, value) in self {
            if !test(key, value) {
                return false
            }
        }
        return true
    }
}

extension Dictionary where Value: Equatable {
    // Difference of self and the input dictionaries.
    /// Two dictionaries are considered equal if they contain the same [key: value] pairs.
    public func difference(_ dictionaries: [Key: Value]...) -> [Key: Value] {
        var result = self
        for dictionary in dictionaries {
            for (key, value) in dictionary {
                if result.has(key) && result[key] == value {
                    result.removeValue(forKey: key)
                }
            }
        }
        return result
    }
}

// Combines the first dictionary with the second and returns single dictionary
public func += <KeyType, ValueType> (left: inout Dictionary<KeyType, ValueType>, right: Dictionary<KeyType, ValueType>) {
    for (k, v) in right {
        left.updateValue(v, forKey: k)
    }
}

// Difference operator
public func - <K, V: Equatable> (first: [K: V], second: [K: V]) -> [K: V] {
    return first.difference(second)
}



