//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require mui
//= require siema/dist/siema.min.js
//= require izitoast/dist/js/iziToast.min.js
//= require transform_menu
//= require mui_modal
//= require image_uploader.js
//= require toast
//= require_tree ./admin

document.addEventListener('turbolinks:load', () => {
    transformMenu()


    iziToast.show({
        title: 'Welcome',
        message: 'Hello admin!'
    });
})


