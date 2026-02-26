import XCTest
@testable import DesignSystem

final class DSBadgeTests: XCTestCase {

    func test_badge_primary_variant_has_brand_primary_text_color() {
        let badge = DSBadge(variant: .primary)
        badge.text = "Test"
        let label = badge.subviews.compactMap { $0 as? UILabel }.first
        XCTAssertEqual(label?.textColor, DSColors.brandPrimary)
    }

    func test_badge_success_variant_has_success_text_color() {
        let badge = DSBadge(variant: .success)
        let label = badge.subviews.compactMap { $0 as? UILabel }.first
        XCTAssertEqual(label?.textColor, DSColors.success)
    }

    func test_badge_error_variant_has_error_text_color() {
        let badge = DSBadge(variant: .error)
        let label = badge.subviews.compactMap { $0 as? UILabel }.first
        XCTAssertEqual(label?.textColor, DSColors.error)
    }

    func test_badge_warning_variant_has_warning_text_color() {
        let badge = DSBadge(variant: .warning)
        let label = badge.subviews.compactMap { $0 as? UILabel }.first
        XCTAssertEqual(label?.textColor, DSColors.warning)
    }

    func test_badge_text_property_updates_label() {
        let badge = DSBadge(variant: .primary)
        badge.text = "New"
        let label = badge.subviews.compactMap { $0 as? UILabel }.first
        XCTAssertEqual(label?.text, "New")
    }

    func test_badge_corner_radius() {
        let badge = DSBadge(variant: .primary)
        XCTAssertEqual(badge.layer.cornerRadius, DSBorderRadius.small)
    }

    func test_badge_clips_to_bounds() {
        let badge = DSBadge(variant: .primary)
        XCTAssertTrue(badge.clipsToBounds)
    }
}
