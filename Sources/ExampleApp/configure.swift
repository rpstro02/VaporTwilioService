import Vapor
import Twilio

/// Called before your application initializes.
public func configure(_ app: Application) throws {
    
    app.http.server.configuration.hostname = "0.0.0.0"
    
    app.twilio.configuration = .environment
    
    try routes(app)
}
