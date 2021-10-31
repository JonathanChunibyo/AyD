/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dto;

import dao.evaluacionDao;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author Jose
 */
public class evaluacion {

    public evaluacion() {
    }

    public String crearGrafica(String evaluado, String evaluador) throws ClassNotFoundException, SQLException {
        String respuesta = "<script type=\"text/javascript\">\n"
                + "google.charts.load('current', {'packages':['bar']});\n"
                + "google.charts.setOnLoadCallback(drawStuff);\n"
                + "function drawStuff() {\n"
                + "var data = new google.visualization.arrayToDataTable([\n"
                + "['COMPETENCIAS DEL  DOCENTE', 'Porcentaje'],";

        evaluacionDao ev = new evaluacionDao();
        ResultSet r = ev.datosEvaluacion(evaluado, evaluador);
        r.next();

        respuesta += "[\"Dominio curricular\", " + Integer.parseInt(r.getString("dato1")) + "],\n";
        respuesta += "[\"Planeación y organización académica\", " + Integer.parseInt(r.getString("dato2")) + "],\n";
        respuesta += "[\"Pedagógica y didáctica\", " + Integer.parseInt(r.getString("dato3")) + "],\n";
        respuesta += "[\"Evaluación del aprendizajes\", " + Integer.parseInt(r.getString("dato4")) + "],\n";
        respuesta += "[\"Uso de recursos\", " + Integer.parseInt(r.getString("dato5")) + "],\n";
        respuesta += "[\"Seguimiento de procesos\", " + Integer.parseInt(r.getString("dato6")) + "],\n";
        respuesta += "[\"Comunicación institucional\", " + Integer.parseInt(r.getString("dato7")) + "],\n";
        respuesta += "[\"Interacción comunidad / entorno\", " + Integer.parseInt(r.getString("dato8")) + "],\n";
        respuesta += "[\"" + r.getString("competencia9") + "\", " + Integer.parseInt(r.getString("dato9")) + "],\n";
        respuesta += "[\"" + r.getString("competencia10") + "\", " + Integer.parseInt(r.getString("dato10")) + "],\n";
        respuesta += "[\"" + r.getString("competencia11") + "\", " + Integer.parseInt(r.getString("dato11")) + "]\n";

        respuesta += "]);\n"
                + "var options = {\n"
                + "width: 1000,\n"
                + "legend: { position: 'none' },\n"
                + "bar: { groupWidth: \"90%\" }\n"
                + "};\n"
                + "var chart = new google.charts.Bar(document.getElementById('top_x_div'));\n"
                + "chart.draw(data, google.charts.Bar.convertOptions(options));\n"
                + "};\n"
                + "</script>";

        return respuesta;
    }

    public double calcularTotal(String evaluado, String evaluador) throws ClassNotFoundException, SQLException {
        double dato = 0;
        double aux = 0;
        double aux2 = 0;
        evaluacionDao ev = new evaluacionDao();
        ResultSet r = ev.datosEvaluacion(evaluado, evaluador);
        r.next();

        aux = Double.parseDouble(r.getString("dato1")) + Double.parseDouble(r.getString("dato2")) + Double.parseDouble(r.getString("dato3")) + Double.parseDouble(r.getString("dato4"));
        aux2 = (aux / 4) * 0.5;
        aux = Double.parseDouble(r.getString("dato5")) + Double.parseDouble(r.getString("dato6"));
        aux2 += (aux / 2) * 0.3;
        aux = Double.parseDouble(r.getString("dato7")) + Double.parseDouble(r.getString("dato8"));
        aux2 += (aux / 2) * 0.2;
        dato += (aux2) * 0.7;

        aux = Double.parseDouble(r.getString("dato9")) + Double.parseDouble(r.getString("dato10")) + Double.parseDouble(r.getString("dato11"));
        aux2 = (aux / 3) * 0.3;
        dato += aux2;

        return dato;
    }
    

}
