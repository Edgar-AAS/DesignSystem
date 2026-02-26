import XCTest
@testable import DesignSystem

final class DSBadgeTests: XCTestCase {

    func test_info_badge_uses_brand_primary_text_color() {
        let badge = DSBadge(variant: .info)
        let label = badge.subviews.compactMap { $0 as? UILabel }.first
        XCTAssertEqual(label?.textColor, DSColors.brandPrimary)
    }

    func test_success_badge_uses_success_text_color() {
        let badge = DSBadge(variant: .success)
        let label = badge.subviews.compactMap { $0 as? UILabel }.first
        XCTAssertEqual(label?.textColor, DSColors.success)
    }

    func test_error_badge_uses_error_text_color() {
        let badge = DSBadge(variant: .error)
        let label = badge.subviews.compactMap { $0 as? UILabel }.first
        XCTAssertEqual(label?.textColor, DSColors.error)
    }

    func test_warning_badge_uses_warning_text_color() {
        let badge = DSBadge(variant: .warning)
        let label = badge.subviews.compactMap { $0 as? UILabel }.first
        XCTAssertEqual(label?.textColor, DSColors.warning)
    }

    func test_badge_text_can_be_set() {
        let badge = DSBadge(variant: .info)
        badge.text = "New"
        XCTAssertEqual(badge.text, "New")
    }

    func test_badge_corner_radius_is_small() {
        let badge = DSBadge(variant: .info)
        XCTAssertEqual(badge.layer.cornerRadius, DSBorderRadius.small)
    }
}
