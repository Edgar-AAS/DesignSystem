import XCTest
@testable import DesignSystem

final class DSCardTests: XCTestCase {

    func test_card_background_is_background_primary() {
        let card = DSCard()
        XCTAssertEqual(card.backgroundColor, DSColors.backgroundPrimary)
    }

    func test_card_corner_radius_is_large() {
        let card = DSCard()
        XCTAssertEqual(card.layer.cornerRadius, DSBorderRadius.large)
    }

    func test_card_has_border() {
        let card = DSCard()
        XCTAssertEqual(card.layer.borderWidth, 1)
    }

    func test_card_has_shadow() {
        let card = DSCard()
        XCTAssertFalse(card.layer.masksToBounds)
        XCTAssertGreaterThan(card.layer.shadowOpacity, 0)
    }

    func test_card_disables_autoresizing_mask() {
        let card = DSCard()
        XCTAssertFalse(card.translatesAutoresizingMaskIntoConstraints)
    }
}
