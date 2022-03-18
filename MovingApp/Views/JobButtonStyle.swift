//
//  JobButtonStyle.swift
//  MovingApp
//
//  Created by Patrick Wynne on 3/17/22.
//

import SwiftUI

//a custom ButtonStyle just because I was feeling fancy today
struct JobButtonStyle: ButtonStyle {
    let backgroundColor: Color
    
    init(color: Color) {
        backgroundColor = color
    }
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .foregroundColor(.white)
            .background(backgroundColor, in: RoundedRectangle(cornerRadius: 10))
    }
}

//a type-constrained extension to the ButtonStyle protocol
//so we can use e.g., .buttonStyle(.jobButtonStyle(color: .green)) instead of
//having to do it like .buttonStyle(JobButton(color: .green)
//it's just nicer that way
extension ButtonStyle where Self == JobButtonStyle {
    static func jobButton(color: Color) -> Self {
        Self(color: color)
    }
}
