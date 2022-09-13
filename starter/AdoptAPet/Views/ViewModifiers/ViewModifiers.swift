/// Copyright (c) 2022 Razeware LLC
/// 
/// Permission is hereby granted, free of charge, to any person obtaining a copy
/// of this software and associated documentation files (the "Software"), to deal
/// in the Software without restriction, including without limitation the rights
/// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
/// copies of the Software, and to permit persons to whom the Software is
/// furnished to do so, subject to the following conditions:
/// 
/// The above copyright notice and this permission notice shall be included in
/// all copies or substantial portions of the Software.
/// 
/// Notwithstanding the foregoing, you may not use, copy, modify, merge, publish,
/// distribute, sublicense, create a derivative work, and/or sell copies of the
/// Software in any work that is designed, intended, or marketed for pedagogical or
/// instructional purposes related to programming, coding, application development,
/// or information technology.  Permission for such use, copying, modification,
/// merger, publication, distribution, sublicensing, creation of derivative works,
/// or sale is expressly withheld.
/// 
/// This project and source code may use libraries or frameworks that are
/// released under various Open-Source licenses. Use of those libraries and
/// frameworks are governed by their own individual licenses.
///
/// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
/// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
/// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
/// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
/// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
/// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
/// THE SOFTWARE.

import SwiftUI

// Title ViewModifier
/*
 1. create a struct called DetailedInfoTitleModifier that conforms to the ViewModifier protocol.
 2. Add the body(context:) method that returns some View. The content parameter is the viwe on which you apply the modifiers
 3. Add the modifiers
 */
struct DetailedInfoTitleModifier: ViewModifier {
  func body(content: Content) -> some View {
    content
      .lineLimit(1)
      .font(.title2)
      .bold()
  }
}

// Text extension
extension Text {
  func detailedInfoTitle() -> some View {
    modifier(DetailedInfoTitleModifier())
  }
  
  func buttonLabel() -> some View {
    modifier(ButtonLabelModifier())
  }
}

// Button Label Modifier
struct ButtonLabelModifier: ViewModifier {
  func body(content: Content) -> some View {
    content
      .font(.title2)
      .padding(.horizontal, 30)
      .padding(.vertical, 8)
      .foregroundColor(Color.pink)
      .overlay(
        RoundedRectangle(cornerRadius: 8)
          .stroke(Color.pink, lineWidth: 1.5)
      )
  }
}

// Button Style
// TODO: 4

// Email Validate View Modifier
// TODO: 5

// TextField extension
// TODO: 6

// Image extension
// TODO: 7

// CHALLENGE SOLUTION
// View extension
// TODO: Challenge
