//
//  SwiftUIView.swift
//  MinimalTodo
//
//  Created by Marcello Gonzatto Birkan on 10/04/24.
//

import SwiftUI
import SwiftData

struct TaskRow: View {
  let title: String
  let summary: String?
  let hour: Date
  let color: Color
  var expandida = false
  var isCompleted = false
  
    var body: some View {
      ZStack {
        RoundedRectangle(cornerRadius: 18)
          .foregroundStyle(color.opacity(0.4))
        
        VStack {
          HStack(alignment: expandida ? .top : .center) {
            Rectangle()
              .clipShape(UnevenRoundedRectangle(cornerRadii: RectangleCornerRadii(topLeading: 18, bottomLeading: 18, bottomTrailing: 0, topTrailing: 0)))
              .foregroundStyle(color.opacity(0.9))
              .frame(width: 18)
            
            Image(systemName: isCompleted ? "checkmark.circle" : "circle.fill")
              .foregroundStyle(.white)
              .font(.title)
              .animation(.easeOut, value: isCompleted)
              .overlay {
                if !isCompleted {
                  Circle()
                    .stroke(lineWidth: 2)
                }
              }
              .padding(.top, expandida ? 20 : 0)
              
            VStack(alignment: .leading, spacing: 20) {
                Text(title)
              
              if summary != nil && expandida {
                Text(summary!)
                  .padding(.leading)
              }
                
            }
            .padding(.top, expandida ? 25 : 0)
            
            Spacer()
            
            VStack(spacing: 10) {
              Text("\(hour.formatted(.dateTime.hour().minute()))")
              
              Image(systemName: expandida ? "chevron.down" : "chevron.forward")
                .foregroundStyle(.secondary)
                .fontWeight(.semibold)
                .padding(.leading)
            }
            .padding(.top, expandida ? 20 : 0)
            .padding(.trailing)
          }
        }
      }
      .frame(width: 382, height: expandida ? 198 : 71)
    }
}

#Preview {
  TaskRow(title: "Tomar banho", summary: "dsadasdasd", hour: Date(), color: .accent)
}
