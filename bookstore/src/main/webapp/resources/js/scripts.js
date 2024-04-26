/*!
* Start Bootstrap - Shop Item v5.0.6 (https://startbootstrap.com/template/shop-item)
* Copyright 2013-2023 Start Bootstrap
* Licensed under MIT (https://github.com/StartBootstrap/startbootstrap-shop-item/blob/master/LICENSE)
*/
// This file is intentionally blank
// Use this file to add JavaScript to your project
window.addEventListener('DOMContentLoaded', event => {

    // Toggle the side navigation
    const sidebarToggle = document.body.querySelector('#sidebarToggle');
    if (sidebarToggle) {
        // Uncomment Below to persist sidebar toggle between refreshes
        // if (localStorage.getItem('sb|sidebar-toggle') === 'true') {
        //     document.body.classList.toggle('sb-sidenav-toggled');
        // }
        sidebarToggle.addEventListener('click', event => {
            event.preventDefault();
            document.body.classList.toggle('sb-sidenav-toggled');
            sidebarToggle.children[0].style.display = (sidebarToggle.children[0].style.display == "none" ? "block" : "none");
            sidebarToggle.children[1].style.display = (sidebarToggle.children[1].style.display == "none" ? "block" : "none");
            localStorage.setItem('sb|sidebar-toggle', document.body.classList.contains('sb-sidenav-toggled'));
        });
    }

});