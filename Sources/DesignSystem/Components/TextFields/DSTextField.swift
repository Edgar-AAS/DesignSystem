import UIKit

public final class DSTextField: UIView {

    public let textField: UITextField = {
        let tf = UITextField()
        tf.font = DSTypography.font(size: .body)
        tf.textColor = DSColors.textPrimary
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()

    private let errorLabel: UILabel = {
        let label = UILabel()
        label.font = DSTypography.font(size: .caption)
        label.textColor = DSColors.error
        label.numberOfLines = 0
        label.alpha = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let containerView: UIView = {
        let view = UIView()
        view.backgroundColor = DSColors.backgroundSecondary
        view.layer.cornerRadius = DSBorderRadius.medium
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.clear.cgColor
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    public var placeholder: String? {
        didSet {
            textField.attributedPlaceholder = NSAttributedString(
                string: placeholder ?? "",
                attributes: [
                    .foregroundColor: DSColors.textSecondary,
                    .font: DSTypography.font(size: .body)
                ]
            )
        }
    }

    public var errorMessage: String? {
        didSet { updateErrorState() }
    }

    public var text: String? {
        get { textField.text }
        set { textField.text = newValue }
    }

    public override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented.")
    }

    private func setupView() {
        addSubview(containerView)
        containerView.addSubview(textField)
        addSubview(errorLabel)

        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: topAnchor),
            containerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: trailingAnchor),

            textField.topAnchor.constraint(equalTo: containerView.topAnchor, constant: DSSpacing.xs),
            textField.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: DSSpacing.sm),
            textField.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -DSSpacing.sm),
            textField.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -DSSpacing.xs),

            errorLabel.topAnchor.constraint(equalTo: containerView.bottomAnchor, constant: DSSpacing.xxxs),
            errorLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: DSSpacing.xxxs),
            errorLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            errorLabel.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }

    private func updateErrorState() {
        let hasError = errorMessage != nil
        errorLabel.text = errorMessage

        UIView.animate(withDuration: 0.2) {
            self.errorLabel.alpha = hasError ? 1 : 0
            self.containerView.layer.borderColor = hasError
                ? DSColors.error.cgColor
                : UIColor.clear.cgColor
        }
    }

    public override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        if errorMessage != nil {
            containerView.layer.borderColor = DSColors.error.cgColor
        }
    }
}
