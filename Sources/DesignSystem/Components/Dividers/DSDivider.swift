import UIKit

public final class DSDivider: UIView {

    public enum Orientation {
        case horizontal
        case vertical
    }

    private let orientation: Orientation
    private let thickness: CGFloat

    public init(
        orientation: Orientation = .horizontal,
        color: UIColor = DSColors.divider,
        thickness: CGFloat = 1
    ) {
        self.orientation = orientation
        self.thickness = thickness
        super.init(frame: .zero)
        self.backgroundColor = color
        translatesAutoresizingMaskIntoConstraints = false
        setupConstraints()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented. Use init(orientation:color:thickness:) instead.")
    }

    private func setupConstraints() {
        switch orientation {
        case .horizontal:
            heightAnchor.constraint(equalToConstant: thickness).isActive = true
        case .vertical:
            widthAnchor.constraint(equalToConstant: thickness).isActive = true
        }
    }
}
