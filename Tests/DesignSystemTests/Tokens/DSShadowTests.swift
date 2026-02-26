import XCTest
@testable import DesignSystem

final class DSShadowTests: XCTestCase {

    func test_small_shadow_has_lower_opacity_than_medium() {
        XCTAssertLessThan(DSShadow.small.opacity, DSShadow.medium.opacity)
    }

    func test_medium_shadow_has_lower_opacity_than_large() {
        XCTAssertLessThan(DSShadow.medium.opacity, DSShadow.large.opacity)
    }

    func test_shadow_radii_are_in_ascending_order() {
        XCTAssertLessThan(DSShadow.small.radius, DSShadow.medium.radius)
        XCTAssertLessThan(DSShadow.medium.radius, DSShadow.large.radius)
    }

    func test_small_shadow_offset() {
        XCTAssertEqual(DSShadow.small.offset, CGSize(width: 0, height: 2))
    }

    func test_medium_shadow_offset() {
        XCTAssertEqual(DSShadow.medium.offset, CGSize(width: 0, height: 4))
    }

    func test_large_shadow_offset() {
        XCTAssertEqual(DSShadow.large.offset, CGSize(width: 0, height: 8))
    }
}
