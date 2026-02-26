import UIKit

public enum DSAvatarSize {
    case small
    case medium
    case large

    var dimension: CGFloat {
        switch self {
        case .small:  return 32
        case .medium: return 48
        case .large:  return 72
        }
    }

    var fontSize: DSTypography.FontSize {
        switch self {
        case .small:  return .caption
        case .medium: return .body
        case .large:  return .title
        }
    }
}

public final class DSAvatar: UIView {

    private let imageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()

    private let initialsLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let size: DSAvatarSize

    public var image: UIImage? {
        didSet {
            imageView.image = image
            imageView.isHidden = (image == nil)
            initialsLabel.isHidden = (image != nil)
        }
    }

    public var initials: String? {
        didSet {
            initialsLabel.text = initials
        }
    }

    public init(size: DSAvatarSize = .medium) {
        self.size = size
        super.init(frame: .zero)
        setupView()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented. Use init(size:) instead.")
    }

    private func setupView() {
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = DSColors.brandSecondary
        layer.cornerRadius = DSBorderRadius.circular(for: size.dimension)
        clipsToBounds = true

        initialsLabel.font = DSTypography.font(size: size.fontSize, weight: .semibold, scaled: false)

        addSubview(imageView)
        addSubview(initialsLabel)

        NSLayoutConstraint.activate([
            widthAnchor.constraint(equalToConstant: size.dimension),
            heightAnchor.constraint(equalToConstant: size.dimension),

            imageView.topAnchor.constraint(equalTo: topAnchor),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: bottomAnchor),

            initialsLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            initialsLabel.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])

        imageView.isHidden = true
    }
}
