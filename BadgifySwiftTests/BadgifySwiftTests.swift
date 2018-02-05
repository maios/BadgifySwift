//
//  BadgifySwiftTests.swift
//  BadgifySwiftTests
//
//  Created by Mai Mai on 2/5/18.
//  Copyright © 2018 maimaios. All rights reserved.
//

import XCTest
@testable import BadgifySwift

class BadgifySwiftTests: XCTestCase {
    
    func testInit() {
        let badgeView = BadgeView()
        XCTAssertNotNil(badgeView)
        XCTAssertEqual(badgeView.badgeValue, 0)
        XCTAssertNil(badgeView.badgeImage)
        XCTAssertNotNil(badgeView.badgeFont)
        XCTAssertNotNil(badgeView.textColor)
        XCTAssertEqual(badgeView.xOffset, 0)
        XCTAssertEqual(badgeView.yOffset, 0)
    }

    func testSetBadgeValue() {
        let badgeView = BadgeView()
        badgeView.badgeValue = 1
        XCTAssertEqual(badgeView.badgeValue, 1)
        XCTAssertFalse(badgeView.isHidden)
        XCTAssertNil(badgeView.badgeImage)
    }

    func testSetBadgeValueCaseZero() {
        let badgeView = BadgeView()
        badgeView.badgeValue = 0
        XCTAssertEqual(badgeView.badgeValue, 0)
        XCTAssertTrue(badgeView.isHidden)
    }

    func testSetBadgeValueCaseNegative() {
        let badgeView = BadgeView()
        badgeView.badgeValue = -1
        XCTAssertEqual(badgeView.badgeValue, -1)
        XCTAssertTrue(badgeView.isHidden)
    }

    func testSetBadgeImage() {
        let badgeView = BadgeView()
        let image = UIImage()
        badgeView.badgeImage = image
        XCTAssertEqual(badgeView.badgeImage, image)
        XCTAssertEqual(badgeView.badgeValue, 0)
        XCTAssertFalse(badgeView.isHidden)
    }

    func testSetBadgeImageCaseNil() {
        let badgeView = BadgeView()
        badgeView.badgeImage = nil
        XCTAssertNil(badgeView.badgeImage)
        XCTAssertTrue(badgeView.isHidden)
    }

    func testIncrement() {
        let badgeView = BadgeView()
        let currentValue = badgeView.badgeValue
        badgeView.increment()
        XCTAssertEqual(badgeView.badgeValue, currentValue + 1)
    }

    func testIncrementCaseFromNegative() {
        let badgeView = BadgeView()
        badgeView.badgeValue = -10
        badgeView.increment()
        XCTAssertEqual(badgeView.badgeValue, 1)
    }

    func testDecrement() {
        let badgeView = BadgeView()
        badgeView.badgeValue = 2
        let currentValue = badgeView.badgeValue
        badgeView.decrement()
        XCTAssertEqual(badgeView.badgeValue, currentValue - 1)
    }

    func testDecrementCaseToNegative() {
        let badgeView = BadgeView()
        badgeView.badgeValue = -10
        badgeView.decrement()
        XCTAssertEqual(badgeView.badgeValue, 0)
    }
}
