//===============================================================
function validarSoloNumerico(e) {
    // Revisado por CESAR YENQUE.
    tecla = (document.all) ? e.keyCode : e.which; // 2
    if (tecla == 8) return true; // 3
    patron = /\d/; // Solo acepta números
    te = String.fromCharCode(tecla); // 5
    return patron.test(te); // 6
}
function validarSoloNumericoDecimales(e) {
    // Revisado por CESAR YENQUE.
    tecla = (document.all) ? e.keyCode : e.which; // 2
    if (tecla == 8) return true; // 3
    //patron = /\d/; // Solo acepta números
    patron = /[0-9.]/;
    te = String.fromCharCode(tecla); // 5
    return patron.test(te); // 6
}
function validarSoloLetras(e) {
    tecla = (document.all) ? e.keyCode : e.which;    
    if (tecla == 8) return true;
    if (tecla == 32) return true;
    if (tecla == 241) return true;
    patron = /[A-Za-z]/;
    te = String.fromCharCode(tecla);
    return patron.test(te);
}
function ValidarAlfanumerico(e) {
    tecla = (document.all) ? e.keyCode : e.which;    
    if (tecla == 8) return true;
    if (tecla == 32) return true;
    if (tecla == 45) return true;
    patron = /\w/; // Acepta números y letras
    te = String.fromCharCode(tecla);
    return patron.test(te);
}
function validarSoloFecha(e) {
    tecla = (document.all) ? e.keyCode : e.which; // 2
    if (tecla == 8) return true; // 3
    if (tecla == 47) return true; // 3 '47 ==> /'
    patron = /\d/; // Solo acepta números
    te = String.fromCharCode(tecla); // 5
    return patron.test(te); // 6
}
function validarSoloNumericoHasta5(e) {
    // Revisado por CESAR YENQUE.
    tecla = (document.all) ? e.keyCode : e.which; // 2
    if (tecla == 8) return true; // 3
    patron = /[0-5]/; // Solo acepta números
    te = String.fromCharCode(tecla); // 5
    return patron.test(te); // 6
}
//===============================================================
function mostrarMensaje() {
    if (document.getElementById('txtMensajes').value != '') {
        alert(document.getElementById('txtMensajes').value);
        document.getElementById('txtMensajes').value = '';
    }
}
//===============================================================
function cargarUbigeo() {
    document.forms[0].submit();
}
function cargarDato() {
    document.forms[0].submit();
}
//===============================================================
// GRILLA
function Resaltar_On(GridView) {
    if (GridView != null) {
        GridView.originalBgColor = GridView.style.backgroundColor;
        GridView.style.backgroundColor = '#86EEF7';
    }
}
function Resaltar_Off(GridView) {
    if (GridView != null) {
        GridView.style.backgroundColor = GridView.originalBgColor;
    }
}
function confirmacion() {
    if (confirm('¿Esta seguo de eliminar.?')) {
        // Respuesta afirmativa...
        alert('Presiono OK.');
        document.forms[0].txtAccion.value = "E";
    }
}
function regresar(valor) {
    //top.window.location.replace("listadoHistoriaClinica.aspx"); 
    //alert('ok');
    top.window.location.replace(valor);
}
//===============================================================
function validateFechaActual(condicion, obj, content) {
    //***********************************************************************//
    //        alert('ok');
    //        alert(condicion);
    //        alert(obj);
    //        alert(content);
    var fecha = new Date();
    var diames = fecha.getDate().toString();
    //var diasemana=fecha.getDay();
    var mes = (fecha.getMonth() + 1).toString();
    if (mes.length == 1) {
        mes = '0' + mes;
    }
    var ano = fecha.getFullYear().toString();
    var fechaActual = ano + mes + diames;
    //***********************************************************************//
    var fechaEntrada = content.split('/');
    var vFecha = fechaEntrada[2] + fechaEntrada[1] + fechaEntrada[0];
    //***********************************************************************//
    if (condicion == '1') {
        if (vFecha > fechaActual) {
            document.getElementById('ctl00$ContentPlaceHolder1$' + obj).value = '';
        }
    }
    if (condicion == '2') {
        if (vFecha > fechaActual) {
            document.getElementById(obj).value = '';
        }
    }
    //***********************************************************************//
}
function fechaDesdeHastaFechaActual(validacion, objDesde, objDestino, valor, condicion, contexto, conFDesdeFHasta) {
    //************************************************************************************************************//
    if (validacion == 'objDesde') { validateFechaActual(condicion, objDesde, contexto); }
    if (validacion == 'objHasta') { validateFechaActual(condicion, objDestino, contexto); }
    //************************************************************************************************************//
    if (validacion == 'objDesde' && condicion == '1') {
        if (document.getElementById('ctl00$ContentPlaceHolder1$' + objDesde).value != '') { fechaDesdeHastaCondicion(objDesde, objDestino, valor, condicion, conFDesdeFHasta); }
    }
    if (validacion == 'objDesde' && condicion == '2') {
        if (document.getElementById(objDesde).value != '') { fechaDesdeHastaCondicion(objDesde, objDestino, valor, condicion, conFDesdeFHasta); }
    }
    //************************************************************************************************************//    
    if (validacion == 'objHasta' && condicion == '1') {
        if (document.getElementById('ctl00$ContentPlaceHolder1$' + objDestino).value != '') { fechaDesdeHastaCondicion(objDesde, objDestino, valor, condicion, conFDesdeFHasta); }
    }
    if (validacion == 'objHasta' && condicion == '2') {
        if (document.getElementById(objDestino).value != '') { fechaDesdeHastaCondicion(objDesde, objDestino, valor, condicion, conFDesdeFHasta); }
    }
    //************************************************************************************************************//    
}
function fechaDesdeHastaCondicion(objDesde, objHasta, valor, condicion, conFDesdeFHasta) {
    //************************************************************************************************************//
    if (condicion == '1') { fechaDesde = document.getElementById('ctl00$ContentPlaceHolder1$' + objDesde).value; }
    if (condicion == '2') { fechaDesde = document.getElementById(objDesde).value; }
    afechaDesde = fechaDesde.split('/');
    fechaDesde = afechaDesde[2] + afechaDesde[1] + afechaDesde[0];
    //************************************************************************************************************//    
    if (condicion == '1') { afechaHasta = document.getElementById('ctl00$ContentPlaceHolder1$' + objHasta).value.split('/'); }
    if (condicion == '2') { afechaHasta = document.getElementById(objHasta).value.split('/'); }
    fechaHasta = afechaHasta[2] + afechaHasta[1] + afechaHasta[0];
    //************************************************************************************************************//
    if (valor == 'D') {
        if (fechaDesde >= fechaHasta) {
            if (condicion == '1') { document.getElementById('ctl00$ContentPlaceHolder1$' + objDesde).value = document.getElementById('ctl00$ContentPlaceHolder1$' + objDesde).value; }
            if (condicion == '2') { document.getElementById(objDesde).value = document.getElementById(objDesde).value; }
        } else {
            if (condicion == '1') { document.getElementById('ctl00$ContentPlaceHolder1$' + objDesde).value = ''; }
            if (condicion == '2') { document.getElementById(objDesde).value = ''; }
        }
    } else {
        if (conFDesdeFHasta == '1') {
            if (fechaHasta >= fechaDesde) {
                if (condicion == '1') { document.getElementById('ctl00$ContentPlaceHolder1$' + objHasta).value = document.getElementById('ctl00$ContentPlaceHolder1$' + objHasta).value; }
                if (condicion == '2') { document.getElementById(objHasta).value = document.getElementById(objHasta).value; }
            } else {
                if (condicion == '1') { document.getElementById('ctl00$ContentPlaceHolder1$' + objHasta).value = ''; }
                if (condicion == '2') { document.getElementById(objHasta).value = ''; }
            }
        }
        if (conFDesdeFHasta == '2') {
            if (fechaDesde >= fechaHasta) {
                if (condicion == '1') { document.getElementById('ctl00$ContentPlaceHolder1$' + objHasta).value = document.getElementById('ctl00$ContentPlaceHolder1$' + objHasta).value; }
                if (condicion == '2') { document.getElementById(objHasta).value = document.getElementById(objHasta).value; }
            } else {
                if (condicion == '1') { document.getElementById('ctl00$ContentPlaceHolder1$' + objHasta).value = ''; }
                if (condicion == '2') { document.getElementById(objHasta).value = ''; }
            }
        }
    }
}
function fechaDesdeHasta(objDesde, objDestino, valor) {
    if (valor == 'D') {
        document.getElementById('ctl00$ContentPlaceHolder1$' + objDesde).value = obj.value;
    } else {
        fechaDesde = document.getElementById('ctl00$ContentPlaceHolder1$' + objDesde).value;
        afechaDesde = fechaDesde.split('/');
        fechaDesde = afechaDesde[2] + afechaDesde[1] + afechaDesde[0];
        //alert(fechaDesde);

        afechaHasta = objHasta.value.split('/');
        fechaHasta = afechaHasta[2] + afechaHasta[1] + afechaHasta[0];
        //alert(fechaHasta);

        if (fechaHasta >= fechaDesde) {
            document.getElementById('ctl00$ContentPlaceHolder1$' + objDesde).value = obj.value;
        } else {
            document.getElementById(objDesde).value = '';
        }
    }
}
function unfechaDesdeHasta(obj, objDestino, valor) {
    if (valor == 'D') {
        document.getElementById(objDestino).value = obj.value;
    } else {
        fechaDesde = document.getElementById('txtFDesde').value;
        afechaDesde = fechaDesde.split('/');
        fechaDesde = afechaDesde[2] + afechaDesde[1] + afechaDesde[0];
        //alert(fechaDesde);

        afechaHasta = obj.value.split('/');
        fechaHasta = afechaHasta[2] + afechaHasta[1] + afechaHasta[0];
        //alert(fechaHasta);

        if (fechaHasta > fechaDesde) {
            document.getElementById(objDestino).value = obj.value;
        } else {
            document.getElementById('txtFechaHasta').value = '';
        }
    }
}
function fecha(obj, objDestino) {
    document.getElementById(objDestino).value = obj.value;
}
//===============================================================
function esDigito(sChr) {
    var sCod = sChr.charCodeAt(0);
    return ((sCod > 47) && (sCod < 58));
}
function finMes(oTxt) {
    var nMes = parseInt(oTxt.value.substr(3, 2), 10);
    var nRes = 0;
    switch (nMes) {
        case 1: nRes = 31; break;
        case 2: nRes = 29; break;
        case 3: nRes = 31; break;
        case 4: nRes = 30; break;
        case 5: nRes = 31; break;
        case 6: nRes = 30; break;
        case 7: nRes = 31; break;
        case 8: nRes = 31; break;
        case 9: nRes = 30; break;
        case 10: nRes = 31; break;
        case 11: nRes = 30; break;
        case 12: nRes = 31; break;
    }
    return nRes;
}
function valDia(oTxt) {
    var bOk = false;
    alert('Dia1 ' + bOk);
    var nDia = parseInt(oTxt.value.substr(0, 2), 10);
    bOk = bOk || ((nDia >= 1) && (nDia <= finMes(oTxt)));
    alert('Dia2 ' + bOk);
    return bOk;
}
function valMes(oTxt) {
    var bOk = false;
    alert('Mes1 = ' + bOk);
    var nMes = parseInt(oTxt.value.substr(3, 2), 10);
    bOk = bOk || ((nMes >= 1) && (nMes <= 12));
    alert('Mes2 = ' + bOk);
    return bOk;
}
function valAno(oTxt) {
    alert('oTxt1 = ' + oTxt);
    var bOk = true;
    alert('Ano1 chivi = ' + bOk);
    alert('oTxt2 = ' + oTxt.value.substr(6));
    var nAno = oTxt.value.substr(6);
    alert('nAno = ' + nAno);
    bOk = bOk && ((nAno.length == 2) || (nAno.length == 4));
    alert('Ano2 = ' + bOk);
    if (bOk) {
        for (var i = 0; i < nAno.length; i++) {
            bOk = bOk && esDigito(nAno.charAt(i));
        }
    }
    alert('Ano4 = ' + bOk);
    return bOk;
}
function valSep(oTxt) {
    var bOk = false;
    bOk = bOk || ((oTxt.value.charAt(2) == "-") && (oTxt.value.charAt(5) == "-"));
    bOk = bOk || ((oTxt.value.charAt(2) == "/") && (oTxt.value.charAt(5) == "/"));
    return bOk;
}
function valFecha(oTxt) {
    alert('ENtro a ValFecha');
    var bOk = true;
    alert(bOk);
    if (oTxt.value != '') {
        alert('Entro al IF FECHA');
        bOk = bOk && (valAno(oTxt));
        alert('Ano FECHA = ' + bOk);
        bOk = bOk && (valMes(oTxt));
        alert('Mes FECHA = ' + bOk);
        bOk = bOk && (valDia(oTxt));
        alert('Dia FECHA = ' + bOk);
        bOk = bOk && (valSep(oTxt));
        alert('Sep FECHA = ' + bOk);
        alert(bOk);
        if (!bOk) {
            alert('Fecha inválida');
            oTxt.value = '';
            oTxt.focus();
        }
        return bOk;
    }
}
//===============================================================
// Validar Fecha Peru :: Cesar Yenque.
function validaFechaPeru(oTxt) {
    // dd/mm/aaaa
    var Fecha = new String(oTxt);
    // Cadena Año
    var Ano = new String(Fecha.substring(Fecha.lastIndexOf("/") + 1, Fecha.length));
    // Cadena Mes
    var Mes = new String(Fecha.substring(Fecha.indexOf("/") + 1, Fecha.lastIndexOf("/")));   
    // Cadena Día
    var Dia = new String(Fecha.substring(0, Fecha.indexOf("/")));   
  
    // Valido el año   
    if (isNaN(Ano) || Ano.length<4 || parseFloat(Ano)<1900){
        alert('Año inválido');
        return false;   
    }   
    // Valido el Mes   
    if (isNaN(Mes) || parseFloat(Mes)<1 || parseFloat(Mes)>12){
        alert('Mes inválido');
        return false;   
    }   
    // Valido el Dia   
    if (isNaN(Dia) || parseInt(Dia, 10)<1 || parseInt(Dia, 10)>31){
        alert('Día inválido');
        return false;
    }   
    if (Mes==4 || Mes==6 || Mes==9 || Mes==11 || Mes==2) {   
        if (Mes==2 && Dia > 28 || Dia>30) {
            alert('Día inválido');
            return false;
        }
    }
    return true;
}
//===============================================================
function ValidarCampos() {
    if (document.frmRegTBP.txtRazSoc.value == '') {
        alert('Debe ingresar el nombre del Distribuidor');
        document.frmRegTBP.txtRazSoc.focus();
        return false;
    }
    if (document.frmRegTBP.txtDireccion.value == '') {
        alert('Debe ingresar la Direccion');
        document.frmRegTBP.txtDireccion.focus();
        return false;
    }
    if (document.frmRegTBP.cboDepartamento.value == '0') {
        alert('Debe seleccionar un Departamento');
        document.frmRegTBP.cboDepartamento.focus();
        return false;
    }
    if (document.frmRegTBP.cboProvincia.value == '0') {
        alert('Debe seleccionar una Provincia');
        document.frmRegTBP.cboProvincia.focus();
        return false;
    }
    if (document.frmRegTBP.cboDistrito.value == '0') {
        alert('Debe seleccionar un Distrito');
        document.frmRegTBP.cboDistrito.focus();
        return false;
    }
    if (document.frmRegTBP.txtTelefonos.value == '') {
        alert('Debe ingresar el Telefono');
        document.frmRegTBP.txtTelefonos.focus();
        return false;
    }

    if (document.frmRegTBP.txtNumEmp.value == '') {
        alert('Debe seleccionar el Numero m\xe1ximo de Empresas');
        document.frmRegTBP.txtNumEmp.focus();
        return false;
    }
    if (document.frmRegTBP.txtNumUsu.value == '') {
        alert('Debe seleccionar el Numero m\xe1ximo de Usuarios');
        document.frmRegTBP.txtNumUsu.focus();
        return false;
    }
    if (document.frmRegTBP.txtNumEmp.value == '0') {
        alert('El Numero m\xe1ximo de Empresas no puede ser cero');
        document.frmRegTBP.txtNumEmp.focus();
        return false;
    }
    if (document.frmRegTBP.txtNumUsu.value == '0') {
        alert('El Numero m\xe1ximo de Usuarios no puede ser cero');
        document.frmRegTBP.txtNumUsu.focus();
        return false;
    }
    /*if(document.frmRegTBP.hidUsuResponsable.value =='')//--DVO: El campo oculto que contiene el LOGINNT
    {	alert('Tiene que ingresar el usuario');
    //document.frmRegTBP.txtNumUsu.focus();	
    return false;
    }*/


    return true;
}
function VerificarTelefono(e) {
    if (!e) e = window.event;
    if (e.type == "keypress") {
        tecla = (document.all) ? e.keyCode : e.which;
        if (tecla == 8) return true; //Tecla de retroceso (para poder borrar) 
        patron = /[0-9-]/; //Solo acepta n\xfameros 
        te = String.fromCharCode(tecla);
        return patron.test(te);
    }
    else
        return false;
}
function validarEmail(e) {
    ok = "1234567890qwertyuiop[]asdfghjklzxcvbnm.@-_QWERTYUIOPASDFGHJKLZXCVBNM";
    for (i = 0; i < e.length; i++) {
        if (ok.indexOf(e.charAt(i)) < 0) {
            return (false);
        }
    }
    re = /(@.*@)|(\.\.)|(^\.)|(^@)|(@$)|(\.$)|(@\.)/;
    re_two = /^.+\@(\[?)[a-zA-Z0-9\-\.]+\.([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
    if (!e.match(re) && e.match(re_two)) {
        return (-1);
    }
}
function isEmail(theElement){
	var s = theElement.value;
	var filter=/^[A-Za-z][A-Za-z0-9_]*@[A-Za-z0-9_]+\.[A-Za-z0-9_.]+[A-za-z]$/;
	if (s.length == 0 ) return true;
	if (filter.test(s))
		return true;
	else		
		return false;
}
function validarEmailj(valor) {
    if (/^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/.test(valor)) {
        //alert('La dirección de email ' + valor + ' es correcta.');
        return (true);
    } else {
        alert('La dirección de email es incorrecta.');
        return (false);
    }
}
//===============================================================
//VALIDACION DEL DNI
function ValidaDNI(control,campo,vacio){
	var sCad;
	eval( "sCad=" + control + ".value");
	sCad=trim(sCad);

	if ((sCad == null) || (sCad.length == 0)&&(!vacio)){
		eval("" + control + ".select()");
		alert( campo + ' no esta completo ');
		return false;
	}

	if ((sCad.length == 0)&&(vacio)){
		return true;
	}

	if (!ValidaNumero(control,campo,vacio)) return;

	if (sCad.length!=8){
		eval("" + control + ".value=" + sCad + "");	
		eval("" + control + ".select()");
		alert( campo + ' no esta completo ');
		return false;
	}
	return true;
}
//VALIDACION DEL PASAPORTE
function ValidaPAS(control,campo,vacio){
	var sCad;
	eval( "sCad=" + control + ".value");
	sCad=trim(sCad);

	if ((sCad == null) || (sCad.length == 0)&&(!vacio)){
		eval("" + control + ".select()");
		alert( campo + ' no esta completo ');
		return false;
	}

	if ((sCad.length == 0)&&(vacio)){
		return true;
	}

	if (!ValidaNumero(control,campo,vacio)) return;

	if (sCad.length<10) {
		sCad = "0000000000" + sCad;
		sCad = sCad.substr(sCad.length-10);
		eval(control + ".value='"+sCad+"'");
	}
	return true;
}

//VALIDACION DEL CARNÉ DE FUERZAS ARMADAS
function ValidaFA(control,campo,vacio){
	var sCad;
	eval( "sCad=" + control + ".value");
	sCad=trim(sCad);

	if ((sCad == null) || (sCad.length == 0)&&(!vacio)){
		eval("" + control + ".select()");
		alert( campo + ' no esta completo ');
		return false;
	}

	if ((sCad.length == 0)&&(vacio)){
		return true;
	}

	if (!ValidaAlfaNumM(control,campo,vacio)) return;

	if (sCad.length<8) {
		sCad = "00000000" + sCad;
		sCad = sCad.substr(sCad.length-8);
		eval(control + ".value='"+sCad+"'");
	}
		
	return true;
}

//VALIDACION DEL CARNÉ de FUERZAS POLICIALES
function ValidaFP(control,campo,vacio){
	var sCad;
	eval( "sCad=" + control + ".value");
	sCad=trim(sCad);

	if ((sCad == null) || (sCad.length == 0)&&(!vacio)){
		eval("" + control + ".select()");
		alert( campo + ' no esta completo ');
		return false;
	}

	if ((sCad.length == 0)&&(vacio)){
		return true;
	}

	if (!ValidaAlfaNumM(control,campo,vacio)) return;

	if (sCad.length<8) {
		sCad = "00000000" + sCad;
		sCad = sCad.substr(sCad.length-8);
		eval(control + ".value='"+sCad+"'");
	}
	return true;
}

//VALIDACION DEL CARNÉ DE EXTRANJERIA
function ValidaEXTR(control,campo,vacio){
	var sCad,nCad;
	eval( "sCad=" + control + ".value");
	sCad=trim(sCad);

	if ((sCad == null) || (sCad.length == 0)&&(!vacio)){
		eval("" + control + ".select()");
		alert( campo + ' no esta completo ');
		return false;
	}

	if ((sCad.length == 0)&&(vacio)){
		return true;
	}

	if (sCad.length!=7){
		eval("" + control + ".select()");
		alert( campo + ' no esta completo ');
		return false;
	}

	nCad = sCad.substr(1);
	if(sCad.substr(0,1)!="N") {
		alert( campo + ' Debe empezar con N ');
		return false;
	}


	eval("" + control + ".value='" + nCad + "'");	

	if (!ValidaNumero(control,campo,vacio)) {
		eval("" + control + ".value='" + sCad + "'");	
		return false;
	}

	eval("" + control + ".value='" + sCad + "'");	
	return true;
}

//VALIDACION DEL RUC
function ValidaRUC(control,campo,vacio) 
{	var sCad;	
	var car; 
	var cont;
	var resto;
	eval( "sCad=" + control + ".value");
	sCad=trim(sCad);
		
	if ((sCad == null) || (sCad.length == 0)&&(!vacio)){
		eval("" + control + ".select()");
		alert( campo + ' no esta completo ');
		return false;
	}

	if ((sCad.length == 0)&&(vacio)){
		return true;
	}

	
	if (!ValidaNumero(control,campo,vacio)) return;

	if (sCad.length!=11){
		eval("" + control + ".value=" + sCad + "");	
		eval("" + control + ".select()");
		alert( campo + ' no esta completo ');
		return false;
	}
	
	cont=0;
	total=0;
	while (sCad.length>0){
		cont+=1;		
		car=sCad.substr(0,1);
		sCad=sCad.substr(1,sCad.length);
		switch(cont){
		case 1 : total += parseInt(car)*5;
				 break;
		case 2 : total += parseInt(car)*4;
				 break;
		case 3 : total += parseInt(car)*3;
				 break;
		case 4 : total += parseInt(car)*2;
				 break;
		case 5 : total += parseInt(car)*7;
				 break;
		case 6 : total += parseInt(car)*6;
				 break;
		case 7 : total += parseInt(car)*5;
				 break;
		case 8 : total += parseInt(car)*4;
				 break;
		case 9 : total += parseInt(car)*3;
				 break;
		case 10 : total += parseInt(car)*2;
				 break;		
			}					
	}
	resto = total % 11
	valor = 11 - resto
	switch(valor){
		case 11 : verificador = 1
				break;
		case 10 : verificador = 0
				break;
		default : verificador = valor;
				break;				
	}
	if (verificador == parseInt(car))
		return true;
	else{
		eval("" + control + ".select()");
		alert('' +  campo + ' no es un numero de RUC válido');
		return false;			
	}
}
//===============================================================
//
function NumerosDecimales(sender, intNumDecimal) {
    var strValor = sender.value;
    var intPosPunto = 0;
    var strParteDecimal = "";
    var charCode = (event.charCode) ? event.charCode : ((event.which) ? event.which : event.keyCode);

    if ((charCode < 48 || charCode > 57) && charCode != 46) {
        status = "Ingresó un valor errado";
        return false;
    }
    else {
        if (charCode == 46) {
            if (strValor.indexOf(".") != -1) {
                status = "Ingresó un valor errado";
                return false;
            }
        }
        else {
            if ((intPosPunto = strValor.indexOf(".")) != -1) {
                strParteDecimal = strValor.substr((intPosPunto + 1), strValor.length)
                if (strParteDecimal.length == intNumDecimal)
                    return false;
            }
        }
        status = "";
        return true;
    }
}
//===============================================================
//****** Calculos Separacion ******//
function calcularTasaInteresMensual(){
    var tasaAnual = parseFloat(document.getElementById("ctl00_ContentPlaceHolder1_txtTasaAnual").value) / 100;
    var tasaMensual = Math.pow((1 + tasaAnual), (30 / 360)) - 1;
    document.getElementById("ctl00_ContentPlaceHolder1_hdfTasaAnual").value = redondear(tasaMensual, 6);
    document.getElementById("ctl00_ContentPlaceHolder1_txtTasaMensual").value = redondear(tasaMensual * 100, 2);

    var deuda = document.getElementById("ctl00_ContentPlaceHolder1_lblCtaInicialFormaPagoCronograma").innerHTML;
    deuda = deuda.replace(",", "");
//    var interes = deuda * tasaMensual;        
    var cuotaInicial = deuda * (tasaMensual / (1 - Math.pow((1 + tasaMensual),-24)));

    document.getElementById("ctl00_ContentPlaceHolder1_hdfCuotaInicial").value = redondear(cuotaInicial,2);
//    document.getElementById("ctl00_ContentPlaceHolder1_txtNroCtaDivirCronograma").value = redondear(cuotaInicial,2);
//    document.getElementById("ctl00_ContentPlaceHolder1_hdfInteres").value = interes;    
}
function CalculaFinanciamiento() {

    var MontoPrf = document.getElementById("ctl00_ContentPlaceHolder1_lblMonto").innerHTML
    MontoPrf = MontoPrf.replace(",", "");

    var MontoIni = document.getElementById("ctl00$ContentPlaceHolder1$txtMontoInicial").value

    MontoIni = MontoIni.replace(",", "");
    MontoIni = MontoIni.replace("_", "");
    MontoIni = MontoIni.replace("__", "");
    MontoIni = MontoIni.replace("__,", "");
    MontoIni = MontoIni.replace(".__", ".0");

    var dbl_MtoSdo = MontoPrf - MontoIni;

    dbl_MtoSdo = redondear(dbl_MtoSdo, 2);

    dbl_MtoSdo = dar_formato(dbl_MtoSdo);

    //document.getElementById("ctl00_ContentPlaceHolder1_lblSaldoFinanciar").innerHTML = dbl_MtoSdo;
    document.getElementById("ctl00$ContentPlaceHolder1$txtSaldoFinanciar").value = dbl_MtoSdo;

}
function CalculaCuota() {
    // valor cuota
    var int_NumAno = document.getElementById("ctl00$ContentPlaceHolder1$txtNroAños").value * 12;
    var dbl_TasInt = document.getElementById("ctl00$ContentPlaceHolder1$txtTasaInteres").value;
    dbl_TasInt = dbl_TasInt.replace(",", "");

    //var dbl_Fin = document.getElementById("ctl00_ContentPlaceHolder1_lblSaldoFinanciar").innerHTML;
    var dbl_Fin = document.getElementById("ctl00$ContentPlaceHolder1$txtSaldoFinanciar").value;
    dbl_Fin = dbl_Fin.replace(",", "");

    if (int_NumAno == 0 || dbl_TasInt == 0 || dbl_Fin <= 0) {
        dbl_MtoCuo = 0;
    }
    else {
        dbl_MtoCuo = Calcula_CuotaMensual(dbl_Fin, dbl_TasInt, int_NumAno);
        dbl_MtoCuo = dar_formato(dbl_MtoCuo);
    }

    //document.getElementById("ctl00_ContentPlaceHolder1_lblValorCuota").innerHTML = dbl_MtoCuo;
    document.getElementById("ctl00$ContentPlaceHolder1$txtValorCuota").value = dbl_MtoCuo;
    document.getElementById("ctl00$ContentPlaceHolder1$hdfValorCuota").value = dbl_MtoCuo;
}
function CalculaPorcentaje() {
    var MontoPrf = document.getElementById("ctl00_ContentPlaceHolder1_lblMontFinal").innerHTML
    MontoPrf = MontoPrf.replace(",", "");
    var MontoIni = document.getElementById("ctl00$ContentPlaceHolder1$txtCuotaInicial").value
    var NuevoInicial = MontoPrf * (MontoIni / 100);
    var num = redondear(NuevoInicial, 2);
    var Financiamiento = MontoPrf - num;
    var num1 = redondear(Financiamiento, 2);
    num1 = dar_formato(num1);
    document.getElementById("ctl00$ContentPlaceHolder1$txtMontoInicial").value = Number(num).toLocaleString();
    //document.getElementById("ctl00_ContentPlaceHolder1_lblSaldoFinanciar").innerHTML = num1;
    document.getElementById("ctl00$ContentPlaceHolder1$txtSaldoFinanciar").value = num1;
    document.getElementById("ctl00$ContentPlaceHolder1$hdfSaldoFinanciar").value = num1;    
}
function redondear(cantidad, decimales) {
    decimales = (!decimales ? 2 : decimales);
    return Math.round(cantidad * Math.pow(10, decimales)) / Math.pow(10, decimales);
}
function dar_formato(num) {
    var cadena = ""; var aux;
    var cont = 1, m, k;
    if (num < 0) aux = 1; else aux = 0;
    num = num.toString();
    var blnIndDot = false;
    if (num.indexOf(".") != -1)
        blnIndDot = true;
    for (m = num.length - 1; m >= 0; m--) {
        cadena = num.charAt(m) + cadena;
        if (!blnIndDot) {
            if (cont % 3 == 0 && m > aux) cadena = "," + cadena; else cadena = cadena;
            if (cont == 3) cont = 1; else cont++;
        }
        if (num.charAt(m) == ".")
            blnIndDot = false;
    }
    if (cadena.indexOf(".") == -1)
        cadena = cadena + ".00"
    //cadena = cadena.replace(/.,/,",");  
    return cadena;
}
function Calcula_CuotaMensual(dbl_MtoSdo, dbl_TasInt, int_NumAno) {
    var dblFactor = Math.pow((dbl_TasInt / 100 + 1), (1 / 12));
    var dblPriFac = Math.pow(dblFactor, int_NumAno);
    var dblSegFac = dblFactor - 1;
    var dblCuaFac = Math.pow(dblFactor, int_NumAno) - 1;

    var dblCuota = dbl_MtoSdo * (dblPriFac * dblSegFac / dblCuaFac);

    return redondear(dblCuota, 2);
}
function Calcula_CuotaMensual_SimuladorCta(dbl_MtoSdo, dbl_TasInt, int_NumAno) {
    var dblCuota = dbl_MtoSdo * ((dbl_TasInt / 100) / (1 - Math.pow((1 + (dbl_TasInt / 100)), -int_NumAno)));
    return redondear(dblCuota, 2);
}