//
//  BookYourExports.swift
//  AppCare
//
//  Created by Harish Kumar Singh on 11/11/25.
//




import SwiftUI

struct BookYourExports: View {
    var body: some View {
        GeometryReader { geometry in
            let scaleFactor: CGFloat = ConstantClass.shared.isIpad()
            ? geometry.size.width / 600.0
            : 1.0
            
            VStack(alignment:.leading){
                Text("Book Your Expert")
                    .font(.custom("Inter-SemiBold", size: 20.57 * scaleFactor))
                    .foregroundColor(Color(hex: "#000080"))
                    .offset(x: 20 * scaleFactor, y: 10 * scaleFactor)

                Text("Connect with certified experts across multiple\ncategories. Book 1:1 sessions or video consultations instantly.")
                    .font(.custom("Inter-Medium", size: 12 * scaleFactor))
                    .foregroundColor(Color(hex: "#1B2544"))
                    .offset(x: 20 * scaleFactor,y: 20 * scaleFactor)
                
                HStack {
                    VStack(){
                        
                        HStack {
                            ZStack(){
                                Circle()
                                    .fill(Color(hex: "#DADAFE"))
                                    .frame(width: 41 * scaleFactor, height: 41 * scaleFactor)
                                
                                Image("tabler_calendar")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 27.38 * scaleFactor, height: 27.38 * scaleFactor)
                            }
                            Text("Session Booking")
                            
                        }
                       // .offset(x: -30 * scaleFactor,y: -15 * scaleFactor)
                        
                        HStack {
                            ZStack(){
                                Circle()
                                    .fill(Color(hex: "#DADAFE"))
                                    .frame(width: 41 * scaleFactor, height: 41 * scaleFactor)
                                
                                Image("mdi_video-outline")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 27.38 * scaleFactor, height: 27.38 * scaleFactor)
                            }
                            Text("Session Booking")
                        }
                        //.offset(x: -30 * scaleFactor,y: -15 * scaleFactor)
                        
                        HStack {
                            ZStack(){
                                Circle()
                                    .fill(Color(hex: "#DADAFE"))
                                    .frame(width: 41 * scaleFactor, height: 41 * scaleFactor)
                                
                                Image("grommet-icons_user-expert")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 27.38 * scaleFactor, height: 27.38 * scaleFactor)
                            }
                            Text("Variety of Experts")
                        }
                        //.offset(x: -30 * scaleFactor,y: -15 * scaleFactor)
                        
                        
                        
                    }
                    .offset(x: 20 * scaleFactor,y: 10 * scaleFactor)

                   // Spacer()
                    Image("image 23")
                                             .resizable()
                                             .scaledToFit()
                                             .frame(maxWidth: 130 * scaleFactor,minHeight: 170 * scaleFactor)
                                             .offset(x: 20 * scaleFactor,y: 25 * scaleFactor)
                                        
                    
                    
                    
                    
                }
                
                
                Text("Explore Expert")
                    .font(.custom("Inter-Medium", size: 12 * scaleFactor))
                    .foregroundColor(.white) // text color white for contrast
                    .multilineTextAlignment(.center)
                    .frame(width: 326.03 * scaleFactor, height: 42.17 * scaleFactor)
                    .background(Color(hex: "#000080"))
                    .cornerRadius(10.28 * scaleFactor)
                    .frame(maxWidth: .infinity, alignment: .center) // center align in parent
                    .opacity(1)


                
                
                }

            .frame(width: 349 * scaleFactor,height: 325 * scaleFactor)
            .background(Color(hex: "#F3F3FF"))
            .cornerRadius(10) // Add this line
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color(hex: "#F3F3FF"), lineWidth: 1)
            )

            .padding(.horizontal, 30 * scaleFactor)
            .padding(.top, 20 * scaleFactor)

            .frame(width: geometry.size.width, height: 326 * scaleFactor)
            }
             .frame(maxWidth: .infinity)
        // ✅ outer frame fix (finite height)
                .frame(height: 326 * (ConstantClass.shared.isIpad()
                                      ? UIScreen.main.bounds.width / 600.0
                                      : 1.0))
        }
    }


#Preview {
    BookYourExports()
}

