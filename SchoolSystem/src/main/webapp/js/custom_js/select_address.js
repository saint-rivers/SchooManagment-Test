$(document).ready(function(){
			$("#province").on('change', function(){
				//alert("Was change value");
				var params = {proid : $(this).val()};//proid got value from $(this).val()
				//alert($(this).val());
					//coding to pass proid to servlet
					//params is object
					$.post("${pageContext.request.contextPath}/ProvinceServlet" , $.param(params) , function(responseJson){
						var $select = $("#district");
						$select.find("option").remove();
						$.each(responseJson, function(index, key){
							console.log( key );
							$("<option>").val( key.district_id ).text(key.district).appendTo($select);
						});
					});
			});
		});
		
		$(document).ready(function(){
			$("#district").on('change', function(){
				//alert("Was change value");
				var params = {distid : $(this).val()};//proid got value from $(this).val()
				//alert($(this).val());
					//coding to pass proid to servlet
					//params is object
					$.post("${pageContext.request.contextPath}/SelectCommuneServlet" , $.param(params) , function(responseJson){
						var $select = $("#commune");
						$select.find("option").remove();
						$.each(responseJson, function(index, key){
							console.log( key );
							$("<option>").val( key.commune_id ).text(key.commune).appendTo($select);
						});
					});
			});
		});
	
		$(document).ready(function(){
			$("#commune").on('change', function(){
				//alert("Was change value");
				var params = {comid : $(this).val()};//proid got value from $(this).val()
				//alert($(this).val());
					//coding to pass proid to servlet
					//params is object
					$.post("${pageContext.request.contextPath}/SelectVillageServlet" , $.param(params) , function(responseJson){
						var $select = $("#village");
						$select.find("option").remove();
						$.each(responseJson, function(index, key){
							console.log( key );
							$("<option>").val( key.village_id ).text(key.village).appendTo($select);
						});
					});
			});
		});
	
		$(document).ready(function(){
			$("#province_id").on('change', function(){
				//alert("Was change value");
				var params = {proid : $(this).val()};//proid got value from $(this).val()
				//alert($(this).val());
					//coding to pass proid to servlet
					//params is object
					$.post("${pageContext.request.contextPath}/ProvinceServlet" , $.param(params) , function(responseJson){
						var $select = $("#district_id");
						$select.find("option").remove();
						$.each(responseJson, function(index, key){
							console.log( key );
							$("<option>").val( key.district_id ).text(key.district).appendTo($select);
						});
					});
			});
		});
	
		$(document).ready(function(){
			$("#district_id").on('change', function(){
				//alert("Was change value");
				var params = {distid : $(this).val()};//proid got value from $(this).val()
				//alert($(this).val());
					//coding to pass proid to servlet
					//params is object
					$.post("${pageContext.request.contextPath}/SelectCommuneServlet" , $.param(params) , function(responseJson){
						var $select = $("#commune_id");
						$select.find("option").remove();
						$.each(responseJson, function(index, key){
							console.log( key );
							$("<option>").val( key.commune_id ).text(key.commune).appendTo($select);
						});
					});
			});
		});
	
	
		$(document).ready(function(){
			$("#commune_id").on('change', function(){
				//alert("Was change value");
				var params = {comid : $(this).val()};//proid got value from $(this).val()
				//alert($(this).val());
					//coding to pass proid to servlet
					//params is object
					$.post("${pageContext.request.contextPath}/SelectVillageServlet" , $.param(params) , function(responseJson){
						var $select = $("#village_id");
						$select.find("option").remove();
						$.each(responseJson, function(index, key){
							console.log( key );
							$("<option>").val( key.village_id ).text(key.village).appendTo($select);
						});
					});
			});
		});