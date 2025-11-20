package com.example.CrudFast.entity;

import jakarta.persistence.*;
import lombok.Data;
import lombok.Generated;

@Data
@Entity
@Table(name = "tb_student")
public class Student {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)

    private Long studentId;
    private String firstName;
    private String lastName;
    @Column(name = "email_adress", unique = true, nullable = false)
    private String email;
}
