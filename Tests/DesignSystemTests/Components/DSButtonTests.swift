import XCTest
@testable import DesignSystem

final class DSButtonTests: XCTestCase {

    func test_primary_button_has_correct_background_color() {
        let button = DSButton(variant: .primary, size: .medium)
        XCTAssertEqual(button.backgroundColor, DSColors.brandPrimary)
    }

    func test_secondary_button_has_border() {
        let button = DSButton(variant: .secondary, size: .medium)
        XCTAssertEqual(button.layer.borderWidth, 1)
    }

    func test_destructive_button_has_error_background() {
        let button = DSButton(variant: .destructive, size: .medium)
        XCTAssertEqual(button.backgroundColor, DSColors.error)
    }

    func test_ghost_button_has_clear_background() {
        let button = DSButton(variant: .ghost, size: .medium)
        XCTAssertEqual(button.backgroundColor, .clear)
    }

    func test_loading_state_disables_button() {
        let button = DSButton(variant: .primary)
        button.setTitle("Test", for: .normal)
        button.isLoading = true
        XCTAssertFalse(button.isEnabled)
        XCTAssertNil(button.title(for: .normal))
    }

    func test_loading_state_restored_after_stop() {
        let button = DSButton(variant: .primary)
        button.setTitle("Test", for: .normal)
        button.isLoading = true
        button.isLoading = false
        XCTAssertTrue(button.isEnabled)
        XCTAssertEqual(button.title(for: .normal), "Test")
    }
}
