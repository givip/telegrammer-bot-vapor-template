import Vapor
import Telegrammer
import TelegrammerMiddleware

public func configure(_ app: Application) throws {

    //Don't forget to send WebHooks setting to Telegram servers before use.
    //Use `func setWebhook(params: SetWebhookParams) throws -> Future<Bool>` method

    guard let token = Enviroment.get("TELEGRAM_BOT_TOKEN") else {
        print("TELEGRAM_BOT_TOKEN variable wasn't found in enviroment variables")
        exit(1)
    }

    let bot = try DemoEchoBot(token: token)

    app.middleware.use(
        TelegrammerMiddleware(dispatcher: bot.dispatcher)
    )

    try routes(app)
}
