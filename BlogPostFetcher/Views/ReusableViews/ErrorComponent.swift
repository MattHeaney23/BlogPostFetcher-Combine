//
//  ErrorLoadingView.swift
//  AtomicMediaDeveloper
//
//  Created by Matt on 31/05/2023.
//

import SwiftUI

struct ErrorComponent: View {
    
    let error: Error
    
    var body: some View {
        VStack(spacing: 8) {
            
            Text("There was an error (\(error.localizedDescription)). Please try again")
                .font(.footnote)
            
        }.frame(maxWidth: .infinity,
                maxHeight: .infinity, alignment: .bottom)
    }
}

struct ErrorComponent_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ForEach(["iPhone SE", "iPhone 14 Pro"], id: \.self) { device in
                ErrorComponent(error: NetworkError.InvalidURL)
                    .previewDevice(PreviewDevice(rawValue: device))
                    .previewInterfaceOrientation(.portrait)
                
                ErrorComponent(error: NetworkError.InvalidURL)
                    .previewDevice(PreviewDevice(rawValue: device))
                    .previewInterfaceOrientation(.landscapeRight)
            }
        }
    }
}
