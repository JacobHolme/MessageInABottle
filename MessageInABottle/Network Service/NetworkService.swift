//
//  NetworkService.swift
//  MessageInABottle
//
//  Created by Sam DuBois on 10/19/19.
//  Copyright © 2019 Holme. All rights reserved.
//

import Foundation
import MultipeerConnectivity

class NetworkService: NSObject {
    
    // Network Service Delegate
    var delegate: NetworkServiceDelegate?
    
    // JSON Decoder for parsing data
    let decoder = JSONDecoder()
     
    // Last Recorded Crecentials to ensure the same message is NOT received and processed twice to the same device
    private var lastRecordedMessages: [Message] = []
    
    // Service Type must be a unique 15 character long string with only lowercase letters and hyphens
    private let NetworkServiceType = "hack-umass-vii"
    
    private let peerID = MCPeerID(displayName: UIDevice.current.name)
    private let serviceAdvertiser: MCNearbyServiceAdvertiser
    private let serviceBrowser: MCNearbyServiceBrowser
    
    lazy var session: MCSession = {
        let session = MCSession(peer: self.peerID, securityIdentity: nil, encryptionPreference: .required)
        session.delegate = self
        return session
    }()
    
    func getPeerID() -> String {
        return String(describing: self.peerID)
    }
    
    override init() {
        self.serviceAdvertiser = MCNearbyServiceAdvertiser(peer: peerID, discoveryInfo: nil, serviceType: NetworkServiceType)
        self.serviceBrowser = MCNearbyServiceBrowser(peer: peerID, serviceType: NetworkServiceType)
        
        super.init()
        
        self.serviceAdvertiser.delegate = self
        self.serviceBrowser.delegate = self
        
        startBrowsingAndAdvertising()
    }
    
    deinit {
        stopBrowsingAndAdvertising()
    }
    
    func stopBrowsingAndAdvertising() {
        self.serviceBrowser.stopBrowsingForPeers()
        self.serviceBrowser.stopBrowsingForPeers()
    }
    
    func startBrowsingAndAdvertising() {
        self.serviceAdvertiser.startAdvertisingPeer()
        self.serviceBrowser.startBrowsingForPeers()
    }
    
    // A function for sending out a message to all connected devices on the network
    func sendOut(message: Message) {
        
        if session.connectedPeers.count > 0 {
            do {
                if lastRecordedMessages.count > 10 {
                    lastRecordedMessages = []
                }
                lastRecordedMessages.append(message)
                
                let message = "\(message.sender),\(message.content),\(message.timestamp)"
                try self.session.send(message.data(using: .utf8)!, toPeers: session.connectedPeers, with: .reliable)
                
            } catch let error {
                print("Error: \(error)")
            }
        }
    }
}

extension NetworkService: MCNearbyServiceAdvertiserDelegate {
    
    func advertiser(_ advertiser: MCNearbyServiceAdvertiser, didReceiveInvitationFromPeer peerID: MCPeerID, withContext context: Data?, invitationHandler: @escaping (Bool, MCSession?) -> Void) {
        print("Did Receive Invitation From Peer: \(peerID)")
        invitationHandler(true, self.session)
    }
    
    func advertiser(_ advertiser: MCNearbyServiceAdvertiser, didNotStartAdvertisingPeer error: Error) {
        print("Did Not Start Advertising Peer with error: \(error)")
    }
}

extension NetworkService: MCNearbyServiceBrowserDelegate {
    
    func browser(_ browser: MCNearbyServiceBrowser, foundPeer peerID: MCPeerID, withDiscoveryInfo info: [String : String]?) {
        print("Found Peer: \(peerID)")
        print("Invite Peer: \(peerID)")
        browser.invitePeer(peerID, to: self.session, withContext: nil, timeout: 300)
    }
    
    func browser(_ browser: MCNearbyServiceBrowser, lostPeer peerID: MCPeerID) {
        print("Lost Peer: \(peerID)")
    }
    
    func browser(_ browser: MCNearbyServiceBrowser, didNotStartBrowsingForPeers error: Error) {
        print("Did Not start Browsing For Peers: \(error)")
    }
}

// Delegate Methods Required for MC Session
extension NetworkService: MCSessionDelegate {
    
    func session(_ session: MCSession, peer peerID: MCPeerID, didChange state: MCSessionState) {
        print("Peer: \(peerID), changed state: \(state.rawValue)")
        self.delegate?.connectedDevicesChanged(manager: self, connectedDevices: session.connectedPeers.map{$0.displayName})
    }
    
    func session(_ session: MCSession, didReceive data: Data, fromPeer peerID: MCPeerID) {
        print("Did Receive Data: \(data)")
        
        let strArray = String(data: data, encoding: .utf8)!.components(separatedBy: ",")
        let message = Message(sender: strArray[0], content: strArray[1], timestamp: strArray[2])
        
        if !messageInRecentHistory(incomingMessage: message) {
            self.delegate?.receivedMessage(manager: self, message: message)
            sendOut(message: message)
        }
    }
    
    func messageInRecentHistory(incomingMessage: Message) -> Bool {
        for message in lastRecordedMessages {
            if message.sender == incomingMessage.sender && message.timestamp == incomingMessage.timestamp {
                return true
            }
        }
        
        return false
    }
    
    func session(_ session: MCSession, didReceive stream: InputStream, withName streamName: String, fromPeer peerID: MCPeerID) {
        print("Did Receive Stream")
    }
    
    func session(_ session: MCSession, didStartReceivingResourceWithName resourceName: String, fromPeer peerID: MCPeerID, with progress: Progress) {
        print("Did Start Receiving Recource with Name")
    }
    
    func session(_ session: MCSession, didFinishReceivingResourceWithName resourceName: String, fromPeer peerID: MCPeerID, at localURL: URL?, withError error: Error?) {
        print("Did finish receiving recource with name")
    }
}
