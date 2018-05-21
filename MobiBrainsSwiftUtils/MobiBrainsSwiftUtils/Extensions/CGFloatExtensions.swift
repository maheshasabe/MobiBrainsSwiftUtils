

import UIKit

extension CGFloat {

    public func toRadians() -> CGFloat {
        return (CGFloat (Double.pi) * self) / 180.0
    }

    public func degreesToRadians() -> CGFloat {
        return toRadians()
    }

    public mutating func toRadiansInPlace() {
        self = (CGFloat (Double.pi) * self) / 180.0
    }

    public func degreesToRadians (_ angle: CGFloat) -> CGFloat {
        return (CGFloat (Double.pi) * angle) / 180.0
    }
}
