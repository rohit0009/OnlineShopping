package osp;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Enumeration;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import javax.servlet.Servlet;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.FileItem;
import org.apache.tomcat.util.http.fileupload.FileItemFactory;
import org.apache.tomcat.util.http.fileupload.RequestContext;
import org.apache.tomcat.util.http.fileupload.disk.DiskFileItemFactory;
import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

public class AddProductServlet extends HttpServlet implements Servlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String path = "/Users/rohitshewale/Documents/eclipse-workspace/OnlineShopping/WebContent/images";
		PrintWriter out = resp.getWriter();
		//out.println(req.getParameter("pname"));
		FileItemFactory itemFactory = new DiskFileItemFactory();
		ServletFileUpload fileUpload = new ServletFileUpload(itemFactory);
		try {
			Map<String,List<FileItem>> items = fileUpload.parseParameterMap(req);
			
			for(Entry<String, List<FileItem>> mapitem : items.entrySet())
			{
				//System.out.println(FileItem);
				Iterator<FileItem> itr = mapitem.getValue().iterator();
				while(itr.hasNext())
				{
					FileItem item = itr.next();
					if (item.isFormField())
					{
						String name = item.getFieldName();
					    String value = item.getString();
					    
					}
					if(!item.isFormField())
					{
						String fieldName = item.getFieldName();
					    String fileName = item.getName();
					    String contentType = item.getContentType();
					    boolean isInMemory = item.isInMemory();
					    long sizeInBytes = item.getSize();
					    File uploadDir = new File(path);
						out.println(uploadDir.isDirectory());
						if(contentType.equals("image/jpeg") || contentType.equals("image/png"))
						{
							File file = File.createTempFile("img", ".jpeg", uploadDir);
							item.write(file);
						}
					    //System.out.println(fieldName+" "+fileName+" "+contentType+" "+isInMemory+" "+sizeInBytes);
					}
					
				}
				
				//String contentType = item.getContentType();
//				if(!contentType.equals("image/png"))
//				{
//					out.println("not supported format");
//					return;
//				}
				
//				File uploadDir = new File(path);
//				out.println(uploadDir.isDirectory());
//				File file = File.createTempFile("img", ".jpg", uploadDir);
//				item.write(file);
			}
			
			
			
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
	}
}
