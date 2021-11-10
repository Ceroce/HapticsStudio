//
//  SecondRulerView.swift
//  HapticsStudio
//
//  Created by Renaud Pradenc on 09/11/2021.
//

import SwiftUI

/// Represent ticks on the ruler for one second
struct SecondRulerView: View {
    let second: Int
    
    var body: some View {
        ZStack {
            GeometryReader { geometry in
                let tickWidth = geometry.size.width/10.0
                TickShape(heightRatio: 1.0)
                    .stroke()
                    .position(x: geometry.size.width/2 + 0.5, y: geometry.size.height/2)
                ForEach(1...9, id: \.self) { index in
                    TickShape(heightRatio: index == 0 ? 1.0 : 0.5)
                        .stroke()
                        .position(x: geometry.size.width/2 + 0.5 + CGFloat(index)*tickWidth, y: geometry.size.height)
                }
            }
            
                
            VStack {
                HStack {
                    Text(String(second))
                        .font(.system(size: 15, weight: .light, design: .default))
                        .padding(2)
                    Spacer()
                }
                Spacer()
            }
        }
    }
}

struct TickShape: Shape {
    let heightRatio: CGFloat
    func path(in rect: CGRect) -> Path {
        let cgPath = CGMutablePath()
        cgPath.move(to: CGPoint(x: rect.minX, y: rect.minY))
        cgPath.addLine(to: CGPoint(x: rect.minX, y: rect.minY + heightRatio * rect.size.height))
        return Path(cgPath)
    }
}

struct SecondRulerView_Previews: PreviewProvider {
    static var previews: some View {
        SecondRulerView(second: 4)
            .previewLayout(.fixed(width: /*@START_MENU_TOKEN@*/100.0/*@END_MENU_TOKEN@*/, height: 50))
        SecondRulerView(second: 22)
            .previewLayout(.fixed(width: 150, height: 50))
            
    }
}
