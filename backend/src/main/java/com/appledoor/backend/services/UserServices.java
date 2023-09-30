package com.appledoor.backend.services;

import com.appledoor.backend.config.TokenProvider;
import com.appledoor.backend.dtos.UserDTO;
import com.appledoor.backend.models.Roles;
import com.appledoor.backend.models.User;
import com.appledoor.backend.repositories.UserRepository;
import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.HashSet;
import java.util.Set;

@Service(value = "userService")
public class UserServices implements UserDetailsService {


    @Autowired
    private UserRepository userRepository;
    @Autowired
    private TokenProvider jwtTokenUtil;
    @Autowired
    private BCryptPasswordEncoder bcryptEncoder;





    public UserDTO getUser(String username, String token) {
        return UserDTO.fromEntity(userRepository.findByUsername(username), token);
    }

    public UserDTO register(UserDTO user) {
        if (userRepository.findByUsername(user.getUsername()) != null) {
            throw new IllegalArgumentException("Username already exists");
        }

        if (userRepository.findByEmail(user.getEmail()) != null) {
            throw new IllegalArgumentException("Email already exists");
        }



        user.setPassword(bcryptEncoder.encode(user.getPassword()));
        Set<Roles> roles = Set.of(Roles.USER);
        userRepository.save(User.fromDTO(user, roles));


        user.setPassword("");
        return user;
    }


    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        User user = userRepository.findByUsername(username);
        if(user == null){
            throw new UsernameNotFoundException("Invalid username or password.");
        }
        return new org.springframework.security.core.userdetails.User(user.getUsername(), user.getPassword(), getAuthority(user));
    }

    private Set<SimpleGrantedAuthority> getAuthority(User user) {
        Set<SimpleGrantedAuthority> authorities = new HashSet<>();
        user.getRoles().forEach(role -> {
            authorities.add(new SimpleGrantedAuthority("ROLE_" + role.name()));
        });
        return authorities;
    }
}
