import UIKit

public enum DSTypography {

    public enum FontSize: CGFloat {
        case caption    = 12
        case footnote   = 14
        case body       = 16
        case subtitle   = 20
        case title      = 24
        case largeTitle = 32
    }

    public enum FontWeight {
        case regular
        case medium
        case semibold
        case bold

        var uiKitWeight: UIFont.Weight {
            switch self {
            case .regular:  return .regular
            case .medium:   return .medium
            case .semibold: return .semibold
            case .bold:     return .bold
            }
        }
    }

    public static func font(
        size: FontSize,
        weight: FontWeight = .regular,
        scaled: Bool = true
    ) -> UIFont {
        let baseFont = UIFont.systemFont(ofSize: size.rawValue, weight: weight.uiKitWeight)
        guard scaled else { return baseFont }
        let metrics = UIFontMetrics(forTextStyle: textStyle(for: size))
        return metrics.scaledFont(for: baseFont)
    }

    private static func textStyle(for size: FontSize) -> UIFont.TextStyle {
        switch size {
        case .caption:    return .caption1
        case .footnote:   return .footnote
        case .body:       return .body
        case .subtitle:   return .title3
        case .title:      return .title2
        case .largeTitle: return .largeTitle
        }
    }
}
