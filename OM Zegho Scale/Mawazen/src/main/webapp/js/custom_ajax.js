function custom_ajax(onReadyStateChangeSuccess, method, url, data) {
    var xhttp = new XMLHttpRequest();
    xhttp.onreadystatechange = function (){
        if (this.readyState == 4 && this.status == 200) {
            alert('الله اكبر');
            onReadyStateChangeSuccess;
        }
    };
    var url = url +"?"+ decodeURI($.param(data));
    xhttp.open(method, url, true);
    xhttp.send();
}