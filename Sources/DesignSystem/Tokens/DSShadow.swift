import UIKit

public enum DSShadow {

    public struct ShadowStyle {
        public let color: UIColor
        public let opacity: Float
        public let offset: CGSize
        public let radius: CGFloat

        public init(color: UIColor, opacity: Float, offset: CGSize, radius: CGFloat) {
            self.color = color
            self.opacity = opacity
            self.offset = offset
            self.radius = radius
        }
    }

    /// Subtle shadow for cards and containers
    public static let small = ShadowStyle(
        color: .black,
        opacity: 0.08,
        offset: CGSize(width: 0, height: 2),
        radius: 4
    )

    /// Medium shadow for elevated components
    public static let medium = ShadowStyle(
        color: .black,
        opacity: 0.12,
        offset: CGSize(width: 0, height: 4),
        radius: 8
    )

    /// Strong shadow for modals and overlays
    public static let large = ShadowStyle(
        color: .black,
        opacity: 0.16,
        offset: CGSize(width: 0, height: 8),
        radius: 16
    )

    public static func apply(_ style: ShadowStyle, to layer: CALayer) {
        layer.shadowColor = style.color.cgColor
        layer.shadowOpacity = style.opacity
        layer.shadowOffset = style.offset
        layer.shadowRadius = style.radius
        layer.masksToBounds = false
    }
}
