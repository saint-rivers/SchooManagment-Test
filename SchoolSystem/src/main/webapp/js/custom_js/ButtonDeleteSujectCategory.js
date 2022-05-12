$(document).ready(function(){
        
        $(document).on('click','#btnDelete',function(e){
            var Id = $(this).val();
            SwalDelete(Id);
            e.preventDefault();
        });
        
    });
    
    function SwalDelete(Id){
       
        swal({
           title: 'Are you sure?',
           text: "It will be deleted permanently",
           type: 'warning',
           showCancelButton: true,
           confirmButtonColor: '#3085d6',               //sweetalert confirm dialouge 
           cancelButtonColor: '#d33',
           confirmButtonText: 'Yes, delete it!',
           showLoaderOnConfirm: true,
           
           preConfirm: function() {
               return new Promise(function(resolve){    //Promise() function take care delete process done by ajax
                   
                   $.ajax({
                       url:'../../DeleteSubjectCategoryServlet',                //ajax codes start for delete data
                       type:'POST',
                       data:'id='+Id,
                       dataType:'JSON'
                   })
                   .done(function(response){
                        swal('Deleted!', response.message, response.status);    //after process done on delete.jsp file get JSON response display message "Fruit Delete Successfully"
                        location.reload(true);
                   })
                   .fail(function(){
                       swal('Oops...', 'Something went wrong with ajax !', 'error');    //if process fail on delete.jsp file get JSON response display message "Unable to delete fruit"
                   });
               });
           },
           allowOutsideClick: false
        });
    }