window.addEventListener('turbolinks:load', function() {
  const autofocusElement = document.querySelector('input[autofocus="autofocus"]')
  if (autofocusElement != null) {
    autofocusElement.focus()
  }

  document.querySelectorAll(".no-follow").forEach(function(item){
    item.addEventListener("click", function(event){
      event.preventDefault();
    });
  });

  // Get all "navbar-burger" elements
  const $navbarBurgers = Array.prototype.slice.call(document.querySelectorAll('.navbar-burger'), 0);
  // Check if there are any navbar burgers
  if ($navbarBurgers.length > 0) {
    // Add a click event on each of them
    $navbarBurgers.forEach( function(el) {
      el.addEventListener('click', function() {

        // Get the target from the "data-target" attribute
        const target = el.dataset.target;
        const $target = document.getElementById(target);

        // Toggle the "is-active" class on both the "navbar-burger" and the "navbar-menu"
        el.classList.toggle('is-active');
        $target.classList.toggle('is-active');
      });
    });
  }
});
