import XCTest
@testable import DesignSystem

final class DSAvatarTests: XCTestCase {

    func test_small_avatar_dimension() {
        let avatar = DSAvatar(size: .small)
        avatar.layoutIfNeeded()
        let widthConstraint = avatar.constraints.first {
            $0.firstAttribute == .width && $0.constant == 32
        }
        XCTAssertNotNil(widthConstraint)
    }

    func test_medium_avatar_dimension() {
        let avatar = DSAvatar(size: .medium)
        avatar.layoutIfNeeded()
        let widthConstraint = avatar.constraints.first {
            $0.firstAttribute == .width && $0.constant == 48
        }
        XCTAssertNotNil(widthConstraint)
    }

    func test_large_avatar_dimension() {
        let avatar = DSAvatar(size: .large)
        avatar.layoutIfNeeded()
        let widthConstraint = avatar.constraints.first {
            $0.firstAttribute == .width && $0.constant == 72
        }
        XCTAssertNotNil(widthConstraint)
    }

    func test_avatar_is_circular() {
        let size = DSAvatarSize.medium
        let avatar = DSAvatar(size: .medium)
        XCTAssertEqual(avatar.layer.cornerRadius, size.dimension / 2)
    }

    func test_avatar_initials_can_be_set() {
        let avatar = DSAvatar(size: .medium)
        avatar.initials = "AB"
        XCTAssertEqual(avatar.initials, "AB")
    }
}
