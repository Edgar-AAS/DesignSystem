import UIKit

public enum DSShadow {

    public enum Elevation {
        case none
        case low
        case medium
        case high

        public var offset: CGSize {
            switch self {
            case .none:   return .zero
            case .low:    return CGSize(width: 0, height: 2)
            case .medium: return CGSize(width: 0, height: 4)
            case .high:   return CGSize(width: 0, height: 8)
            }
        }

        public var radius: CGFloat {
            switch self {
            case .none:   return 0
            case .low:    return 4
            case .medium: return 8
            case .high:   return 16
            }
        }

        public var opacity: Float {
            switch self {
            case .none:   return 0
            case .low:    return 0.08
            case .medium: return 0.12
            case .high:   return 0.16
            }
        }
    }

    public static func apply(
        _ elevation: Elevation,
        to layer: CALayer,
        color: UIColor = .black
    ) {
        layer.shadowColor = color.cgColor
        layer.shadowOffset = elevation.offset
        layer.shadowRadius = elevation.radius
        layer.shadowOpacity = elevation.opacity
    }
}
