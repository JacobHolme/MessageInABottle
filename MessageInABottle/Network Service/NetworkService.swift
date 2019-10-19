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
    private var lastRecordedtimestamp: String?
    private var lasRecordedSender: String?
    
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
        self.serviceAdvertiser.startAdvertisingPeer()
        
        self.serviceBrowser.delegate = self
        self.serviceBrowser.startBrowsingForPeers()
    }
    
    deinit {
        self.serviceAdvertiser.stopAdvertisingPeer()
        self.serviceBrowser.stopBrowsingForPeers()
    }
    
    // A function for sending out a message to all connected devices on the network
    func sendOut(message: String, sender: String, timestamp: String) {
        
        if session.connectedPeers.count > 0 {
            do {
                self.lasRecordedSender = sender
                self.lastRecordedtimestamp = timestamp
                
                let messageData = try! JSONEncoder().encode(message)
                try self.session.send(messageData, toPeers: session.connectedPeers, with: .reliable)
                
            } catch let error {
                print("Error: \(error)")
            }
        }
    }
    
    // A function for pushing on a sent request to all connected devices on it's network provided it has not seen the message before
    func pushOn(message: String, sender: String, timestamp: String) {
        if sender != self.lastRecordedtimestamp && timestamp != lastRecordedtimestamp {
            self.sendOut(message: message, sender: sender, timestamp: timestamp)
        }
    }
}

extension NetworkService: MCNearbyServiceAdvertiserDelegate {
    
    func advertiser(_ advertiser: MCNearbyServiceAdvertiser, didReceiveInvitationFromPeer peerID: MCPeerID, withContext context: Data?, invitationHandler: @escaping (Bool, MCSession?) -> Void) {
        print("Found Peer: \(peerID)")
    }
    
    func advertiser(_ advertiser: MCNearbyServiceAdvertiser, didNotStartAdvertisingPeer error: Error) {
        print("Did Not Start Advertising Peer with error: \(error)")
    }
}

extension NetworkService: MCNearbyServiceBrowserDelegate {
    
    func browser(_ browser: MCNearbyServiceBrowser, foundPeer peerID: MCPeerID, withDiscoveryInfo info: [String : String]?) {
        print("Found Peer: \(peerID)")
        print("Invite Peer: \(peerID)")
        browser.invitePeer(peerID, to: self.session, withContext: nil, timeout: 20)
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
        self.delegate?.connectedDevicesChanged(manager: self, connectedDevice: session.connectedPeers.map{$0.displayName})
    }
    
    func session(_ session: MCSession, didReceive data: Data, fromPeer peerID: MCPeerID) {
        print("Did Receive Data: \(data)")
        
        do {
            let message = try decoder.decode(Message.self, from: data)
            self.delegate?.receivedMessage(manager: self, message: message)
        } catch let parsingError {
            print("error: \(parsingError)")
        }
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
