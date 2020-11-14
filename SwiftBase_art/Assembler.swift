//
//  Assembler.swift
//  SwiftBase_art
//
//  Created by MacBook on 11/14/20.
//  Copyright © 2020 MacBook. All rights reserved.
//

import Foundation


//Assembler đảm nhiệm việc init mọi thứ. VC, VM, Navi...
final class MainAssembler: Assembler {

}

protocol Assembler:
    class,
    AppAssembler,
    HomeAssembler,
    ListAssembler {
    
}
