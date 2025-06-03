// This JavaScript file provides a function to capture a snapshot of the current page using html2canvas.

function captureSnapshotAndUpload() {
    html2canvas(document.body, { useCORS: true, proxy: 'http://localhost:5229/' }).then(canvas => { // Configured html2canvas to use the correct base URL
        canvas.toBlob(blob => {
            const formData = new FormData();
            formData.append('file', blob, 'snapshot.png');

            fetch('http://localhost:5229/api/snapshot/upload', {
                method: 'POST',
                body: formData
            })
            .then(response => response.json())
            .then(data => {
                console.log('Snapshot uploaded:', data);
            })
            .catch(error => {
                console.error('Error uploading snapshot:', error);
            });
        });
    });
}
