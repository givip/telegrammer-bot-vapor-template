//
//  File.swift
//  
//
//  Created by Givi on 18.02.2020.
//

import Foundation
import Telegrammer

class DemoEchoBot {
    let bot: Bot
    let dispatcher: Dispatcher

    init(token: String) throws {
        let settings = Bot.Settings(token: token)
        self.bot = try Bot(settings: settings)

        dispatcher = Dispatcher(bot: bot)

        dispatcher.add(
            handler: MessageHandler(
                filters: .all,
                callback: echoResponse
            )
        )
    }

    func echoResponse(_ update: Update, _ context: BotContext?) throws {
        guard let message = update.message, let text = message.text else {
            return
        }

        let params = Bot.SendMessageParams(
            chatId: .chat(message.chat.id),
            text: text
        )
        
        try bot.sendMessage(params: params)
    }
}
