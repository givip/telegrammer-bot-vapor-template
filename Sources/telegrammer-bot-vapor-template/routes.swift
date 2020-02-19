//
//  routes.swift
//  VinScan
//
//  Created by Givi on 05.02.2020.
//

import Foundation
import Vapor

func routes(_ app: Application) throws {
    app.get("") { (request) -> String in
        return "This is Vapor Server with running Telegram bot (Telegrammer)"
    }
}
