//
//  SettingTest.swift
//  FaceIdTests
//
//  Created by zhou jianbang on 2024/5/13.
//

import XCTest
import ViewInspector
@testable import FaceId
import SwiftUI

extension Setting:Inspectable{}
extension Spacer:Inspectable{}
extension Toggle:Inspectable{}

class SettingTest: XCTestCase {
    
    let openTitle = "open"
    let denyTitle = "denied"
    
    func testSettingValueWhenIsLocked() throws {
        let appSetting = AppSetting.init();
        appSetting.isOpenFaceIdLock = false;
        let sut = Setting(appSetting: appSetting);
        
        let view = try sut.inspect().navigationView().scrollView(0).hStack().find(Spacer.self)
        
        XCTAssertNoThrow(view)
    }
    func testToggleTap()throws {
        let appSetting = AppSetting.init();
        appSetting.isOpenFaceIdLock = false;
        var sut = Setting();
        
        let exp = sut.on(\.didAppear) { view in
            XCTAssertFalse(try view.actualView().isOpenFaceIdLock)
            try view.navigationView().scrollView(0).hStack().find(ViewType.Toggle.self).tap()
            XCTAssertTrue(try view.actualView().isOpenFaceIdLock)
        }
        ViewHosting.host(view: sut)
        wait(for: [exp], timeout: 0.1)
    }
}
