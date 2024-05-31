// Obtener el modal
var modal = document.getElementById("loginModal");

// Obtener el botón que abre el modal
var btn = document.getElementById("loginBtn");

// Obtener el span que cierra el modal
var span = document.getElementsByClassName("close")[0];

// Cuando el usuario haga clic en el botón, abrir el modal
btn.onclick = function() {
    modal.style.display = "block";
}

// Cuando el usuario haga clic en <span> (x), cerrar el modal
span.onclick = function() {
    modal.style.display = "none";
}

// Cuando el usuario haga clic fuera del modal, cerrarlo
window.onclick = function(event) {
    if (event.target == modal) {
        modal.style.display = "none";
    }
}
