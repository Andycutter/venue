const showToast = (key, value, options) => {
    let position, target
    position = options.position || 'bottomLeft'
    target = options.target || ''
    iziToast.show({
        title: key,
        message: value,
        position: position,
        theme: 'dark',
        backgroundColor: '#222020',
        zindex: 9999,
        target: target
    })
}