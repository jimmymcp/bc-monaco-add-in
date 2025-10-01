var editor;

function SetContent(newContent) {
    if (editor) {
        editor.setValue(newContent);
    }
}

function SetLanguage(newLanguage) {
    if (editor) {
        monaco.editor.setModelLanguage(editor.getModel(), newLanguage);
    }
}