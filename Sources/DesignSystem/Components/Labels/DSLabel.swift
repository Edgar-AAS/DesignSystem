import UIKit

public final class DSLabel: UILabel {

    public init(
        fontSize: DSTypography.FontSize = .body,
        fontWeight: DSTypography.FontWeight = .regular,
        color: UIColor = DSColors.textPrimary,
        alignment: NSTextAlignment = .left
    ) {
        super.init(frame: .zero)
        self.font = DSTypography.font(size: fontSize, weight: fontWeight)
        self.textColor = color
        self.textAlignment = alignment
        self.numberOfLines = 0
        self.adjustsFontForContentSizeCategory = true
        self.translatesAutoresizingMaskIntoConstraints = false
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented. Use init(fontSize:fontWeight:color:alignment:) instead.")
    }
}
