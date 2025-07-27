package com.remeco.cliente_persona.entity;

import jakarta.persistence.*;
import jakarta.validation.constraints.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

@Entity
@Table(name = "clientes")
@Data
@NoArgsConstructor
@AllArgsConstructor
@EqualsAndHashCode(callSuper = true)
public class Cliente extends Persona {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @NotBlank(message = "La contraseña es obligatoria")
    @Size(min = 4, max = 100, message = "La contraseña debe tener entre 4 y 100 caracteres")
    @Column(name = "contraseña", nullable = false)
    private String contraseña;

    @NotNull(message = "El estado es obligatorio")
    @Column(name = "estado", nullable = false)
    private Boolean estado;

    // Constructor con parámetros básicos
    public Cliente(String nombre, String genero, Integer edad, String identificacion,
                   String direccion, String telefono,
                   String contraseña, Boolean estado) {
        super(nombre, genero, edad, identificacion, direccion, telefono);
        //this.clienteId = clienteId;
        this.contraseña = contraseña;
        this.estado = estado;
    }
}
