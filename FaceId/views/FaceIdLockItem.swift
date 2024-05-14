//
//  FaceIdLockItem.swift
//  FaceId
//
//  Created by zhou jianbang on 2024/5/14.
//

import SwiftUI

struct FaceIdLockItem: View {
    var body: some View {
        VStack{
            Image(systemName: "faceid")
                          .foregroundColor(Color.blue)
                          .font(.system(size: 54))
                          .padding()
            Text(NSLocalizedString("openFace", comment: "check face"))
              .foregroundColor(.blue)

        }    }
}

struct FaceIdLockItem_Previews: PreviewProvider {
    static var previews: some View {
        FaceIdLockItem()
    }
}
