// Used to toggle the menu on smaller screens when clicking on the menu button
function openNav() {
    const x = document.getElementById("navDemo");
    if (x.className.indexOf("w3-show") === -1) {
        x.className += " w3-show";
    } else {
        x.className = x.className.replace(" w3-show", "");
    }
}

function detectApplePlatform() {
    const ua = navigator.userAgent;

    console.log(ua)

    if (/iPhone/.test(ua)) return true;
    if (/iPad/.test(ua)) return true;
    if (/Macintosh/.test(ua)) return true;
    if (/Apple.*Vision|XRSimulator/i.test(ua)) return true;
    
    return false;
}

function setDeviceResult() {
    const textResult = document.getElementById("modal-coolness-result");
    const texttip = document.getElementById("modal-coolness-tip");
    const result = detectApplePlatform();

    console.log(result);
    
    if(result) {
        textResult.textContent = "YES!!!";
        texttip.style.display = "none";
    } else {
        textResult.textContent = "no";
        texttip.textContent = "kauf doch endlich mal apple geräte";
        texttip.style.display = "block";
    }
}

function showModal() {
    const modal = document.getElementById("modal");
    modal.style.display = "block";
    
    setDeviceResult();
}

function hideModal() {
    const modal = document.getElementById("modal");
    modal.style.display = "none";
}