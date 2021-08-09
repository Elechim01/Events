//
//  EventCardView.swift
//  EventCardView
//
//  Created by Michele Manniello on 09/08/21.
//

import SwiftUI


struct EventCardView: View {
    var event : Event
    @Binding var pinchValue : CGFloat
    var body: some View {
        HStack(spacing: 20){
//            converting space as new line...
            Text(getDate())
                .font(.title2)
                .fontWeight(.semibold)
                .foregroundColor(.gray)
                .multilineTextAlignment(.center)
                .padding()
            HStack(spacing: 15){
                Capsule()
                    .fill(event.color)
                    .frame(width: 2)
                VStack(alignment: .leading, spacing: 0) {
                    VStack(alignment: .leading, spacing: 10) {
                        Text(event.title)
                            .font(.title2.bold())
                            .lineLimit(1)
                        Text(event.timing)
                            .foregroundColor(.secondary)
                            .lineLimit(1)
                    }
    //                settings everthing with default height for easy calculation...
                    .frame(height:100)
                    VStack(alignment: .leading, spacing: 10){
//                        first three task...
                        Text(".meet iJustine")
                            .lineLimit(1)
                        Text(".Video iJustine")
                            .lineLimit(1)
                        Text(".Play iJustine")
                            .lineLimit(1)
//                        Images..
                        HStack(spacing: 10){
                            ForEach(1...3,id:\.self) { index in
                                    Image("p\(index)")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 35, height: 35)
                                    .clipShape(Circle())
                                    .offset(x: -getImageOffset())
                            }
                        }
                        .padding(.top)
                        .padding(.leading,20)
                    }
//                    remining 180...
                    .padding(.top)
                    .frame(height: getMaxCardSize(),alignment: .top)
                    .opacity(getOpacity())
                }
                Spacer(minLength: 0)
            }
            .padding()
//            settings height as 100
//            max height will be 280...
//            remaing 180 will be calclated from pinch value...
            .frame(height: 100 + getMaxCardSize())
            .background(.white,in: RoundedRectangle(cornerRadius: 10))
            .clipped()
            .shadow(color: .black.opacity(0.05), radius: 5, x: 5, y: 5)
        }
    }
    func getDate() -> String{
        return event.date.replacingOccurrences(of: " ", with: "\n")
    }
//    image offset anmation...
    func getImageOffset() -> CGFloat {
        let progess = getMaxCardSize() / 180
        return progess * 20
    }
//    getting card size..
    func getMaxCardSize() -> CGFloat{
//        multiplyng each pinch with 40...
        let pinchHeight = pinchValue * 40
        return pinchHeight
    }
// opacity
    func getOpacity() -> CGFloat {
        let progress = getMaxCardSize() / 180
        return progress
    }
    
}

struct EventCardView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
