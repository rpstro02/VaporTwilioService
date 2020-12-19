import Vapor
import Twilio

/// Register your application's routes here.
func routes(_ app: Application) throws {
    // Basic "It works" example
    app.get("sms") { req -> EventLoopFuture<ClientResponse> in
        let sms = OutgoingSMS(body: "Hey There", from: "+15555555", to: "+15555556")

        return try req.twilio.send(sms, on:req.client)
    }

    app.post("incoming") { req -> Response in
        let sms = try req.content.decode(IncomingSMS.self)

        let responseMessage = SMSResponse(
            Message(body: "Hello Friend!"),
            Message(body: "This is a second text.")
        )

        return req.twilio.respond(with: responseMessage)
    }
}


