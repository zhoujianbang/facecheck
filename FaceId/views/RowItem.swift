//
//  RowItem.swift
//  FaceId
//
//  Created by zhou jianbang on 2024/5/9.
//

import SwiftUI

struct RowItem: View {
    var isOpenFaceIdLock:Bool
    
    var openedTitle = NSLocalizedString("opened", comment: "opened face")
    var deniedTitle = NSLocalizedString("denied", comment: "denied face")
    
    var body: some View {
        HStack {
            Text("😃")
                .font(.system(size: 16))
            Text("FaceID \(isOpenFaceIdLock ? openedTitle : deniedTitle)")
                .font(.body)
                .fontWeight(.medium)
                .foregroundColor(isOpenFaceIdLock ? .green : .gray)
            Image(systemName: "chevron.right")
                .foregroundColor(.gray)
                .font(.system(size: 14))
        }
    }
}

struct RowItem_Previews: PreviewProvider {
    static var previews: some View {
        RowItem(isOpenFaceIdLock: true)
    }
}
