window.addEventListener('turbolinks:load', function() {
  document.querySelectorAll("button.flash-message-delete").forEach(function(item){
    item.addEventListener("click", function(event){
      const el = event.target

      // Remove the container
      const container = el.parentElement.parentElement.parentElement
      container.remove()

      // Check whether to remove top from hero
      const numRemaining = document.querySelectorAll(".container.flash-message").length
      if (numRemaining == 0) {
        const hero = document.querySelector('.hero-section')
        if (hero) {
          hero.classList.remove('add-top')
        }
      }
    });
  });
})
