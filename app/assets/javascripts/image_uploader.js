// General method to display an image preview on the form 
const displayImagePreview = (event, uploadElement, dimension) => {
    var files = event.target.files;
    document.getElementById(`${uploadElement}-upload-message`).innerHTML = `${files.length} files added`

    var output = document.getElementById(`${uploadElement}-preview`);
    output.innerHTML = ''
    for (var i = 0; i < files.length; i++) {
        var file = files[i];
        if (!file.type.match('image'))
            continue;
        var picReader = new FileReader();
        picReader.addEventListener("load", function (event) {
            var picFile = event.target;
            var div = document.createElement("span");
            div.innerHTML = `<img style='width: auto; max-height: ${dimension}px;' src= '${picFile.result}' title='${picFile.name}'/>`;
            output.insertBefore(div, null);
        });
        picReader.readAsDataURL(file);
    }
}

const customUpload = (selector, uploadElement, dimension) => {
    var uploadButton = document.getElementById(uploadElement)
    if (uploadButton) {
        // Time for some good old fashined Spaghetti Code!
        var filesInput = document.getElementById(selector);
        uploadButton.addEventListener('click', () => {
            filesInput.click();
        })
        filesInput.addEventListener('change', function (event) {
            displayImagePreview(event, uploadElement, dimension)
        })
    }
}