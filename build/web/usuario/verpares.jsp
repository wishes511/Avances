<%-- 
    Document   : Verpares
    Created on : 05/10/2017, 02:01:15 PM
    Author     : mich
--%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Calendar"%>
<% HttpSession objSesion = request.getSession(false);
//i_d
try{
    boolean estado;
    String usuario = (String) objSesion.getAttribute("usuario");
    String tipos = (String) objSesion.getAttribute("tipo");
    String ids = String.valueOf(objSesion.getAttribute("i_d"));
    if (usuario != null && tipos != null && tipos.equals("USUARIO")) {

    } else {
        response.sendRedirect("../index.jsp");
    }
    Calendar fecha = Calendar.getInstance();
    int año = fecha.get(Calendar.YEAR);
    int mes = fecha.get(Calendar.MONTH) + 1;
    int dia = fecha.get(Calendar.DAY_OF_MONTH);
    String fechac = "" ;
    String fechaca= "";
if(dia<10){
         fechac = "0" + dia;    
         fechaca ="0" + (dia - 1);
    }else{
         fechac  = dia+"";    
         fechaca = dia+"";
    }
        if(mes<10){
     fechac =fechac + "-0" + mes+"-"+año;    
     fechaca = fechaca+ "-0" + (mes - 1)+"-"+año;
    }else {
        fechac =fechac + "-" + mes+"-"+año;    
     fechaca = fechaca+ "-" + (mes - 1)+"-"+año ;
    }
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="refresh" content="1200">
        <meta name="viewport" content="width=device-width, minimum-scale=1.0, maximum-scale=1.0" />
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Ver Pares</title>
        <link rel="icon"  href="../images/aff.png" sizes="32x32"/>
        <link rel="stylesheet" type="text/css" href="../css/bootstrap.css">
        <link rel='stylesheet' type="text/css" href="../css/bootstrap.min.css">
        <link rel='stylesheet' type="text/css" href="../css/responsive.css">
        <link rel="stylesheet" type="text/css" href="../css/fondos.css">
        <link rel="stylesheet" type="text/css" href="../css/loginn.css">
        <script type="text/javascript" src="../js/bootstrap.js"></script>
        <script type="text/javascript" src="../js/bootstrap.min.js"></script>
        <script type="text/javascript" src="../js/jquery-3.1.1.min.js"></script>
        <script type="text/javascript" src="../js/bootstrap.min.js"></script>
        <script type="text/javascript" src="../js/dhtmlgoodies_calendar.js?random=20171118"></script>
        <link type="text/css" rel="stylesheet" href="../css/dhtmlgoodies_calendar.css?random=20171118" media="screen"></link>
		

    </head>
    <body class="body1">
        <script type="text/javascript">
            // /^[a-zAZ0-9_\.\-]+@[a-zA-Z0-9\-]+
            function valida_envia() {
                var valor = $("#f1").val();
                //(/^\d{4}\-\d{2}|\d{1}\-\d{2}$/i.test(valor))
                if (!(/^\d{2}|\d{1}\-\d{2}\-\d{4}\$/i.test(valor))) {
                    alert("fecha invalida invalido");
                    document.forma.f1.focus();
                    document.getElementById("f1").value = "<%=fechac%>";
                    return 0;
                }
                var valor1 = $("f2").val();
                if (!(/^([A-Za-z\d]*)$/i.test(valor1))) {
                    alert("Contraseña invalida! ");
                    document.forma.contrasenalog.focus();
                    document.getElementById("f2").value = "";
                    return 0;
                }
            }
        </script>

        <div class="container-fluid">
            <nav class="navbar navbar-default">

                <ul class="nav navbar-nav nav-pills">
                    <li><a class="navbar-brand" href="index.jsp"><img src="../images/home.png" class="" width="25"></a></li>
                    <li class="dropdown ln active">
                        <a  class="dropdown-toggle" data-toggle="dropdown" href="#80">
                            Usuario<span class="caret"></span>
                        </a>
                        <ul class="dropdown-menu" id="#90" role="menu">

                            <li class="ln"><a href="buscalote.jsp">Busqueda</a></li>
                            <li class="ln"><a href="lote_detenido.jsp">Lotes detenidos</a></li>
                            <li class="ln active"><a href="">Ver pares</a></li>
                            
                        </ul>
                    </li>
                    <!--<li class="ln"><a  href="../Dateupdate">actualizar fechas</a></li>-->
                    <li class="ln"><a href="../Cierresesion">Salir</a></li>
                </ul>
                <div style="float:right" class="nav nav-pills">
                    <li > <label class="ln">Online: <%=usuario%></label></li>
                    <li class="ln btnmy-2 my-sm-0"><a href="opciones.jsp"><img src="../images/opciones.png" width="5" height="20" alt=""></a></li>
                </div>

            </nav>
            <div class="container">
                <div class="row">
                    <div class="col-md-12 " >
                        <div class="col-sm-offset-3" >
                            <form name="forma" >
                                <div class="col-sm-3" align="center">
                                    <label class="ln">Inicial</label><input class="form-control input-sm chat-input ln" type="text" name="f1" id="f1" value="<%=fechac%>" onchange="okas()" maxlength="10"  required/>
                                </div>
                                <div class="col-sm-2">
                                    <br>
                                    <input type="button" class="btn btn-toolbar alert-success ln" value="Cal" onclick="displayCalendar(document.forms[0].f1, 'dd-mm-yyyy', this)"/>
                                </div>
                                <div class="col-sm-3" align="center">
                                    <label class="ln" >Final</label><input class="form-control input-sm chat-input ln" type="text" name="f2" id="f2" value="<%=fechac%>" onchange="okas()" maxlength="10" required/>
                                </div>
                                <div class="col-sm-2">
                                    <br>
                                    <input type="button" value="Cal" class="btn btn-toolbar alert-success ln" onclick="displayCalendar(document.forms[0].f2, 'dd-mm-yyyy', this)"/>
                                </div>
                               
                            </form>
                        </div>
                    </div>
                </div>
                                 <div class="row">
                                    <br><div class="col-sm-offset-5 col-sm-2">
                                        <select class="form-control" name="maq" id="maq" onclick="okas()">
                                            <option class="form-control">TODOS</option>
                                            <option class="form-control">CRUZ</option>
                                            <option class="form-control">INOCENCIO</option>
                                            <option class="form-control">LEON</option>
                                            <option class="form-control">LALO</option>
                                            <option class="form-control">ESTEBAN</option>
                                            <option class="form-control">PLANTA</option>
                                            <option class="form-control">COMONFORT</option>
                                        </select>
                                        <div class="col-sm-2">
                                            
                                    </div>
                                    </div>
                                    
                                </div>
                <div class="row">
                    <div class=" esp1 ln" align="center">
                        <br><button type="submit" name="envio" class="btn btn-success ln" id="envio" value="Ver Pares" onclick="okas()">Ver Pares</button>
                        <a target="_blank"><button type="submit" name="envio" class="btn btn-success ln" id="envio" value="Generar Reporte" onclick="avances()">Generar reporte</button></a>
                        <button name="completo" class="btn btn-success ln" id="completo" value="" onclick="okas1()" style="display: none">Lote completo</button>
                        <div><input type="checkbox" name="detallado" id="detallado" value="detallado"  />Detallado</div>
                    </div>
                </div>

                <!--<div class="row">
                        <div class="container">
                            <div class="col-sm-3">
                                Buscar Combinacion
                            <input type="text" name="buscaprodd" id="buscaprodd" class=" form-control input-sm chat-input" Onkeypress="buscacom()">
                            </div>
                            </div>
                    </div> -->    
                <div class="container-fluid" style="overflow: auto;">
                    <div class=" tablewidth-sm col-md-offset-3"  style="overflow: auto" >
                    <div class="col-md-12" style="overflow: auto;">
                        <table  id="tablesorter-demo" class="table table-hover table-responsive table-condensed table-hover jumbis" style="overflow: auto;">
                            <thead class="redondeado jumbis bodyheadpares fondos " style="overflow: auto;">
                            <td class="ln">Departamento</td>
                            <td class="ln">Pares Reportados</td>
                            </thead>
                            <tbody id="llenar" class="bodypares" style="overflow: auto;">
                            </tbody> 
                        </table>
                    </div>
                </div>
                </div>
                
                <div class="row" id="contener">                
                </div>

            </div>
        </div>
        <script type="text/javascript">
            function okas() {
                var valor = $('#f1').val();
                var valor1 = $('#f2').val();
                if (!(/^\d{2}|\d{1}\-\d{2}\-\d{4}\$/i.test(valor)) && !(/^\d{2}|\d{1}\-\d{2}\-\d{4}\$/i.test(valor1))) {
                    alert("fecha invalida invalido");
                    //document.forma.f1.focus();
                    document.getElementById("f1").value = "<%=fechac%>";
                    document.getElementById("f2").value = "<%=fechac%>";
                    return 0;
                } else {
                    var pro = $('#f1').val();
                    var pro1 = $('#f2').val();
                    var maq=$('#maq').val();
                    var uso = "fechas";
                    $.ajax({
                        type: 'post',
                        data: {f1: pro, f2: pro1,maq:maq, uso: uso},
                        url: '../Getregspares',
                        success: function (result) {
                            $('#llenar').html(result);
                            var pro = $('#f1').val();
                    var pro1 = $('#f2').val();
                    var maq=$('#maq').val();
                    var uso = "completo";
                                
                        }
                    });
                }
            }
             function okas1() {
                var valor = $('#f1').val();
                var valor1 = $('#f2').val();
                if (!(/^\d{2}|\d{1}\-\d{2}\-\d{4}\$/i.test(valor)) && !(/^\d{2}|\d{1}\-\d{2}\-\d{4}\$/i.test(valor1))) {
                    alert("fecha invalida invalido");
                    //document.forma.f1.focus();
                    document.getElementById("f1").value = "<%=fechac%>";
                    document.getElementById("f2").value = "<%=fechac%>";
                    return 0;
                } else {
                    var pro = $('#f1').val();
                    var pro1 = $('#f2').val();
                    var maq=$('#maq').val();
                    var uso = "completo";
                    $.ajax({
                        type: 'post',
                        data: {f1: pro, f2: pro1,maq:maq, uso: uso},
                        url: '../Getregspares',
                        success: function (result1) {
                            document.getElementById("contener").innerHTML=result1;
                            //$('#contener').html(result1);
                        }
                    });
                }
            }

            function avances() {
                var f1 = $('#f1').val();
                var f2 = $('#f2').val();
                var d=$('#detallado').val();
                if(document.getElementById("detallado").checked){
                    d="_det";
                }else{
                    d="";
                }
                
                var maq=$('#maq').val();
                location = 'avancespares.jsp?f1=' + f1 + '&f2=' + f2+'&maq='+maq+'&det='+d;
            }
            
            function mostrarVentanas(dep)
            {
                var depo=dep;
                var f1 = $('#f1').val();
                var f2 = $('#f2').val();
                var maq= $('#maq').val();
                var ventana = document.getElementById("miVentana");
                //ventana.style.marginTop = "100px";
                //ventana.style.left = ((document.body.clientWidth) / 2) +  "px";
                ventana.style.display = "block";
                ventana.style.left = 10 + "%";
                var uso="detalle";
                $.ajax({
                    type: 'post',
                    data: {f1: f1, f2: f2,uso:uso,dep:depo,maq:maq},
                    url: '../Getregspares',
                    success: function (result) {
                        $('#llenadodetalle').html(result);
                    }
                });
            }
                   
            function ocultarVentanas()
            {
                var ventana = document.getElementById("miVentana");
                ventana.style.display = "none";
            }
        </script>
        <div class="container" style="">
           <div id="miVentana" style="width: 80%;height: 100%; position: fixed;top: 0%; left: 10%; font-family:Verdana, Arial, Helvetica, sans-serif; font-size: 12px; font-weight: normal; color: black; display:none;overflow: scroll;background-color:rgb(248,191,22);">
            <div class=" " style="">
                <a class="btn" onclick="ocultarVentanas()"><img src="../images/right.png" width="50" height="50"></a>
                <h4 class="h4">Detalle de Departamento</h4>
                <table  id="tablesorter-demo" class="table table-hover table-responsive table-condensed table-bordered" style="overflow: scroll">
                    <thead class="redondeado" style="background-color:white; ">
                        <tr>
                            <td>Programa</td>
                            <td>Lote</td>
                            <td>Estilo</td>
                            <td>Pares</td>
                            <td>Corrida</td>
                            <td>Mes</td>
                            <td>Combinacion</td>
                            <td>Status</td>
                        </tr>
                    </thead>
                    <tbody id="llenadodetalle">
                       
                    </tbody> 
                </table>
        </div>
    </div>
        </div>
    </body>
</html>
<%
}catch(Exception e){
    out.print("location = ../index.");
}
%>