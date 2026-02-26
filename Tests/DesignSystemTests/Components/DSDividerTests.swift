import XCTest
@testable import DesignSystem

final class DSDividerTests: XCTestCase {

    func test_horizontal_divider_has_height_constraint() {
        let divider = DSDivider(orientation: .horizontal)
        let heightConstraints = divider.constraints.filter { constraint in
            constraint.firstAttribute == .height
        }
        XCTAssertFalse(heightConstraints.isEmpty)
        XCTAssertEqual(heightConstraints.first?.constant, 1)
    }

    func test_vertical_divider_has_width_constraint() {
        let divider = DSDivider(orientation: .vertical)
        let widthConstraints = divider.constraints.filter { constraint in
            constraint.firstAttribute == .width
        }
        XCTAssertFalse(widthConstraints.isEmpty)
        XCTAssertEqual(widthConstraints.first?.constant, 1)
    }

    func test_divider_default_color_is_divider_color() {
        let divider = DSDivider()
        XCTAssertEqual(divider.backgroundColor, DSColors.divider)
    }

    func test_divider_custom_thickness() {
        let divider = DSDivider(orientation: .horizontal, thickness: 2)
        let heightConstraints = divider.constraints.filter { constraint in
            constraint.firstAttribute == .height
        }
        XCTAssertEqual(heightConstraints.first?.constant, 2)
    }

    func test_divider_translates_autoresizing_mask() {
        let divider = DSDivider()
        XCTAssertFalse(divider.translatesAutoresizingMaskIntoConstraints)
    }
}
