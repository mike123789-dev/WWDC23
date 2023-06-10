//
//  Symbols.swift
//  WWDC23
//
//  Created by 강병민 on 2023/06/10.
//

import SwiftUI

struct Symbols: View {
    @State var isPaused: Bool = false
    @State var bounceValue: Int = 0
    @State var isConnectingToInternet: Bool = true
    @State var selectedColor: Color = .red

    var body: some View {
        VStack(spacing: 30) {
            GroupBox {
                HStack {
                    Image(systemName: "wifi.router")
                        .symbolEffect(
                            .variableColor.iterative.reversing,
                            isActive: isConnectingToInternet
                        )
                    Toggle("", isOn: $isConnectingToInternet)
                        .labelsHidden()
                }
            }
            .font(.largeTitle)

            
            GroupBox {
                Button {
                    isPaused.toggle()
                } label: {
                    Image(systemName: isPaused ? "pause.fill" : "play.fill")
                        .foregroundStyle(selectedColor)
                        .animation(.easeInOut, value: selectedColor)
                        .contentTransition(.symbolEffect(.replace.offUp))
                }
                ColorSelectionPicker(selectedColor: $selectedColor)
                    .pickerStyle(.segmented)
            }
            .font(.largeTitle)

            GroupBox("Bounce") {
                HStack {
                    Image(systemName: "sparkles")
                        .symbolEffect(
                            .bounce,
                            options: .speed(0.4),
                            value: bounceValue
                        )
                    Image(systemName: "antenna.radiowaves.left.and.right")
                        .symbolEffect(
                            .bounce,
                            options: .repeat(2),
                            value: bounceValue
                        )
                }
                .font(.largeTitle)

                Button("Animate") {
                    bounceValue += 1
                }
            }

        }
    }
}

#Preview {
    NavigationView {
        Symbols()
    }
}

// color selection picker

struct ColorSelectionPicker: View {
    @Binding var selectedColor: Color
    

    var body: some View {
        VStack {
            // picker for red green blue
            Picker("Color", selection: $selectedColor) {
                Text("Red").tag(Color.red)
                Text("Green").tag(Color.green)
                Text("Blue").tag(Color.blue)
            }
        }
    }
}

extension LinearGradient {
    static let rgbGradient = LinearGradient(gradient: Gradient(colors: [.red, .green, .blue]), startPoint: .leading, endPoint: .trailing)
}
