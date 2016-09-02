/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package id.co.qhodok.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.stereotype.Controller;

/**
 *
 * @author permana
 */
@Controller
public class WebSocketController {
    
    @Autowired
    private SimpMessagingTemplate template;
    
    
    @MessageMapping("/greating")
    public void greating(){
        System.out.println("get message");
        template.convertAndSend("/topic/greating","hai client");
    }
    
}
