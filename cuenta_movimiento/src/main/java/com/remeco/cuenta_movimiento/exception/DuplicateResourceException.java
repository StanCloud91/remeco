package com.remeco.cuenta_movimiento.exception;

import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ResponseStatus;

/**
 * Excepción lanzada cuando se intenta crear un recurso que ya existe.
 *
 * @author Stalin Salgado
 * @version 1.0
 * @since 2025-07-27
 */
@ResponseStatus(HttpStatus.CONFLICT)
public class DuplicateResourceException extends RuntimeException {

    public DuplicateResourceException(String message) {
        super(message);
    }

    public DuplicateResourceException(String resourceName, String fieldName, Object fieldValue) {
        super(String.format("%s ya existe con %s : '%s'", resourceName, fieldName, fieldValue));
    }
}
