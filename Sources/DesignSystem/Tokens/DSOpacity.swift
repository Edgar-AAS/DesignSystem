import CoreGraphics

public enum DSOpacity {
    /// Fully opaque – 1.0
    public static let full: CGFloat = 1.0
    /// Semi-opaque – 0.8
    public static let high: CGFloat = 0.8
    /// Medium – 0.5
    public static let medium: CGFloat = 0.5
    /// Semi-transparent – 0.3
    public static let low: CGFloat = 0.3
    /// Disabled state – 0.5
    public static let disabled: CGFloat = 0.5
    /// Transparent – 0.0
    public static let transparent: CGFloat = 0.0
}
