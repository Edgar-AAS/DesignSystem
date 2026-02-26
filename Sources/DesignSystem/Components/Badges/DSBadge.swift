import UIKit

public enum DSBadgeVariant {
    case success
    case warning
    case error
    case info
}

public final class DSBadge: UIView {

    private let label: UILabel = {
        let label = UILabel()
        label.font = DSTypography.font(size: .caption, weight: .medium)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let variant: DSBadgeVariant

    public var text: String? {
        get { label.text }
        set { label.text = newValue }
    }

    public init(variant: DSBadgeVariant = .info) {
        self.variant = variant
        super.init(frame: .zero)
        setupView()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented. Use init(variant:) instead.")
    }

    private func setupView() {
        translatesAutoresizingMaskIntoConstraints = false
        layer.cornerRadius = DSBorderRadius.small
        clipsToBounds = true

        addSubview(label)

        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: topAnchor, constant: DSSpacing.xxxs),
            label.leadingAnchor.constraint(equalTo: leadingAnchor, constant: DSSpacing.xxs),
            label.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -DSSpacing.xxs),
            label.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -DSSpacing.xxxs)
        ])

        applyVariantStyle()
    }

    private func applyVariantStyle() {
        switch variant {
        case .success:
            backgroundColor = DSColors.success.withAlphaComponent(0.15)
            label.textColor = DSColors.success
        case .warning:
            backgroundColor = DSColors.warning.withAlphaComponent(0.15)
            label.textColor = DSColors.warning
        case .error:
            backgroundColor = DSColors.error.withAlphaComponent(0.15)
            label.textColor = DSColors.error
        case .info:
            backgroundColor = DSColors.brandPrimary.withAlphaComponent(0.15)
            label.textColor = DSColors.brandPrimary
        }
    }
}
