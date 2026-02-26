import UIKit

public final class DSCard: UIView {

    private let contentStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = DSSpacing.xs
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()

    public init(padding: CGFloat = DSSpacing.sm) {
        super.init(frame: .zero)
        setupView(padding: padding)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented. Use init(padding:) instead.")
    }

    private func setupView(padding: CGFloat) {
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = DSColors.backgroundPrimary
        layer.cornerRadius = DSBorderRadius.large
        layer.borderWidth = 1
        layer.borderColor = DSColors.border.cgColor

        addSubview(contentStackView)

        NSLayoutConstraint.activate([
            contentStackView.topAnchor.constraint(equalTo: topAnchor, constant: padding),
            contentStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: padding),
            contentStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -padding),
            contentStackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -padding)
        ])

        DSShadow.apply(.small, to: layer)
    }

    public func addArrangedSubview(_ view: UIView) {
        contentStackView.addArrangedSubview(view)
    }

    public override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        layer.borderColor = DSColors.border.cgColor
    }
}
