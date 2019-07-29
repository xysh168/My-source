(()=>{
	ajax({
		type:"get",
		url:"header-cart.html"
	}).then(html=>{
		document.getElementById("header").innerHTML=html;


	})


})();