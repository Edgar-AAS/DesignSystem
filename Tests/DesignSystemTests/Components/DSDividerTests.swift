import XCTest
@testable import DesignSystem

final class DSDividerTests: XCTestCase {

    func test_horizontal_divider_uses_divider_color() {
        let divider = DSDivider(orientation: .horizontal)
        XCTAssertEqual(divider.backgroundColor, DSColors.divider)
    }

    func test_vertical_divider_uses_divider_color() {
        let divider = DSDivider(orientation: .vertical)
        XCTAssertEqual(divider.backgroundColor, DSColors.divider)
    }

    func test_custom_color_is_applied() {
        let divider = DSDivider(color: DSColors.border)
        XCTAssertEqual(divider.backgroundColor, DSColors.border)
    }

    func test_divider_disables_autoresizing_mask() {
        let divider = DSDivider()
        XCTAssertFalse(divider.translatesAutoresizingMaskIntoConstraints)
    }
}
