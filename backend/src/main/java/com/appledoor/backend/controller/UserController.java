package com.appledoor.backend.controller;

import com.appledoor.backend.dtos.UserDTO;
import com.appledoor.backend.services.UserServices;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/users")
public class UserController {

    private final UserServices userServices;

    public UserController(UserServices userServices) {
        this.userServices = userServices;
    }

    @PostMapping("/register")
    public UserDTO register(@RequestBody UserDTO user) {
        return userServices.register(user);
    }

//    @PostMapping("/login")
//    public String login(@RequestParam String username, @RequestParam String password) {
//        return userServices.login(username, password);
//    }

}
