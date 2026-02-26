import XCTest
@testable import DesignSystem

final class DSAlertTests: XCTestCase {

    func test_info_alert_uses_brand_primary_title_color() {
        let alert = DSAlert(variant: .info)
        alert.title = "Info"
        let titleLabel = findLabel(in: alert, withText: "Info")
        XCTAssertEqual(titleLabel?.textColor, DSColors.brandPrimary)
    }

    func test_success_alert_uses_success_title_color() {
        let alert = DSAlert(variant: .success)
        alert.title = "Success"
        let titleLabel = findLabel(in: alert, withText: "Success")
        XCTAssertEqual(titleLabel?.textColor, DSColors.success)
    }

    func test_error_alert_uses_error_title_color() {
        let alert = DSAlert(variant: .error)
        alert.title = "Error"
        let titleLabel = findLabel(in: alert, withText: "Error")
        XCTAssertEqual(titleLabel?.textColor, DSColors.error)
    }

    func test_warning_alert_uses_warning_title_color() {
        let alert = DSAlert(variant: .warning)
        alert.title = "Warning"
        let titleLabel = findLabel(in: alert, withText: "Warning")
        XCTAssertEqual(titleLabel?.textColor, DSColors.warning)
    }

    func test_alert_title_can_be_set() {
        let alert = DSAlert(variant: .info)
        alert.title = "Test Title"
        XCTAssertEqual(alert.title, "Test Title")
    }

    func test_alert_message_can_be_set() {
        let alert = DSAlert(variant: .info)
        alert.message = "Test Message"
        XCTAssertEqual(alert.message, "Test Message")
    }

    func test_alert_corner_radius_is_medium() {
        let alert = DSAlert(variant: .info)
        XCTAssertEqual(alert.layer.cornerRadius, DSBorderRadius.medium)
    }

    // MARK: - Helpers

    private func findLabel(in view: UIView, withText text: String) -> UILabel? {
        for subview in view.subviews {
            if let label = subview as? UILabel, label.text == text {
                return label
            }
            if let found = findLabel(in: subview, withText: text) {
                return found
            }
        }
        return nil
    }
}
