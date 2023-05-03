//
//  Checkmark.swift
//  ToddTalks
//
//  Created by Febrian Daniel on 02/05/23.
//

import SwiftUI

struct Checkmark: View {
    var body: some View {
        HStack{
            Image(systemName: "checkmark.circle.fill")
                .resizable()
                .frame(width: 60, height: 60)
                .foregroundColor(.green)
                .bold()
            Spacer()
            Image(systemName: "x.circle.fill")
                .resizable()
                .frame(width: 60, height: 60)
                .foregroundColor(.red)
                .bold()
        }
        .frame(width: 220)
        .padding(20.0)
    }
}

struct Checkmark_Previews: PreviewProvider {
    static var previews: some View {
        Checkmark()
    }
}
