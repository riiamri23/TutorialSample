//
//  LandmarkDetail.swift
//  TutorialSample
//
//  Created by rii amri on 20/11/23.
//

import SwiftUI

struct LandmarkDetail: View {
    
    var landmark: Landmark
    
    var body: some View {
        VStack{
            MapView(coordinate: landmark.locationCoordinate)
                .frame(height: 300)


            CircleImage(image: landmark.image)
                .offset(y: -130)
                .padding(.bottom, -130)
            VStack {
                


                VStack(alignment: .leading) {
                    Text(landmark.name)
                        .font(.title)


                    HStack {
                        Text(landmark.park)
                        Spacer()
                        Text(landmark.state)
                    }
                    .font(.subheadline)
                    .foregroundStyle(.secondary)


                    Divider()


                    Text("About \(landmark.name)")
                        .font(.title2)
                    Text(landmark.description)
                }
                .padding()


                Spacer()
            }
        }
        
    }
}


#Preview {
    LandmarkDetail(landmark: landmarks[0])
}
