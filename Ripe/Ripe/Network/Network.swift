//
//  Network.swift
//  Ripe
//
//  Created by Matthew Paletta on 2017-03-12.
//  Copyright © 2017 Matthew Paletta. All rights reserved.
//

import UIKit
import MetalKit
import MetalPerformanceShaders

class Network: NSObject {
    private var Net: Inception3Net? = nil
    private var device: MTLDevice!
    private var commandQueue: MTLCommandQueue!
    private var textureLoader : MTKTextureLoader!
    private var ciContext : CIContext!
    private var sourceTexture : MTLTexture? = nil
    
    private var predictLabel: String?
    
    required override init() {
        // Load default device.
        device = MTLCreateSystemDefaultDevice()
        
        // Make sure the current device supports MetalPerformanceShaders.
        guard MPSSupportsMTLDevice(device) else {
            print("Metal Performance Shaders not Supported on current Device")
            return
        }
        
        // Load any resources required for rendering.
        
        // Create new command queue.
        commandQueue = device!.makeCommandQueue()
        
        // make a textureLoader to get our input images as MTLTextures
        textureLoader = MTKTextureLoader(device: device!)
        
        // Load the appropriate Network
        Net = Inception3Net(withCommandQueue: commandQueue)
        
        // we use this CIContext as one of the steps to get a MTLTexture
        ciContext = CIContext.init(mtlDevice: device)
    
    }
    
    func getPrediction(image: UIImage)->String {
        // use CGImage property of UIImage
        var cgImg = image.cgImage
        // check to see if cgImg is valid if nil, UIImg is CIImage based and we need to go through that
        // this shouldn't be the case with our example
        if(cgImg == nil){
            // our underlying format was CIImage
            var ciImg = image.ciImage
            if(ciImg == nil){
                // this should never be needed but if for some reason both formats fail, we create a CIImage
                // change UIImage to CIImage
                ciImg = CIImage(image: image)
            }
            // use CIContext to get a CGImage
            cgImg = ciContext.createCGImage(ciImg!, from: ciImg!.extent)
        }
        
        // get a texture from this CGImage
        do {
            sourceTexture = try textureLoader.newTexture(with: cgImg!, options: [:])
        }
        catch let error as NSError {
            fatalError("Unexpected error ocurred: \(error.localizedDescription).")
        }
        
        
        runNetwork()
        
        // run inference neural network to get predictions and display them
        return predictLabel!
    }
    
    /**
     This function gets a commanBuffer and encodes layers in it. It follows that by commiting the commandBuffer and getting labels
     
     
     - Returns:
     Void
     */
    private func runNetwork() {
        
        // to deliver optimal performance we leave some resources used in MPSCNN to be released at next call of autoreleasepool,
        // so the user can decide the appropriate time to release this
        autoreleasepool{
            // encoding command buffer
            let commandBuffer = commandQueue.makeCommandBuffer()
            
            // encode all layers of network on present commandBuffer, pass in the input image MTLTexture
            Net!.forward(commandBuffer: commandBuffer, sourceTexture: sourceTexture)
            
            // commit the commandBuffer and wait for completion on CPU
            commandBuffer.commit()
            commandBuffer.waitUntilCompleted()
            
            // display top-5 predictions for what the object should be labelled
            let label = Net!.getLabel()
            
            predictLabel = label[0]
            
            //predictLabel.text = label
            //predictLabel.isHidden = false
        }
    }
}
