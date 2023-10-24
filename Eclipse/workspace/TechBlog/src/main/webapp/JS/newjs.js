function doLike(pid , uid){
	/*console.log(pid + "," + uid)*/
	
	const obj = {
		uid : uid,
		pid : pid, 
		operation : "like"                    //"like"
	}
	
	$.ajax({
		url: "LikeServlet",
		data: obj,
		
		success: function(data, textStatus, jqXHR){
			console.log(data);
			
			/*if(data.trim() == 'true')
			{							
				let c = $(".like-counter-" + pid).html();
				c++;
				$(".like-counter-" + pid).html(c);
			}*/
		},
		error: function(jqXHR, textStatus, errorThrown){
			console.log(errorThrown);
		} 
		
	})
}