import Vapor
import Telegrammer
import TelegrammerMiddleware

public func configure(_ app: Application) throws {

    //Don't forget to send WebHooks setting to Telegram servers before use.
    //Use `func setWebhook(params: SetWebhookParams) throws -> Future<Bool>` method

    var settings = Bot.Settings(token: "Telegram-token-here")
    settings.webhooksConfig = Webhooks.Config(ip: "0.0.0.0", url: "https://test.url", port: 88)
    let bot = try DemoEchoBot(path: "bot", settings: settings)

    app.middleware.use(bot)

    try routes(app)
}
