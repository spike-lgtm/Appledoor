package com.appledoor.backend.models;

import com.appledoor.backend.dtos.UserDTO;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.*;
import java.util.Set;

@Entity
@Table(name = "users")
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
public class User {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    private String username;
    private String password;
    private String fullName;
    private String email;
    private String institutionName;
    private String major;
    private String eduLevel;
    @ElementCollection
    private Set<Roles> roles;

    public static User fromDTO(UserDTO userDTO, Set<Roles> roles) {
        User user = new User();
        user.setUsername(userDTO.getUsername());
        user.setPassword(userDTO.getPassword());
        user.setFullName(userDTO.getFullName());
        user.setEmail(userDTO.getEmail());
        user.setInstitutionName(userDTO.getInstitutionName());
        user.setMajor(userDTO.getMajor());
        user.setEduLevel(userDTO.getEduLevel());
        user.setRoles(roles);
        return user;
    }
}
