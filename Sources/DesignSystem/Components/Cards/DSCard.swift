import UIKit

public final class DSCard: UIView {

    private let containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private let elevation: DSShadow.Elevation

    public init(
        elevation: DSShadow.Elevation = .low,
        cornerRadius: CGFloat = DSBorderRadius.medium
    ) {
        self.elevation = elevation
        super.init(frame: .zero)
        setupView(cornerRadius: cornerRadius)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented. Use init(elevation:cornerRadius:) instead.")
    }

    public func addContent(_ view: UIView, padding: CGFloat = DSSpacing.sm) {
        view.translatesAutoresizingMaskIntoConstraints = false
        containerView.addSubview(view)
        NSLayoutConstraint.activate([
            view.topAnchor.constraint(equalTo: containerView.topAnchor, constant: padding),
            view.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: padding),
            view.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -padding),
            view.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -padding)
        ])
    }

    private func setupView(cornerRadius: CGFloat) {
        containerView.backgroundColor = DSColors.surface
        containerView.layer.cornerRadius = cornerRadius
        containerView.clipsToBounds = true

        addSubview(containerView)
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: topAnchor),
            containerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: trailingAnchor),
            containerView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])

        layer.cornerRadius = cornerRadius
        DSShadow.apply(elevation, to: layer)
    }

    public override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        DSShadow.apply(elevation, to: layer)
    }
}
