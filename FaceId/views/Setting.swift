//
//  Setting.swift
//  FaceId
//
//  Created by zhou jianbang on 2024/5/8.
//

import SwiftUI
import LocalAuthentication

struct Setting: View {
        
    @StateObject var appSetting = AppSetting()
    @State private var isOpenFaceIdLock = false
    @State private var isActive = false

    var body: some View {
        NavigationView {
            ScrollView {
                HStack{
                    
                    if self.isOpenFaceIdLock {
                        NavigationLink {
                            FaceIdLock()
                        } label: {
                            RowItem(isOpenFaceIdLock: isOpenFaceIdLock)
                        }
                    }else {
                        HStack{
                            RowItem(isOpenFaceIdLock: isOpenFaceIdLock)
                        }
                    }
                    Spacer()
                    Toggle("", isOn: $isOpenFaceIdLock)
                        .onChange(of: isOpenFaceIdLock) { newValue in
                            appSetting.isOpenFaceIdLock = newValue
                        }
                }
                .padding()
                .background(.white)
            }
            .background(.cyan)
            .navigationTitle("Face ID")
            .navigationViewStyle(.stack)
        }
        .environmentObject(appSetting)
        .onAppear {
            print(UserDefaults.standard.bool(forKey: "isOpenFaceIdLock"))
            self.isOpenFaceIdLock = UserDefaults.standard.bool(forKey: "isOpenFaceIdLock");
        }
    }
}

struct Setting_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(["iPhone 13 Pro"], id: \.self) { deviceName in
                Setting()
                    .previewDevice(PreviewDevice(rawValue: deviceName))
                    .previewDisplayName(deviceName)
        }
    }
}
