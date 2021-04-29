var clicks = 0;
let arr = new Array(500).fill(0);
    function onClick(number, line) {
        if(arr[number]<line){
        arr[number] += 1;
        document.getElementById(number).innerHTML = arr[number];
    
        }
    };

    function onClickMinus(number, line) {
        if(arr[number]>0){
        arr[number] -= 1;
        document.getElementById(number).innerHTML = arr[number];
        }
    };

    (function main() {
        document.addEventListener('DOMContentLoaded', DOMContentLoaded);
       
        function DOMContentLoaded() {
              var buttonNode = document.querySelector('.js-show-form');
          buttonNode.addEventListener('click', showForm);
        }
          
        function showForm() {
          var node = document.querySelector('.js-form');
          node.classList.remove('hidden');
        }
      })();

   