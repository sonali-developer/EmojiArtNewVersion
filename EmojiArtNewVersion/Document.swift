//
//  Document.swift
//  EmojiArtNewVersion
//
//  Created by Sonali Patel on 6/2/18.
//  Copyright © 2018 Sonali Patel. All rights reserved.
//

import UIKit

class Document: UIDocument {
    
    override func contents(forType typeName: String) throws -> Any {
        // Encode your document with an instance of NSData or NSFileWrapper
        return Data()
    }
    
    override func load(fromContents contents: Any, ofType typeName: String?) throws {
        // Load your document from contents
    }
}

