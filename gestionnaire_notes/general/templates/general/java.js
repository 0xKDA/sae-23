document.addEventListener('DOMContentLoaded', function() {
    const escapeButtons = document.querySelectorAll('.escape-button');
    const nav = document.querySelector('nav');
  
    escapeButtons.forEach(button => {
      let isMoving = false; // Indicateur de déplacement du bouton
  
      // Déplacer le bouton de façon aléatoire dans un rayon de 50px
      function moveButtonRandomly() {
        if (!isMoving) {
          isMoving = true;
          const randomX = Math.random() * 100 - 50;
          const randomY = Math.random() * 100 - 50;
          button.style.left = button.offsetLeft + randomX + 'px';
          button.style.top = button.offsetTop + randomY + 'px';
        }
      }
  
      // Écouter l'événement mouseenter pour déplacer le bouton de manière aléatoire
      button.addEventListener('mouseenter', moveButtonRandomly);
  
      // Écouter l'événement mouseleave pour arrêter le déplacement du bouton
      button.addEventListener('mouseleave', () => {
        isMoving = false;
      });
    });
  });
  
