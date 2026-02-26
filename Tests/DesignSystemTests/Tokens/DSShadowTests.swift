import XCTest
@testable import DesignSystem

final class DSShadowTests: XCTestCase {

    func test_elevation_none_has_zero_opacity() {
        let elevation = DSShadow.Elevation.none
        XCTAssertEqual(elevation.opacity, 0)
        XCTAssertEqual(elevation.radius, 0)
        XCTAssertEqual(elevation.offset, .zero)
    }

    func test_elevation_low_values() {
        let elevation = DSShadow.Elevation.low
        XCTAssertEqual(elevation.offset, CGSize(width: 0, height: 2))
        XCTAssertEqual(elevation.radius, 4)
        XCTAssertEqual(elevation.opacity, 0.08)
    }

    func test_elevation_medium_values() {
        let elevation = DSShadow.Elevation.medium
        XCTAssertEqual(elevation.offset, CGSize(width: 0, height: 4))
        XCTAssertEqual(elevation.radius, 8)
        XCTAssertEqual(elevation.opacity, 0.12)
    }

    func test_elevation_high_values() {
        let elevation = DSShadow.Elevation.high
        XCTAssertEqual(elevation.offset, CGSize(width: 0, height: 8))
        XCTAssertEqual(elevation.radius, 16)
        XCTAssertEqual(elevation.opacity, 0.16)
    }

    func test_apply_shadow_sets_layer_properties() {
        let layer = CALayer()
        DSShadow.apply(.medium, to: layer)
        XCTAssertEqual(layer.shadowOffset, CGSize(width: 0, height: 4))
        XCTAssertEqual(layer.shadowRadius, 8)
        XCTAssertEqual(layer.shadowOpacity, 0.12)
    }

    func test_elevation_opacity_increases_with_level() {
        XCTAssertTrue(DSShadow.Elevation.none.opacity < DSShadow.Elevation.low.opacity)
        XCTAssertTrue(DSShadow.Elevation.low.opacity < DSShadow.Elevation.medium.opacity)
        XCTAssertTrue(DSShadow.Elevation.medium.opacity < DSShadow.Elevation.high.opacity)
    }

    func test_elevation_radius_increases_with_level() {
        XCTAssertTrue(DSShadow.Elevation.none.radius < DSShadow.Elevation.low.radius)
        XCTAssertTrue(DSShadow.Elevation.low.radius < DSShadow.Elevation.medium.radius)
        XCTAssertTrue(DSShadow.Elevation.medium.radius < DSShadow.Elevation.high.radius)
    }
}
