//
//  main.swift
//  Assignment01-b
//
//  Created by Ethan Roberts on 1/27/21.
//
//  cite:  https://gist.github.com/denissimon/7f1b61be76246bacf38d4326233c9460
//  this link was used to find a Swift XOR function I could use

import Foundation

typealias OTPKey = [ UInt8 ]
typealias OTPKeyPair = ( key1: OTPKey , key2: OTPKey )


let myKey: String? = readLine()
print (myKey!)

var dummyKey = randomOTPKey(length: myKey!.count)
//let origin: OTPKeyPair = (dummyKey, [])

let encryptedText = xorEncryption(clearText: "thisisatest")
print(dummyKey)
print(encryptedText)


var test = xorEncryption(clearText: "Hello!")
print(test)


func randomOTPKey ( length: Int ) -> OTPKey {
    var randomKey: OTPKey = OTPKey ()
    print(length)
    for _ in 0 ... length-1 {
        let randomKeyPoint = UInt8 ( arc4random_uniform ( UInt32 ( UInt8.max ) ))
        randomKey.append ( randomKeyPoint )
    }
    return randomKey
}


//CITE:  https://gist.github.com/denissimon/7f1b61be76246bacf38d4326233c9460
func xorEncryption(clearText: String) -> [UInt8] {
    if clearText.isEmpty { return [UInt8]() }
    
    var encrypted = [UInt8]()
    let text = [UInt8](clearText.utf8)
    let key = [UInt8](myKey!.utf8)
    let length = key.count
    
    // encrypt bytes
    for t in text.enumerated() {
        encrypted.append(t.element ^ key[t.offset % length])
    }
    
    return encrypted
}


