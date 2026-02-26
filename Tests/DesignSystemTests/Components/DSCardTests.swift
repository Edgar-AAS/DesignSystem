import XCTest
@testable import DesignSystem

final class DSCardTests: XCTestCase {

    func test_card_default_elevation_is_low() {
        let card = DSCard()
        XCTAssertEqual(card.layer.shadowOpacity, DSShadow.Elevation.low.opacity)
        XCTAssertEqual(card.layer.shadowRadius, DSShadow.Elevation.low.radius)
    }

    func test_card_with_high_elevation() {
        let card = DSCard(elevation: .high)
        XCTAssertEqual(card.layer.shadowOpacity, DSShadow.Elevation.high.opacity)
        XCTAssertEqual(card.layer.shadowRadius, DSShadow.Elevation.high.radius)
    }

    func test_card_default_corner_radius() {
        let card = DSCard()
        XCTAssertEqual(card.layer.cornerRadius, DSBorderRadius.medium)
    }

    func test_card_custom_corner_radius() {
        let card = DSCard(cornerRadius: DSBorderRadius.large)
        XCTAssertEqual(card.layer.cornerRadius, DSBorderRadius.large)
    }

    func test_card_add_content_adds_subview() {
        let card = DSCard()
        let content = UIView()
        card.addContent(content)
        XCTAssertTrue(content.superview != nil)
    }
}
