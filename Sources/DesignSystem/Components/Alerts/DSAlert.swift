import UIKit

public enum DSAlertVariant {
    case success
    case warning
    case error
    case info
}

public final class DSAlert: UIView {

    private let iconImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()

    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = DSTypography.font(size: .footnote, weight: .semibold)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let messageLabel: UILabel = {
        let label = UILabel()
        label.font = DSTypography.font(size: .caption)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let contentStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = DSSpacing.xxxs
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()

    private let variant: DSAlertVariant

    public var title: String? {
        get { titleLabel.text }
        set { titleLabel.text = newValue }
    }

    public var message: String? {
        get { messageLabel.text }
        set {
            messageLabel.text = newValue
            messageLabel.isHidden = (newValue == nil)
        }
    }

    public init(variant: DSAlertVariant = .info) {
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
        layer.cornerRadius = DSBorderRadius.medium
        clipsToBounds = true

        contentStack.addArrangedSubview(titleLabel)
        contentStack.addArrangedSubview(messageLabel)

        addSubview(iconImageView)
        addSubview(contentStack)

        NSLayoutConstraint.activate([
            iconImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: DSSpacing.sm),
            iconImageView.topAnchor.constraint(equalTo: topAnchor, constant: DSSpacing.sm),
            iconImageView.widthAnchor.constraint(equalToConstant: 20),
            iconImageView.heightAnchor.constraint(equalToConstant: 20),

            contentStack.leadingAnchor.constraint(equalTo: iconImageView.trailingAnchor, constant: DSSpacing.xxs),
            contentStack.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -DSSpacing.sm),
            contentStack.topAnchor.constraint(equalTo: topAnchor, constant: DSSpacing.xs),
            contentStack.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -DSSpacing.xs)
        ])

        applyVariantStyle()
    }

    private func applyVariantStyle() {
        switch variant {
        case .success:
            backgroundColor = DSColors.success.withAlphaComponent(0.1)
            titleLabel.textColor = DSColors.success
            messageLabel.textColor = DSColors.success
            iconImageView.tintColor = DSColors.success
            iconImageView.image = UIImage(systemName: "checkmark.circle.fill")
        case .warning:
            backgroundColor = DSColors.warning.withAlphaComponent(0.1)
            titleLabel.textColor = DSColors.warning
            messageLabel.textColor = DSColors.warning
            iconImageView.tintColor = DSColors.warning
            iconImageView.image = UIImage(systemName: "exclamationmark.triangle.fill")
        case .error:
            backgroundColor = DSColors.error.withAlphaComponent(0.1)
            titleLabel.textColor = DSColors.error
            messageLabel.textColor = DSColors.error
            iconImageView.tintColor = DSColors.error
            iconImageView.image = UIImage(systemName: "xmark.circle.fill")
        case .info:
            backgroundColor = DSColors.brandPrimary.withAlphaComponent(0.1)
            titleLabel.textColor = DSColors.brandPrimary
            messageLabel.textColor = DSColors.brandPrimary
            iconImageView.tintColor = DSColors.brandPrimary
            iconImageView.image = UIImage(systemName: "info.circle.fill")
        }
    }
}
