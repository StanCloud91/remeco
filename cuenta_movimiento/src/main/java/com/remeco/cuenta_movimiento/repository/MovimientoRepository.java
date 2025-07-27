package com.remeco.cuenta_movimiento.repository;

import com.remeco.cuenta_movimiento.entity.Movimiento;
import org.springframework.data.jpa.repository.JpaRepository;

public interface MovimientoRepository extends JpaRepository<Movimiento, Long> {
}
