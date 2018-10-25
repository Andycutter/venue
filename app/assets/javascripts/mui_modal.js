const showPartialAsModal = (html, options) => {
    let modal = document.createElement('div');
    let color = options.backgroundColor || '#222020'
    modal.style.width = options.width;
    modal.style.height = options.height;
    modal.style.margin = '60px auto';
    modal.style.padding = '20px 20px';
    modal.style.backgroundColor = color;
    modal.style.opacity = 0.85;
    modal.innerHTML = html;

    mui.overlay('on', modal, {
        static: true
    });

    return modal;
}

const cancelModal = event => {
    event.preventDefault();
    mui.overlay('off');
}

const resizableModal = (modal, height) => {
    let originalModelHeight = modal.offsetHeight;
    var container = document.querySelector('.modal-content').firstElementChild
    var conteinerHeight = container.offsetHeight
    modal.style.height = `${conteinerHeight + height}px`;
    document.addEventListener('iziToast-opening', (data) => {
        setTimeout(null, 500);
        modal.style.height = `${modal.style.height + height}px`;
        modal.style.transition = '0.5s';
    });

    document.addEventListener('iziToast-closed', () => {
        modal.style.height = `${originalModelHeight}px`;
    });

    return;
}