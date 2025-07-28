package com.remeco.cuenta_movimiento.controller;

import com.remeco.cuenta_movimiento.dto.ApiResponse;
import com.remeco.cuenta_movimiento.dto.ReporteMovimientoView;
import com.remeco.cuenta_movimiento.kafka.ClienteKafkaConsumer;
import com.remeco.cuenta_movimiento.service.MovimientoService;
import lombok.RequiredArgsConstructor;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.time.LocalDate;
import java.util.List;

@RestController
@RequestMapping("/reportes")
@RequiredArgsConstructor
public class ReporteController {
    private final MovimientoService movimientoService;
    private final ClienteKafkaConsumer clienteKafkaConsumer;

    @GetMapping
    public ApiResponse<List<ReporteMovimientoView>> generarReporte(
            @RequestParam Integer identificacion,
            @RequestParam @DateTimeFormat(pattern = "yyyy-MM-dd") LocalDate fechaInicio,
            @RequestParam @DateTimeFormat(pattern = "yyyy-MM-dd") LocalDate fechaFin) {

        List<ReporteMovimientoView> reporte = movimientoService.buscarMovimientosxClientexFecha(fechaInicio, fechaFin, identificacion);
        return ApiResponse.success(reporte, "Reporte generado exitosamente");
    }
}
