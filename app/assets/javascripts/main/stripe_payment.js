const registerElements = (elements, exampleName, stripe) => {
    var formClass = '.' + exampleName;
    var example = document.querySelector(formClass);

    var form = example.querySelector('form');
    var resetButton = example.querySelector('a.reset');
    var error = form.querySelector('.error');
    var errorMessage = error.querySelector('.message');

    const enableInputs = () => {
        Array.prototype.forEach.call(
            form.querySelectorAll(
                "input[type='text'], input[type='email'], input[type='tel']"
            ),
            function (input) {
                input.removeAttribute('disabled');
            }
        );
    }

    const disableInputs = () => {
        Array.prototype.forEach.call(
            form.querySelectorAll(
                "input[type='text'], input[type='email'], input[type='tel']"
            ),
            function (input) {
                input.setAttribute('disabled', 'true');
            }
        );
    }

    // Listen for errors from each Element, and show error messages in the UI.
    elements.forEach((element) => {
        element.on('change', (event) => {
            if (event.error) {
                error.classList.add('visible');
                errorMessage.innerText = event.error.message;
            } else {
                error.classList.remove('visible');
            }
        });
    });

    // Listen on the form's 'submit' handler...
    form.addEventListener('submit', (event) => {
        event.preventDefault();

        // Show a loading screen...
        example.classList.add('submitting');

        // Disable all inputs.
        disableInputs();

        // Gather additional customer data we may have collected in our form.
        var name = form.querySelector('#' + exampleName + '-name');
        var address1 = form.querySelector('#' + exampleName + '-address');
        var city = form.querySelector('#' + exampleName + '-city');
        var zip = form.querySelector('#' + exampleName + '-zip');
        var additionalData = {
            name: name ? name.value : undefined,
            address_line1: address1 ? address1.value : undefined,
            address_city: city ? city.value : undefined,
            address_zip: zip ? zip.value : undefined,
        };

        // Use Stripe.js to create a token. We only need to pass in one Element
        // from the Element group in order to create a token. We can also pass
        // in the additional customer data we collected in our form.
        stripe.createToken(elements[0], additionalData).then((result) => {
            // Stop loading!
            example.classList.remove('submitting');

            if (result.token) {
                // If we received a token, add the token as hidden field and submit the form.
                example.classList.add('submitted');
                stripeTokenHandler(result.token);
            } else {
                // Otherwise, un-disable inputs.
                enableInputs();
            }
        });
    });

    if (resetButton) {
        resetButton.addEventListener('click', (event) => {
            event.preventDefault();
            // Resetting the form (instead of setting the value to `''` for each input)
            // helps us clear webkit autofill styles.
            form.reset();

            // Clear each Element.
            elements.forEach((element) => {
                element.clear();
            });

            // Reset error state as well.
            error.classList.remove('visible');

            // Resetting the form does not un-disable inputs, so we need to do it separately:
            enableInputs();
            example.classList.remove('submitted');
        });
    }

}



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

const addEventListenersToStripeForm = () => {
    var inputs = document.querySelectorAll('.cell.example.example2 .input');
    Array.prototype.forEach.call(inputs, (input) => {
        input.addEventListener('focus', () => {
            input.classList.add('focused');
        });
        input.addEventListener('blur', () => {
            input.classList.remove('focused');
        });
        input.addEventListener('keyup', () => {
            if (input.value.length === 0) {
                input.classList.add('empty');
            } else {
                input.classList.remove('empty');
            }
        });
    });
}

const initiateStripe = (pkKey) => {
    var stripe = Stripe(pkKey);

    var elements = stripe.elements({
        fonts: [
            {
                cssSrc: 'https://fonts.googleapis.com/css?family=Source+Code+Pro',
            },
        ],
        // Stripe's examples are localized to specific languages, but if
        // you wish to have Elements automatically detect your user's locale,
        // use `locale: 'auto'` instead.
        locale: window.auto
    });

    // Floating labels
    var inputs = document.querySelectorAll('.cell.example.example2 .input');
    Array.prototype.forEach.call(inputs, function (input) {
        input.addEventListener('focus', function () {
            input.classList.add('focused');
        });
        input.addEventListener('blur', function () {
            input.classList.remove('focused');
        });
        input.addEventListener('keyup', function () {
            if (input.value.length === 0) {
                input.classList.add('empty');
            } else {
                input.classList.remove('empty');
            }
        });
    });

    var elementStyles = {
        base: {
            color: '#f9f9f9',
            fontWeight: 500,
            fontSize: '16px',
            fontSmoothing: 'antialiased',

            '::placeholder': {
                color: '#CFD7DF',
            },
            ':-webkit-autofill': {
                color: '#e39f48',
            },
        },
        invalid: {
            color: '#E25950',

            '::placeholder': {
                color: '#FFCCA5',
            },
        },
    };

    var elementClasses = {
        focus: 'focused',
        empty: 'empty',
        invalid: 'invalid',
    };

    var cardNumber = elements.create('cardNumber', {
        style: elementStyles,
        classes: elementClasses,
        placeholder: ''
    });
    cardNumber.mount('#example2-card-number');

    var cardExpiry = elements.create('cardExpiry', {
        style: elementStyles,
        classes: elementClasses,
    });
    cardExpiry.mount('#example2-card-expiry');

    var cardCvc = elements.create('cardCvc', {
        style: elementStyles,
        classes: elementClasses,
    });
    cardCvc.mount('#example2-card-cvc');

    registerElements([cardNumber, cardExpiry, cardCvc], 'example2', stripe);

    

}