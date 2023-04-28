//
//  StageCircle.swift
//  ToddTalks
//
//  Created by Fernando Putra on 25/04/23.
//

import SwiftUI

struct StageCircle: View {
    let stage: Stage

    var body: some View {
        Button("", action: {})
            .frame(width: 50, height: 50)
            .foregroundColor(.white)
            .buttonStyle(RaisedButtonStyle())
    }
}

struct StageCircle_Previews: PreviewProvider {
    static var previews: some View {
        StageCircle(stage: Stage(name: "jaja"))
    }
}
