package com.remeco.cuenta_movimiento.repository;

import com.remeco.cuenta_movimiento.dto.ReporteMovimientoView;
import com.remeco.cuenta_movimiento.entity.Cuenta;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.time.LocalDate;
import java.util.List;
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

    /**
     * Verifica si existe una cuenta con el número especificado, excluyendo una cuenta específica.
     *
     * @param numeroCuenta Número de cuenta a verificar
     * @param id ID de la cuenta a excluir
     * @return true si existe, false en caso contrario
     */


    @Query(value = """
                SELECT 
                    DATE_FORMAT(m.fecha, '%Y-%m-%d %H:%i:%s') as fecha,
                    p.nombre as cliente,
                    c.numero_cuenta as numeroCuenta,
                    c.tipo_cuenta as tipo,
                    CAST(CASE
                        WHEN m.tipo_movimiento = 'RETIRO' THEN m.saldo + m.valor
                        ELSE m.saldo - m.valor
                    END AS DECIMAL(15,2)) as saldoInicial,
                    CAST(IF(c.estado = 1, 1, 0) AS SIGNED) as estado,
                    CAST(CASE
                        WHEN m.tipo_movimiento = 'RETIRO' THEN m.valor * (-1)
                        ELSE m.valor
                    END AS DECIMAL(15,2)) as movimiento,
                    CAST(m.saldo AS DECIMAL(15,2)) as saldoDisponible
                FROM remeco.cuentas c
                INNER JOIN prueba_tecnica.movimientos m ON c.id = m.cuenta_id
                INNER JOIN prueba_tecnica.personas p ON p.id = c.cliente_id
                WHERE m.fecha >= :fechaInicio
                AND m.fecha <= :fechaFin
                AND p.identificacion = :identificacion
                ORDER BY m.fecha ASC
            """, nativeQuery = true)
    List<ReporteMovimientoView> buscarMovimientosxClientexFecha(@Param("fechaInicio") LocalDate fechaInicio, @Param("fechaFin") LocalDate fechaFin, @Param("identificacion") int identificacion);
}
