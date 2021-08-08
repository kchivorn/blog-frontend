let alertMessages = document.getElementsByClassName('alert');
setTimeout(() => {
  for (const alert of alertMessages) {
    alert.style.visibility = 'hidden';
  }
}, 3000);
