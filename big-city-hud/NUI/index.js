window.addEventListener('message', (event) => {
    const data = event.data;

    if (data.type === 'player') {
        document.getElementById('money-imput').textContent = data.imputmoney;
    }
});

window.addEventListener('message', (event) => {
    const data = event.data;

    if (data.type === 'status') {
        document.getElementById('imput-healt').textContent = data.imputhealt;
        document.getElementById('imput-stamina').textContent = data.imputstamina;
    }
});




$(function () {
    function display(bool) {
        if (bool) {
            $("#info").fadeIn(300);
        } else {
            $("#info").fadeOut(1);
        }
    };

    display(false)

    window.addEventListener("message", function(event) {
        var item = event.data;
        if (item.type === "ui") {
            if (item.status == true) {
                display(true)
            } else {
                display(false)
            }
        }
    })
});

window.addEventListener('message', (event) => {
    const data = event.data;

    if (data.type === 'thirst') {

        document.getElementById('imput-thirst').textContent = data.imputthirst ;
    }
});

window.addEventListener('message', (event) => {
    const data = event.data;

    if (data.type === 'hunger') {
        document.getElementById('imput-hunger').textContent = data.imputhunger;
    }
});