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
/*
 1. Create a PrimaryButtonStyle struct the conforms to ButtonStyle
 2. Add makeBody(configuration:) method that returns some View. The configuration methor parameter is of type Configuration.
 3. One of these properties is the button's label. By calling configuration.label, you're explicityly saying you want modifiers to style the button's label.
 */
struct PrimaryButtonStyle: ButtonStyle {
  func makeBody(configuration: Configuration) -> some View {
    configuration.label
      .font(.title2)
      .padding(.horizontal, 30)
      .padding(.vertical, 8)
      .foregroundColor(
        configuration.isPressed
        ? Color.mint.opacity(0.2)
        : Color.pink
      )
      .overlay(
        RoundedRectangle(cornerRadius: 8)
          .stroke(
            configuration.isPressed
            ? Color.mint.opacity(0.2)
            : Color.pink,
            lineWidth: 1.5
          )
      )
    
  }
}

// Email Validate View Modifier
/*
 1. Create a Validate ViewModifier with two stored properties. value is of type String and it'll hold an email address that the user enters in the text field. validator is a closure that takes a String and returns a Boolean
 2. Add required body(context:) method that returns some View to conform to the ViewModifier protocol.
 3. Validate the value and apply a green border on the content if validator is true.
 */
struct Validate: ViewModifier {
  var value: String
  var validator: (String) -> Bool
  
  func body(content: Content) -> some View {
    content
      .border(validator(value) ? .green : .secondary)
  }
}

// TextField extension
extension TextField {
  func validateEmail(
    value: String,
    validator: @escaping (String) -> (Bool)
  ) -> some View {
    modifier(Validate(value: value, validator: validator))
  }
}

// Image extension
/*
 1. Create an Image extension with a single method, photoStyle(), that returns some View. photoStyle() takes two parameters, maxWidth and maxHeight. These parameters can differ across views, so you add default value to .infinity
 2. self refers to the specific view for which you are creating the extension. In this case, Image. When creating view extensions, self comes in handy.
 */
extension Image {
  func photoStyle(
    withMaxWidth maxWidth: CGFloat = .infinity,
    withMaxHeight maxHeight: CGFloat = 300
  ) -> some View {
    self
      .resizable()
      .scaledToFill()
      .frame(maxWidth: maxWidth, maxHeight: maxHeight)
      .clipped()
  }
}

// CHALLENGE SOLUTION
// View extension
// TODO: Challenge
