//
//  FaceIdLockTest.swift
//  FaceIdTests
//
//  Created by zhou jianbang on 2024/5/13.
//

import XCTest
import ViewInspector
@testable import FaceId
import SwiftUI

extension Button:Inspectable{}
extension FaceIdLock:Inspectable{}

class FaceIdLockTest: XCTestCase {

    func testDefaultCheckStatus() throws {
        let sut = FaceIdLock();
        
        let status = try sut.inspect().zStack().vStack(1).text(1).string();
        
        XCTAssertEqual(status, "")
    }
    
    func testButtonTap() throws {
        let sut = FaceIdLock();
        
        let button = try sut.inspect().zStack().vStack(1).button(0)
        try button.tap()
        
        let status = try sut.inspect().zStack().vStack(1).text(1).string();
        XCTAssertEqual(status, "")
    }
}
