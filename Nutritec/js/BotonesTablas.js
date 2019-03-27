var btnAlumno = document.getElementById('BtnAlumno');
var TablaBaseAlumno = document.getElementById('TablaBaseAlumno');
var TablaParaCarga = document.getElementById('TablaParaCarga');
var BtnCampos = document.getElementById('BtnCampos');
var TablaBaseCampos = document.getElementById('TablaBaseCampos');
var TablaParaCarga2 = document.getElementById('TablaParaCarga2');


btnAlumno.addEventListener('click', function(){
  TablaBaseCampos.classList.toggle('mostrar');
    TablaParaCarga2.classList.toggle('mostrar');
    TablaParaCarga.classList.toggle('ocultar');
    TablaBaseAlumno.classList.toggle('ocultar');

    
});

BtnCampos.addEventListener('click',function(){
   TablaBaseCampos.classList.toggle('mostrar');
    TablaParaCarga2.classList.toggle('mostrar');
    TablaParaCarga.classList.toggle('ocultar');
    TablaBaseAlumno.classList.toggle('ocultar');
});