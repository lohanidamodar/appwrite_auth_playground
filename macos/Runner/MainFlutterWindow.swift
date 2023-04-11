import Cocoa
import FlutterMacOS

class MainFlutterWindow: NSWindow {
    var flutterViewController: FlutterViewController?
    override func awakeFromNib() {
        self.flutterViewController = FlutterViewController.init()
        let windowFrame = self.frame
        self.contentViewController = flutterViewController
        self.setFrame(windowFrame, display: true)
        
        NSAppleEventManager.shared().setEventHandler(self, andSelector: #selector(handleURLEvent(_:with:)), forEventClass: AEEventClass(kInternetEventClass), andEventID: AEEventID(kAEGetURL))
        
        RegisterGeneratedPlugins(registry: flutterViewController!)
        
        super.awakeFromNib()
        
    }
    
    @objc
    private func handleURLEvent(_ event: NSAppleEventDescriptor, with replyEvent: NSAppleEventDescriptor) {
        guard let urlString = event.paramDescriptor(forKeyword: AEKeyword(keyDirectObject))?.stringValue else { return }
        
        self.flutterViewController!.engine.binaryMessenger.send(
            onChannel: "flutter/navigation",
            message: FlutterJSONMethodCodec().encode(
                FlutterMethodCall(
                    methodName: "pushRouteInformation",
                    arguments: ["location": urlString]
                )
            )
        )
    }
    
}
