//
//  FaceIdLock.swift
//  FaceId
//
//  Created by zhou jianbang on 2024/5/8.
//

import SwiftUI
import LocalAuthentication

struct FaceIdLock: View {
    
    @State private var isGoOpenAuth = false
    @State private var fackCheckStatus = "";
    
    var body: some View {
        ZStack {
            Color("mainBg").ignoresSafeArea()
            VStack {
                Button {
                    authenticate()
                } label: {
                    VStack{
                        Image(systemName: "faceid")
                          .foregroundColor(Color.blue)
                          .font(.system(size: 54))
                          .padding()
                        Text(NSLocalizedString("openFace", comment: "check face"))
                          .foregroundColor(.blue)

                    }
                }
                
                Text(fackCheckStatus)
                    .offset(y: 40)
                    .font(.title)
                    .foregroundColor(.indigo)
            }
            .ignoresSafeArea(edges: .top)
            .navigationTitle("Face Login")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
    
    func authenticate() {
        let context = LAContext()
        var error: NSError?
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            let reason = ""
            context.evaluatePolicy(.deviceOwnerAuthentication, localizedReason: "") { success, authenticationError in
                DispatchQueue.main.async {
                    if success {
                        self.fackCheckStatus = "Face ID check successfully"
                    } else {
                        self.fackCheckStatus = "Face ID check failed"
                    }
                }
            }
        } else {
            self.fackCheckStatus = "Face error \(String(describing: error?.code) )"
        }
    }
}

struct FaceIdLock_Previews: PreviewProvider {
    static var previews: some View {
        FaceIdLock()
    }
}
