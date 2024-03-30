$( document ).on ('turbolinks:load',function(){
    console.log('test')
    const likeButtons = document.querySelectorAll('.like-button');
    console.log(likeButtons)
    /*likeButtons.forEach(button => {
      button.addEventListener('ajax:success', () => {
        console.log("TEST")
        button.removeAttribute('href'); // Remove the href attribute to make the link unclickable
        button.style.cursor = 'default'; // Change cursor to default to indicate that the link is unclickable
        button.removeEventListener('click', () => {}); // Remove the click event listener after clicking
        button.textContent = 'Test AJAX like';
        button.style.pointerEvents = 'none'
      });
    });*/
});

//document.querySelector('.like-button').innerHTML = 'You like this movie';