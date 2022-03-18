# MovingApp

The main change here is using a `Set<String>` for `MovingJob.items` instead of a `[String: Bool]`. There are a few other changes, but I think (hioe?) I've commented them well enough to be pretty explanatory.

(**NOTE:** [SE-0320](https://github.com/apple/swift-evolution/blob/main/proposals/0320-codingkeyrepresentable.md) may be of use here if you wanted to keep `items` as a dictionary. It allows enums to be used as dictionary keys for `Codable` purposes, as long as the enum conforms to `CodingKeyRepresentable`. This conformance has a default implementation in the case of `String` and `Int`.)