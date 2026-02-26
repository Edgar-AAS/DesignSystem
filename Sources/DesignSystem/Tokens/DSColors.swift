import UIKit

public enum DSColors {

    // MARK: - Brand
    public static let brandPrimary = color(named: "BrandPrimary")
    public static let brandSecondary = color(named: "BrandSecondary")
    public static let accent = color(named: "Accent")

    // MARK: - Background
    public static let backgroundPrimary = color(named: "BackgroundPrimary")
    public static let backgroundSecondary = color(named: "BackgroundSecondary")

    // MARK: - Surface
    public static let surface = color(named: "Surface")

    // MARK: - Text
    public static let textPrimary = color(named: "TextPrimary")
    public static let textSecondary = color(named: "TextSecondary")

    // MARK: - Semantic / Feedback
    public static let success = color(named: "Success")
    public static let error = color(named: "Error")
    public static let warning = color(named: "Warning")

    // MARK: - Border & Divider
    public static let border = color(named: "Border")
    public static let divider = color(named: "Divider")

    // MARK: - Private Helper
    private static func color(named name: String) -> UIColor {
        guard let color = UIColor(named: name, in: .module, compatibleWith: nil) else {
            assertionFailure("⚠️ DSColors: Color '\(name)' not found in Assets. Check Colors.xcassets.")
            return .systemPink
        }
        return color
    }
}
