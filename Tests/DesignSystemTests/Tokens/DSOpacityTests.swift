import XCTest
@testable import DesignSystem

final class DSOpacityTests: XCTestCase {

    func test_opacity_values_are_in_valid_range() {
        let opacities: [CGFloat] = [
            DSOpacity.full, DSOpacity.high, DSOpacity.medium,
            DSOpacity.low, DSOpacity.disabled, DSOpacity.transparent
        ]
        for opacity in opacities {
            XCTAssertGreaterThanOrEqual(opacity, 0.0, "Opacity \(opacity) is below 0")
            XCTAssertLessThanOrEqual(opacity, 1.0, "Opacity \(opacity) is above 1")
        }
    }

    func test_full_opacity_is_one() {
        XCTAssertEqual(DSOpacity.full, 1.0)
    }

    func test_transparent_opacity_is_zero() {
        XCTAssertEqual(DSOpacity.transparent, 0.0)
    }

    func test_disabled_opacity_equals_medium() {
        XCTAssertEqual(DSOpacity.disabled, DSOpacity.medium)
    }
}
