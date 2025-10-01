require.config({ paths: { "vs": "https://cdnjs.cloudflare.com/ajax/libs/monaco-editor/0.52.2/min/vs/" } });

window.MonacoEnvironment = {
    getWorkerUrl: function (workerId, label) {
        return `data:text/javascript;charset=utf-8,${encodeURIComponent(`
        self.MonacoEnvironment = { baseUrl: "https://cdnjs.cloudflare.com/ajax/libs/monaco-editor/0.52.2/min/" };
        importScripts("https://cdnjs.cloudflare.com/ajax/libs/monaco-editor/0.52.2/min/vs/base/worker/workerMain.min.js");`
        )}`;
    }
};

require(["vs/editor/editor.main"], function () {
    // Create the editor with some sample JavaScript code
    editor = monaco.editor.create(document.getElementById("controlAddIn"), {
        value: "",
        language: "json"
    });

    var controlAddIn = document.getElementById("controlAddIn");
    window.addEventListener("resize", () => editor.layout({
        width: controlAddIn.offsetWidth,
        height: controlAddIn.offsetHeight
    }));

    editor.onDidChangeModelContent(() => {
        Microsoft.Dynamics.NAV.InvokeExtensibilityMethod('OnContentSubmitted', [editor.getValue()]);
    });

    Microsoft.Dynamics.NAV.InvokeExtensibilityMethod('ControlReady', []);
});