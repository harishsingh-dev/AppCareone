//
//  CHECKBOC.swift
//  AppCare
//
//  Created by Harish Kumar Singh on 04/11/25.
//

import SwiftUI

struct SquareCheckBox: View {
    @Binding var isChecked: Bool
    
    var body: some View {
        Button(action: {
            withAnimation(.easeInOut(duration: 0.15)) {
                isChecked.toggle()
            }
        }) {
            ZStack {
                // Background color changes when checked
                RoundedRectangle(cornerRadius: 4)
                    .fill(isChecked ? Color.headingColor : Color.white)
                    .frame(width: 13, height: 13)
                    .overlay(
                        RoundedRectangle(cornerRadius: 0)
                            .stroke(Color.black, lineWidth: 1.5)
                    )
                
                if isChecked {
                    Image(systemName: "checkmark")
                        .resizable()
                        .scaledToFit()
                        .foregroundColor(.white)
                        .frame(width: 12, height: 12)
                        //.transition(.scale.combined(with: .opacity))
                }
                
            }
        }
        .buttonStyle(.plain) // removes blue highlight
    }
}

struct ContentView: View {
    @State private var isChecked = false
    
    var body: some View {
        VStack(spacing: 20) {
            SquareCheckBox(isChecked: $isChecked)
            
           
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
