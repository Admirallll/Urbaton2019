
    function getCookies() {
	    var cookies = document.cookie.split(';');
	    var result = {}
	    for (var i = 0; i < cookies.length; i++) {
		    var splitedCookie = cookies[i].trim().split('=');
		    if (splitedCookie[0].length === 0)
			    continue;
		    result[splitedCookie[0]] = splitedCookie.slice(1).join("=");
	    }
	
	    return result;
    }

    function ExecuteMethod(url, method, body)
    {
        var xmlHttp = new XMLHttpRequest();
        xmlHttp.open(method, url, false ); // false for synchronous request
        xmlHttp.setRequestHeader("Content-Type", "application/json");
        xmlHttp.send(body);
        return xmlHttp;
    }

    function setCookies(obj) {
        var res1 = [];
        for (var e in Object.entries(obj)) {
            if (!(e in obj))
                continue;
            res1.push(e + "=" + obj[e]);
        }
        document.cookie = "userId= ; expires = Thu, 01 Jan 1970 00:00:00 GMT";
        console.info(res1.join(';'));
    }

    function getUser(id) {
        var r = ExecuteMethod('http://10.34.32.94:51589/api/user/' + id, 'get');
        return JSON.parse(r.responseText);
    }

    function getParams() {
        var str = window.location.search.substr(1);
        var splited = str.split('&');
        var result = {};
        for (var i = 0; i < splited.length; i++) {
            var kv = splited[i].trim().split('=');
            if (kv[0].length === 0)
                continue;
            result[kv[0]] = kv[1];
        }

        return result;
    }

    function onExitClick() {
        var cookies = getCookies();
        delete cookies.userId;
        setCookies(cookies);

        window.location.replace("/login");
    }

    var exitButton = document.getElementsByClassName("exit-button")[0];
    exitButton.addEventListener("click", onExitClick);

    var cookies = getCookies();
    if (!("userId" in cookies)) {
        window.location.replace("/login");
    }
    var id = cookies.userId;

    var user = getUser(cookies["userId"]);