//
//  AppSetting.swift
//  FaceId
//
//  Created by zhou jianbang on 2024/5/8.
//

import Foundation

class AppSetting: ObservableObject  {
    
    @Published var isOpenFaceIdLock: Bool = UserDefaults.standard.bool(forKey: "isOpenFaceIdLock") {
        didSet {
            UserDefaults.standard.set(self.isOpenFaceIdLock, forKey: "isOpenFaceIdLock")
        }
    }
}
