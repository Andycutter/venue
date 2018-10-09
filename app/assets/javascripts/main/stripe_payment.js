const stripeTokenHandler = (token) => {
    var form = document.getElementById('payment-form');
    var hiddenInput = document.createElement('input');
    hiddenInput.setAttribute('type', 'hidden');
    hiddenInput.setAttribute('name', 'stripeToken');
    hiddenInput.setAttribute('value', token.id);
    form.appendChild(hiddenInput);

    form.submit();
}

const activateForm = (stripe, card) => {
    var form = document.getElementById('payment-form');
    if (form) {
        form.addEventListener('submit', event => {
            event.preventDefault();
            stripe.createToken(card).then((result) => {
                if (result.error) {
                    var toast = document.querySelector('.iziToast');
                    if (toast) {
                        iziToast.hide({}, toast);
                        showToast('Error', result.error.message, { target: '#card-errors' });
                    }
                } else {
                    stripeTokenHandler(result.token);
                }
            });
        });
    }
}



const initiateStripe = (pkKey) => {
    var stripe = Stripe(pkKey);
    var elements = stripe.elements();

    var style = {
        base: {
            color: '#fff',
            lineHeight: '18px',
            fontFamily: '"Helvetica Neue", Helvetica, sans-serif',
            fontSmoothing: 'antialiased',
            fontSize: '16px',
            fontWeight: 'normal',
            '::placeholder': {
                color: 'rgb(240,215,93)'
            }
        },
        invalid: {
            color: '#fa755a',
            iconColor: '#fa755a'
        }
    };
    var cardNumber = elements.create('cardNumber', { style: style, hidePostalCode: true });

    cardNumber.mount('#card-number-element');

    var cardExpiry = elements.create('cardExpiry', { style: style, hidePostalCode: true });

    cardExpiry.mount('#card-expiry-element');

    var cardCvc = elements.create('cardCvc', { style: style, hidePostalCode: true });

    cardCvc.mount('#card-cvc-element');

    card.addEventListener('change', (event) => {
        if (event.error) {
            showToast('Error', event.error.message, { target: '#card-errors' });
        } else {
            var toast = document.querySelector('.iziToast');
            if (toast) {
                iziToast.hide({}, toast);
            }
        }
    });

    activateForm(stripe, card);

}