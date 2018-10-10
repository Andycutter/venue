// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require mui
//= require siema/dist/siema.min.js
//= require izitoast/dist/js/iziToast.min.js
//= require choices.js/assets/scripts/dist/choices.js
//= require cable
//= require transform_menu
//= require mui_modal
//= require image_uploader.js
//= require toast
//= require_tree ./main



const initiateSlider = (selector) => {
    App.slider = new Siema({
        selector: selector,
        duration: 2,
        easing: 'ease-out',
        perPage: 1,
        startIndex: 0,
        draggable: true,
        multipleDrag: true,
        threshold: 20,
        loop: true,
        rtl: false,
        onInit: () => { },
        onChange: () => { },
    });

    const prev = document.querySelector('.prev');
    const next = document.querySelector('.next');
    prev.addEventListener('click', () => App.slider.prev());
    next.addEventListener('click', () => App.slider.next());
}

// General method to display selector using choices.js
const showMultiSelect = (elementId, options) => {
    defaultOptions = {
        removeItemButton: true
    }

    mergedOptions = Object.assign(defaultOptions, options)
    var element = document.getElementById(elementId)
    if (element) {
        var multiSelect = new Choices(element, mergedOptions);
    }

}



document.addEventListener('turbolinks:load', () => {
    transformMenu()
    let slider = document.querySelector('.carousel');
    if (slider) {
        initiateSlider('.carousel')
    }
})
