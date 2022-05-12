var lastActiveTime = new Date().getTime();
		$(document).ready(function(){
			$('body').bind('click mousemove keypress scroll resize', function(){
				lastActiveTime = new Date().getTime();
			});
			setInterval( checkIdleTime , 600000);
		});
		function checkIdleTime(){
			var stand_time = new Date().getTime() - lastActiveTime;
			if(stand_time > 30000){
				window.location.href = "../../lock_screen"
			}else{
				console.log("Keep Active!");
			}
		}