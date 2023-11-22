//
//  CustomTabView.swift
//  BaeminShoppingBasket
//
//  Created by 조유진 on 2023/11/21.
//

import SwiftUI

public protocol TabTitleConvertible {   // 탭 제목
    var title: String { get }
}

public struct CustomTabView<Selection>: View where Selection: Hashable
& Identifiable & Comparable & TabTitleConvertible {
    public var views: [Selection: AnyView]
    @Binding public var selection: Selection
    @State private var barXOffset: CGFloat = 0
    @State private var barIsActive = false
    
    private var count: Int {
        views.count
    }
    
    public init(
        views: [Selection: AnyView],
        selection: Binding<Selection>
    ) {
        self.views = views
        self._selection = selection
    }
    
    public var body: some View {
        VStack(spacing: 0){
            GeometryReader { geometry in
                let tabSize = geometry.size.width / CGFloat(count)
                VStack(spacing: 0) {
                    HStack(spacing: 0) {
                        ForEach(
                            views.keys.sorted(),
                            content: { key in
                            Button(
                                action: { selection = key },
                                label: {
                                    HStack(spacing: 0) {
                                        Spacer()
                                        
                                        Text(key.title)
                                            .font(.system(size: 18))
                                            .foregroundColor(.black)
                                        
                                        Spacer()
                                    }
                                }
                            )
                            .frame(width: tabSize)
                        }
                    )
                    }
                    .padding(.vertical, 6)
                    .frame(height: 40)
                    
                    ZStack(alignment: .bottom) {
                        Rectangle()
                            .fill(.gray)
                            .frame(height: 0.5)
                        
                        HStack {
                            Rectangle()
                                .fill(Color.black)
                                .frame(width: tabSize, height: 3)
                                .offset(x: barXOffset)
                                .animation(barIsActive ? .linear(duration: 0.25) : .none, value: barXOffset)
                            
                            Spacer()
                        }
                    }
                }
                .onAppear {
                    let selectedIndex = CGFloat((selection.id as? Int ?? 0))
                    barXOffset = selectedIndex * tabSize
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                        barIsActive = true
                    }
                }
                .onChange(of: selection, perform: { newValue in
                    let selectedIndex = CGFloat((newValue.id as? Int ?? 0))
                    barXOffset = selectedIndex * tabSize
                })
            }
            .frame(height: 56)
            
            if let view = views[selection] {
                view
            } else {
                EmptyView()
            }
        }
    }
}

enum Tab: Int, Identifiable, Hashable, Comparable, TabTitleConvertible {
    case one
    case two
    case three
    case four
    
    var title: String {
        switch self {
        case .one: return "배달/포장"
        case .two: return "배민스토어"
        case .three: return "대용량특가"
        case .four: return "전국별미"
        }
    }
    var id: Int {
        rawValue
    }
    
    static func < (lhs: Self, rhs: Self) -> Bool {
        return lhs.rawValue < rhs.rawValue
    }
}
