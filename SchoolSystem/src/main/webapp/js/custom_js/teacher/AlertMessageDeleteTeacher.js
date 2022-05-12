
       $(document).ready(function(){
          // Delete 
          $('.btnDelete').click(function(){
            var el = this;
             
            var deleteid = $(this).val();
            alert("csdzvzdfvd" + deleteid);
           
            bootbox.confirm("Do you really want to delete record?", function(result) {
         
               if(result){
                 // AJAX Request
                 $.ajax({
                   url: '../../DeleteTeacher',
                   type: 'POST',
                   data: { id:deleteid },
                   success: function(response){
  
                     // Removing row from HTML Table
                     if(response == "Success"){
                  $(el).closest('tr').css('background','tomato');
                          $(el).closest('tr').fadeOut(800,function(){
                      $(this).remove();
                  });
                   }else{
                  bootbox.alert('Record not deleted.');
                   }
                   }
                 });
               }
         
            });
         
          });
      });
   