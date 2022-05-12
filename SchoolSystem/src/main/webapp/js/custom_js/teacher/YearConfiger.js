 let startYear = 1980;
    let endYear = new Date().getFullYear();
    
    /// for
    
    for (i = endYear; i > startYear; i--)
    {
      $('#start_heightschool_date').append($('<option />').val(i).html(i));
    }
    
    /// for 
    
    for (i = endYear; i > startYear; i--)
    {
      $('#end_heightschool_date').append($('<option />').val(i).html(i));
    } 
    
    /// for start_primaryschool_date
    
    for (i = endYear; i > startYear; i--)
    {
        $('#start_primaryschool_date').append($('<option />').val(i).html(i));
     }
    
    /// for end_primaryschool_date        
    
    for (i = endYear; i > startYear; i--)
    {
        $('#end_primaryschool_date').append($('<option />').val(i).html(i));
     }
    
    /// for start_university_date
    
    for (i = endYear; i > startYear; i--)
    {
        $('#start_university_date').append($('<option />').val(i).html(i));
     }
    
    /// for end_university_date
    
    for (i = endYear; i > startYear; i--)
    {
        $('#end_university_date').append($('<option />').val(i).html(i));
     }