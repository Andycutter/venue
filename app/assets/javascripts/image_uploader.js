// General method to display an image preview on the form 
const displayImagePreview = (event, uploadElement, dimension) => {
    let files = event.target.files;
    document.getElementById(`${uploadElement}-upload-message`).innerHTML = `${files.length} files added`

    var output = document.getElementById(`${uploadElement}-preview`);
    output.innerHTML = ''
    Array.from(files).forEach(file => {
        if (!file.type.match('image'))
            return;
        var picReader = new FileReader();
        picReader.addEventListener("load", event => {
            var picFile = event.target;
            var div = document.createElement("span");
            div.innerHTML = `<img style='width: auto; max-height: ${dimension}px;' src= '${picFile.result}' title='${picFile.name}'/>`;
            output.insertBefore(div, null);
        });
        picReader.readAsDataURL(file);
    })
}

const customUpload = (selector, uploadElement, dimension) => {
    var uploadButton = document.getElementById(uploadElement)
    if (uploadButton) {
        // Time for some good old fashined Spaghetti Code!
        var filesInput = document.getElementById(selector);
        uploadButton.addEventListener('click', () => {
            filesInput.click();
        })
        filesInput.addEventListener('change', event => {
            displayImagePreview(event, uploadElement, dimension)
        })
    }
}