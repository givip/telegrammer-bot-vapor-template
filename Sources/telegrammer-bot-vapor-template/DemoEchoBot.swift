//
//  DemoEchoBot.swift
//
//
//  Created by Givi on 18.02.2020.
//

import Foundation
import Telegrammer
import TelegrammerMiddleware

class DemoEchoBot: TelegrammerMiddleware {
    public let dispatcher: Dispatcher
    public let path: String
    public let bot: Bot

    public init(path: String, settings: Bot.Settings) throws {
        self.path = path
        self.bot = try Bot(settings: settings)
        self.dispatcher = Dispatcher(bot: bot)

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
