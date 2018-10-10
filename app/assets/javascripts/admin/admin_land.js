const featureUpdateHandler = (event) => {
    let table, rowIndex
    showToast('Notice', event.detail[0].message, {})
    table = document.getElementById('campaign-list')
    rowIndex = event.target.parentElement.parentElement.rowIndex
    table.deleteRow(rowIndex)
    table.insertAdjacentHTML('beforeend', event.detail[0].html)
    observeFeatureButtons();
}

const observeFeatureButtons = () => {
    buttons = document.querySelectorAll('.feature-btn')
    if (buttons) {
        Array.from(buttons).forEach(button => {
            button.addEventListener('ajax:success', featureUpdateHandler)
        })
    }
}