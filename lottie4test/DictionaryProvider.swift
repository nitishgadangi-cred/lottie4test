//
//  DictionaryProvider.swift
//  lottie4test
//
//  Created by Nitish Gadangi on 06/01/23.
//

import Foundation
import Lottie

final class DictionaryImageProvider: AnimationImageProvider {
    let dict: [String: UIImage]
    init(dict: [String: UIImage]) {
        self.dict = dict
    }

    func imageForAsset(asset: ImageAsset) -> CGImage? {
        guard let image = dict[asset.directory] else { return nil }
        return image.cgImage
    }
}

public final class DictionaryTextProvider: AnimationTextProvider {

    public init(_ values: [String: String]) {
        self.values = values
    }

    let values: [String: String]

    public func textFor(keypathName: String, sourceText: String) -> String {
        return values[keypathName] ?? sourceText
    }
}
