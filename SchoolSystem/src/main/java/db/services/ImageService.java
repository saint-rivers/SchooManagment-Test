package db.services;

import java.io.File;
import java.io.IOException;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.regex.Pattern;
import javax.servlet.ServletContext;
import javax.servlet.http.Part;


public class ImageService {
	
      // delete old file
	
	 public static void DeletImageFromfolder(ServletContext context, String OldImageName , String urlName){
		    String urlPath =  urlName + File.separator + OldImageName;
		    new File(urlPath).delete();
		  }
		  
	 // add new file
	 
		  public static String FileNameFilter(Part part){
			  
		      String contentDisplay = part.getHeader("content-disposition");
		       String []items = contentDisplay.split(";");
		         for(String str : items){
		           if(str.trim().startsWith("filename")){
		              String name = str.substring(str.indexOf("=") + 2, str.length() -1 );
		               String []fname = name.split( Pattern.quote(File.separator) );
		               return fname[fname.length - 1];
		            }
		          }
		    return "";
		  }
		  
		  // get part onSystem
		     
		  public static Path GetImagePart(String part ) {
			Path path = Paths.get(part);
			  return path;
		  }
		  
		  // input fileName in part
		  
		public static void AddNewImage( String FileName, String UrlInputFile , Part part ) {
			  try { 
				  	   String urlPath = UrlInputFile + File.separator + FileName;
				      File fileSaveDirectory = new File(urlPath);
						part.write(UrlInputFile + File.separator + fileSaveDirectory);
					} catch (IOException e) {
						e.printStackTrace();
					}
		}
		
		public static void AddNewImage( String FileName, String UrlInputFile  ) {
			  try { 
				  	   String urlPath = UrlInputFile + File.separator + FileName;
				      File fileSaveDirectory = new File(urlPath);
						
					} catch (Exception e) {
						e.printStackTrace();
					}
		}
}
