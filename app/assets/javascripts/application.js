//= require jquery
//= require bootstrap-sprockets

import "bootstrap";

document.addEventListener("turbolinks:load", () => {
  $('[data-toggle="tooltip"]').tooltip()
  $('[data-toggle="popover"]').popover()
})
