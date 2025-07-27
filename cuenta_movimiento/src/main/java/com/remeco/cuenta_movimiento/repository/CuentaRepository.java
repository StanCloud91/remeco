package com.remeco.cuenta_movimiento.repository;

import com.remeco.cuenta_movimiento.entity.Cuenta;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;

public interface CuentaRepository extends JpaRepository<Cuenta, Long> {

    /**
     * Busca una cuenta por su número de cuenta.
     *
     * @param numeroCuenta Número de cuenta a buscar
     * @return Optional con la cuenta encontrada
     */
    Optional<Cuenta> findByNumeroCuenta(String numeroCuenta);

    /**
     * Verifica si existe una cuenta con el número especificado.
     *
     * @param numeroCuenta Número de cuenta a verificar
     * @return true si existe, false en caso contrario
     */
    boolean existsByNumeroCuenta(String numeroCuenta);

    /**
     * Verifica si existe una cuenta con el número especificado, excluyendo una cuenta específica.
     *
     * @param numeroCuenta Número de cuenta a verificar
     * @param id ID de la cuenta a excluir
     * @return true si existe, false en caso contrario
     */
    boolean existsByNumeroCuentaAndIdNot(String numeroCuenta, Long id);
}
