//
//  RowItemTest.swift
//  FaceIdTests
//
//  Created by zhou jianbang on 2024/5/13.
//

import XCTest
import ViewInspector
@testable import FaceId

extension RowItem:Inspectable{}

class RowItemTest: XCTestCase {

    let openTitle = "open"
    let denyTitle = "denied"
    
    func testRowItemValueWhenIsLocked() throws {
        let sut = RowItem(isOpenFaceIdLock: true, openedTitle: openTitle, deniedTitle: denyTitle);
        let value = try sut.inspect().hStack().text(1).string()
        XCTAssertEqual(value, "FaceID \(openTitle)");
    }
    
    func testRowItemValueWhenIsUnLocked() throws {
        let sut = RowItem(isOpenFaceIdLock: false, openedTitle: openTitle, deniedTitle: denyTitle);
        let value = try sut.inspect().hStack().text(1).string()
        XCTAssertEqual(value, "FaceID \(denyTitle)");
    }
}
