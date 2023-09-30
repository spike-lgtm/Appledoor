package com.appledoor.backend.dtos;

import com.appledoor.backend.models.User;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
public class UserDTO {
    private String username;
    private String password;
    private String fullName;
    private String email;
    private String institutionName;
    private String major;
    private String eduLevel;

    private String token;

    public static UserDTO fromEntity(User user, String token) {
        UserDTO userDTO = new UserDTO();
        userDTO.setUsername(user.getUsername());
        userDTO.setFullName(user.getFullName());
        userDTO.setEmail(user.getEmail());
        userDTO.setInstitutionName(user.getInstitutionName());
        userDTO.setMajor(user.getMajor());
        userDTO.setEduLevel(user.getEduLevel());
        userDTO.setToken(token);
        return userDTO;
    }
}
