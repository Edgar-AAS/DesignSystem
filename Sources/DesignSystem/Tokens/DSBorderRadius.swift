import CoreGraphics

public enum DSBorderRadius {
    /// 4pt
    public static let small: CGFloat = 4
    /// 8pt
    public static let medium: CGFloat = 8
    /// 16pt
    public static let large: CGFloat = 16

    public static func circular(for size: CGFloat) -> CGFloat {
        size / 2
    }
}
