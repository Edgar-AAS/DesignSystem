import XCTest
@testable import DesignSystem

final class DSSpacingTests: XCTestCase {

    func test_spacing_values_follow_4pt_grid() {
        let spacings: [CGFloat] = [
            DSSpacing.xxxs, DSSpacing.xxs, DSSpacing.xs,
            DSSpacing.sm, DSSpacing.md, DSSpacing.lg,
            DSSpacing.xl, DSSpacing.xxl
        ]
        for spacing in spacings {
            XCTAssertEqual(
                spacing.truncatingRemainder(dividingBy: 4), 0,
                "Spacing \(spacing) is not a multiple of 4"
            )
        }
    }

    func test_spacing_values_are_in_ascending_order() {
        XCTAssertTrue(DSSpacing.xxxs < DSSpacing.xxs)
        XCTAssertTrue(DSSpacing.xxs < DSSpacing.xs)
        XCTAssertTrue(DSSpacing.xs < DSSpacing.sm)
        XCTAssertTrue(DSSpacing.sm < DSSpacing.md)
        XCTAssertTrue(DSSpacing.md < DSSpacing.lg)
        XCTAssertTrue(DSSpacing.lg < DSSpacing.xl)
        XCTAssertTrue(DSSpacing.xl < DSSpacing.xxl)
    }
}
