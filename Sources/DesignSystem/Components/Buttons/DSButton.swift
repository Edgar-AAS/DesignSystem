import UIKit

public enum DSButtonVariant {
    case primary
    case secondary
    case destructive
    case ghost
}

public enum DSButtonSize {
    case small
    case medium
    case large

    var verticalPadding: CGFloat {
        switch self {
        case .small:  return DSSpacing.xxs
        case .medium: return DSSpacing.xs
        case .large:  return DSSpacing.sm
        }
    }

    var horizontalPadding: CGFloat {
        return DSSpacing.sm
    }

    var fontSize: DSTypography.FontSize {
        switch self {
        case .small:  return .caption
        case .medium: return .body
        case .large:  return .subtitle
        }
    }
}

public final class DSButton: UIButton {

    private let variant: DSButtonVariant
    private let size: DSButtonSize
    private let loadingIndicator = UIActivityIndicatorView(style: .medium)
    private var originalTitle: String?

    public var isLoading: Bool = false {
        didSet { updateLoadingState() }
    }

    public init(variant: DSButtonVariant = .primary, size: DSButtonSize = .medium) {
        self.variant = variant
        self.size = size
        super.init(frame: .zero)
        setupButton()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented. Use init(variant:size:) instead.")
    }

    private func setupButton() {
        titleLabel?.font = DSTypography.font(size: size.fontSize, weight: .medium)
        layer.cornerRadius = DSBorderRadius.medium
        clipsToBounds = true

        var config = UIButton.Configuration.plain()
        config.contentInsets = NSDirectionalEdgeInsets(
            top: size.verticalPadding,
            leading: size.horizontalPadding,
            bottom: size.verticalPadding,
            trailing: size.horizontalPadding
        )
        configuration = config

        loadingIndicator.hidesWhenStopped = true
        loadingIndicator.translatesAutoresizingMaskIntoConstraints = false
        addSubview(loadingIndicator)

        NSLayoutConstraint.activate([
            loadingIndicator.centerXAnchor.constraint(equalTo: centerXAnchor),
            loadingIndicator.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])

        applyVariantStyle()
    }

    private func applyVariantStyle() {
        switch variant {
        case .primary:
            backgroundColor = DSColors.brandPrimary
            setTitleColor(.white, for: .normal)
            loadingIndicator.color = .white
        case .secondary:
            backgroundColor = .clear
            setTitleColor(DSColors.brandPrimary, for: .normal)
            layer.borderWidth = 1
            layer.borderColor = DSColors.brandPrimary.cgColor
            loadingIndicator.color = DSColors.brandPrimary
        case .destructive:
            backgroundColor = DSColors.error
            setTitleColor(.white, for: .normal)
            loadingIndicator.color = .white
        case .ghost:
            backgroundColor = .clear
            setTitleColor(DSColors.brandPrimary, for: .normal)
            loadingIndicator.color = DSColors.brandPrimary
        }
        setTitleColor(DSColors.textSecondary, for: .disabled)
    }

    private func updateLoadingState() {
        isEnabled = !isLoading
        if isLoading {
            originalTitle = title(for: .normal)
            setTitle(nil, for: .normal)
            loadingIndicator.startAnimating()
            alpha = 0.8
        } else {
            setTitle(originalTitle, for: .normal)
            loadingIndicator.stopAnimating()
            alpha = 1.0
        }
    }

    public override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        if variant == .secondary {
            layer.borderColor = DSColors.brandPrimary.cgColor
        }
    }

    public override var isHighlighted: Bool {
        didSet {
            UIView.animate(withDuration: 0.15) {
                self.alpha = self.isHighlighted ? 0.7 : (self.isLoading ? 0.8 : 1.0)
                self.transform = self.isHighlighted
                    ? CGAffineTransform(scaleX: 0.97, y: 0.97)
                    : .identity
            }
        }
    }
}
