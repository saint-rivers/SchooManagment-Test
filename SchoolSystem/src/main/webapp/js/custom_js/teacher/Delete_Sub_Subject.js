
	$(document).ready(function()
	{
		 // $('[data-toggle="tooltip"]').tooltip();   
		 $(".delete_Sub_Subject").on("click",function()
		  {
			var id =$(this).val();
			SwalDelete(id);
			 
		 });
	});
		function SwalDelete(Id)
		{
			swal
			({
			   title: 'Are you sure?',
			   type: 'warning',
			   showCancelButton: true,
			   confirmButtonColor: '#3085d6',               //sweetalert confirm dialouge 
			   cancelButtonColor: '#d33',
			   confirmButtonText: 'Yes, delete it!',
			   showLoaderOnConfirm: true,
			   preConfirm: function() 
			   {
				   return new Promise(function(resolve)
				   {    //Promise() function take care delete process done by ajax
					   $.ajax
					   ({
						   url:'../../DeleteSubject',                //ajax codes start for delete data
						   type:'POST',
						   data:'id='+Id,
						   dataType:'JSON'
					   })
					   .done(function(response)
					   {
							swal('Delete SuccessFull', response.message, response.status);    //after process done on delete.jsp file get JSON response display message "Fruit Delete Successfully"
							location.reload(true);
					   })
					   .fail(function()
					   {
						   swal('Oops...', 'Delete Not SuccessFullPlease Try Again', 'error');    //if process fail on delete.jsp file get JSON response display message "Unable to delete fruit"
					   });
				   });
			   },
			   allowOutsideClick: false
			});
		}


