

const $btn = document.querySelector('#change');
const $pet = document.querySelector('#my-pet');

$btn.addEventListener('click', e => {
    $pet.textContent = '못난이 거북이!!';
});