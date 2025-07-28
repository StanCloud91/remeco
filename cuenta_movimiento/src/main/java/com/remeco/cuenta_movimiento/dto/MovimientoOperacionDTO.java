package com.remeco.cuenta_movimiento.dto;

import lombok.Data;

/**
 * DTO para recibir la estructura especial de movimiento desde el frontend.
 */
@Data
public class MovimientoOperacionDTO {
    private String numeroCuenta;
    private String tipo;
    private Double saldoInicial;
    private Boolean estado;
    private String movimiento;
}
