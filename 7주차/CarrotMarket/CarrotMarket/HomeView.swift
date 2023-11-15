//
//  ContentView.swift
//  CarrotMarket
//
//  Created by 조유진 on 2023/11/11.
//

import SwiftUI

struct HomeView: View {
    @StateObject private var postListViewModel = PostListViewModel()
    var body: some View {
        ZStack {
            VStack {
                CustomNavigationBar()
                Spacer()
                PostListView(postListViewModel: postListViewModel)
            }
            newProductBtnView()
                .padding(.trailing, 20)
                .padding(.bottom, 20)
        }
        
        
    }
}

// MARK: - 네비게이션 바
private struct CustomNavigationBar: View {
    fileprivate var body: some View {
        HStack {
            HStack {
                Text("광명동")
                    .bold()
                Image("ic_arrow_down")
            }
            Spacer()
            HStack {
                Image("ic_menu")
                Image("ic_search")
                Image("ic_bell")
            }
        }
        .padding()
    }
}

// MARK: - 포스트 리스트 뷰
private struct PostListView: View {
    @ObservedObject private var postListViewModel: PostListViewModel
    private var showPost2Index = 3
    private var currentIndex = 0
    fileprivate init(postListViewModel: PostListViewModel) {
        self.postListViewModel = postListViewModel
    }
    
    fileprivate var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .leading) {
                
                ForEach(postListViewModel.posts, id: \.self) { post in
                    PostView(postListViewModel: postListViewModel, post: post)      
                }
            }
            
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHGrid(rows: [GridItem()]) {
                    ForEach(postListViewModel.posts2, id: \.self) { post2 in
                        Post2View(postListViewModel: postListViewModel, post2: post2)
                    }
                }
                .padding(.horizontal, 10)
            }
            
        }
    }
}

// MARK: - 포스트뷰
private struct PostView: View {
    @ObservedObject private var postListViewModel: PostListViewModel
    private var post: Post
    
    fileprivate init(postListViewModel: PostListViewModel, post: Post) {
        self.postListViewModel = postListViewModel
        self.post = post
    }
    
    fileprivate var body: some View {
        VStack {
            HStack(alignment: .top) {
                Image(post.imageString)
                    .resizable()
                    .frame(width: 115, height: 115)
                    .scaledToFill()
             
                
                
                VStack(alignment: .leading, spacing: 4) {
                    Text(post.title)
                        .font(.system(size: 16))
                        .frame(width: UIScreen.main.bounds.width - 124 - 40, alignment: .leading)
                        .lineLimit(2)
                        

                    Text(post.location)
                        .font(.system(size: 14))
                        .foregroundColor(.gray)
                    
                    Spacer()
                        .frame(height: 4)

                    if post.price != nil {
                        Text(post.price ?? "")
                            .font(.system(size: 16))
                            .fontWeight(.bold)
                    }
                    
                }
            }
            .padding(10)
        
            Rectangle()
                .foregroundColor(.liteGray)
                .frame(height: 1)
        }
        .padding(.horizontal, 15)
        .frame(width: UIScreen.main.bounds.width)
        
    
    }
}

private struct Post2View: View {
    @ObservedObject private var postListViewModel: PostListViewModel
    private var post2: Post2
    
    fileprivate init(postListViewModel: PostListViewModel, post2: Post2) {
        self.postListViewModel = postListViewModel
        self.post2 = post2
    }
    
    fileprivate var body: some View {
        VStack(alignment: .leading) {
            Image(post2.imageString)
                .resizable()
                .frame(width: 110, height: 110)
                .scaledToFill()
            
            Text(post2.title)
                .font(.system(size: 16))
                .lineLimit(2)
                

            Text(post2.price)
                .font(.system(size: 14))
                .bold()
        }
        .frame(width: 100)
        .padding(5)
    }
}

private struct newProductBtnView : View {
    fileprivate var body: some View {
        VStack {
            Spacer()
            HStack {
                Spacer()
                RoundedRectangle(cornerRadius: 30)
                    .fill(.orange)
                    .frame(width: 100, height: 44)
                    .overlay(Text("+ 글쓰기")
                        .font(.system(size: 16, weight: .bold))
                        .foregroundColor(.white)
                    )
                }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
