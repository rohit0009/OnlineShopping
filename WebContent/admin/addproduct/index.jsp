<%@page import="osp.Product"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.io.*,org.apache.tomcat.util.http.fileupload.*,org.apache.tomcat.util.http.fileupload.disk.*,org.apache.tomcat.util.http.fileupload.servlet.*,javax.servlet.*,javax.servlet.http.*,java.util.*,java.util.Map.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<meta charset="utf-8">
	<link rel="stylesheet" type="text/css" href="../../bootstrap/css/bootstrap.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	<title>Add Product</title>
	<link href="../dashboard.css" rel="stylesheet">
	<style>
		.jumbotron p{
				font-size: 15px;
			}
	</style>
	<script>
		function reset_cat()
		{
		   $('#category [value="1"]').attr("selected",true);
	       $('#submitaddP').click();
		}
		function updatePreview(str) {
			var preview = document.querySelector('.preview-'+str);
			var input = document.getElementById('file'+str);
			while(preview.firstChild)
			{
			    preview.removeChild(preview.firstChild);
			}

			  var curFiles = input.files;
			  if(curFiles.length === 0)
			  {
			    var para = document.createElement('p');
			    para.textContent = 'No files currently selected for upload';
			    preview.appendChild(para);
			  }
			  else 
			  {
			      var para = document.createElement('p');
			      if(validFileType(curFiles[0]))
			      {
			    	  	if(curFiles[0].size > 2097152)
			    	  	{
			    	  			para.textContent = 'File name size is greater than 2MB!';
			    	  			input.value= ''
					        preview.appendChild(para)	
			    	  	}
			    	  	else
			    	  	{
			    	  			para.textContent = 'File name ' + curFiles[0].name;
					        var image = document.createElement('img');
					        image.src = window.URL.createObjectURL(curFiles[0]);
							image.className = 'img-thumbnail';
							preview.appendChild(image);
							preview.appendChild(para)	
			    	  	}
			      }
			      else
			      {
			        para.textContent = 'File name ' + curFiles[0].name + ': Not a valid file type. Update your selection.';
			        input.value = ""
			        preview.appendChild(para)
			      }
			    }
			}
		function validFileType(file) {
			var fileTypes = ['image/jpeg','image/png' ,'image/jpg']
		  for(var i = 0; i < fileTypes.length; i++) {
		    if(file.type === fileTypes[i]) {
		      return true;
		    }
		  }

		  return false;
		}
	
	
	</script>
</head>
<body>
	<%!
		Product product =null;
	%>
	<nav class="navbar navbar-default navbar-fixed-top">
      <div class="container-fluid">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="<%out.println("http://"+request.getServerName()+":"+request.getServerPort()+"/OnlineShopping"); %>">Online Shopping</a>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
          <ul class="nav navbar-nav navbar-right">
            <li><a href="../..">Go to Site</a></li>
            <li class="active"><a href="<%out.println("http://"+request.getServerName()+":"+request.getServerPort()+"/OnlineShopping/admin"); %>">Dashboard</a></li>
            <li><a href="#">Profile</a></li>
            	<li><a href="#">Logout</a></li>
          </ul>
        </div>
      </div>
    </nav>
    
    <div class="container-fluid">
      <div class="row">
        <div class="col-sm-3 col-md-2 sidebar">
          <ul class="nav nav-sidebar">
            <li class="active"><a>Add Product</a></li>
            <li><a href="<%out.println("http://"+request.getServerName()+":"+request.getServerPort()+"/OnlineShopping/admin/addsupplier"); %>">Add Supplier</a></li>
          </ul>
          <ul class="nav nav-sidebar">
          	<li><a href="<%out.println("http://"+request.getServerName()+":"+request.getServerPort()+"/OnlineShopping/admin/search/supplier"); %>">Search Supplier</a></li>
	      	<li><a href="<%out.println("http://"+request.getServerName()+":"+request.getServerPort()+"/OnlineShopping/admin/search/customer"); %>">Search Customer</a></li>
	      </ul>
	      <ul class="nav nav-sidebar">
	          <li><a href="#" id="btn-1" data-toggle="collapse" data-target="#submenu1" aria-expanded="false">Coupon <span class="caret"></span></a>
			      <ul class="nav collapse" id="submenu1" role="menu" aria-labelledby="btn-1">
			        <li><a href="<%out.println("http://"+request.getServerName()+":"+request.getServerPort()+"/OnlineShopping/admin/coupon/add"); %>">Add Discount Coupon</a></li>
            			<li><a href="<%out.println("http://"+request.getServerName()+":"+request.getServerPort()+"/OnlineShopping/admin/coupon/remove"); %>">Remove Discount Coupon</a></li>
			      </ul>
			  </li>
          </ul>
        </div>
        	<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
        		<div id="alert">
				<%
					if(request.getMethod().equalsIgnoreCase("post"))
					{
						String path = "/Users/rohitshewale/Documents/eclipse-workspace/OnlineShopping/WebContent/images";
						
						FileItemFactory itemFactory = new DiskFileItemFactory();
						ServletFileUpload fileUpload = new ServletFileUpload(itemFactory);
						try {
							Map<String,List<FileItem>> items = fileUpload.parseParameterMap(request);
							
							for(Entry<String, List<FileItem>> mapitem : items.entrySet())
							{
								int flag ;
								FileItem item = mapitem.getValue().get(0);
								
								if (item.isFormField())
								{
									flag = 0;
									String name = item.getFieldName();
									System.out.println("1 "+name);
									if(name.equalsIgnoreCase("pname") || name.equalsIgnoreCase("ideal_for") || name.equalsIgnoreCase("desc"))
									{
									    String value = item.getString();
									    if(value.equalsIgnoreCase(""))
									    		flag = 1;
									    System.out.println(name+" "+value);
									}
									if (flag == 1)
									{
										System.out.println("ERROR : ");
										break;
									}
								}
								if(!item.isFormField())
								{
									String fieldName = item.getFieldName();
								    String fileName = item.getName();
								    String contentType = item.getContentType();
								    boolean isInMemory = item.isInMemory();
								    long sizeInBytes = item.getSize();
								    File uploadDir = new File(path);
									out.println("<div class=\"alert alert-dismissible alert-danger\"><button type=\"button\" class=\"close\" data-dismiss=\"alert\">&times;</button>"+uploadDir.isDirectory()+"</div>");
									if(contentType.equals("image/jpeg") || contentType.equals("image/png"))
									{
										File file = File.createTempFile("img", ".jpeg", uploadDir);
										item.write(file);
									}
								}
								
							}
							
							
							
						}catch (Exception e) {
							// TODO: handle exception
							e.printStackTrace();
						}
					}
				%>
			</div>
        		<form class="form-horizontal" action="<%request.getRequestURL(); %>" method="POST" enctype="multipart/form-data" onsubmit="return validate()">
				<div class="jumbotron">
					<legend>Add Product</legend>
					  <div class="row">
					  	<div class="col-lg-12">
						  	<div class="form-group">
						    		<label class="col-lg-2 control-label" style="text-align: center;">Product Name <span style="color: red;">*</span></label>
						      	<div class="col-lg-5">
						        		<input type="text" class="form-control" id="pname" name="pname" placeholder="Product Name">
						      	</div>
						    </div>
						    <div class="form-group">
						    		<label class="col-lg-2 control-label" style="text-align: center;">Product Description</label>
						      	<div class="col-lg-5">
						        		<textarea rows="4" cols="10" class="form-control" id="desc" name="desc"></textarea>
						      	</div>
						    </div>
						    
						    <div class="form-group">
						    		<label class="col-lg-2 control-label" style="text-align: center;">Color </label>
						      	<div class="col-lg-5">
						        		<input type="text" class="form-control" id="colour" name="colour" placeholder="Colour">
						      	</div>
						    </div>	
						    
						    <div class="form-group">
						    		<label class="col-lg-2 control-label" style="text-align: center;">Brand </label>
						      	<div class="col-lg-5">
						        		<input type="text" class="form-control" id="brand" name="brand" placeholder="Product Brand">
						      	</div>
						    </div>
						    
						    <div class="form-group">
						    		<label class="col-lg-2 control-label" style="text-align: center;">Ideal For </label>
						      	<div class="col-lg-5">
						        		<select name="ideal_for" id="ideal_for" onchange="reset_cat()">
						        			<%
						        				out.println("<option value=\'1\'>Choose an OPTION</option>");
						        				out.println("<option value=\'men\'>Men</option>");
						        				out.println("<option value=\'women\'>Women</option>");
						        			%>
						        		</select>
						      	</div>
						    </div>
						    
						    <div class="form-group">
						    		<label class="col-lg-2 control-label" style="text-align: center;">Category </label>
						      	<div class="col-lg-5">
						        		<select name="category" id = "category">
						        			<option value='1'>Choose Category</option>
						        			<option value='2'>Category 1</option>
						        			<option value='3'>Category 2</option>
						        			<option value='4'>Category 3</option>
						        			<%
						        				/* String []cat_arr = product.get_categories();
						        				for(String cat : cat_arr)
						        				{
						        					out.println("<option value=\'\'>"+cat+"</option>");
						        				} */
						        			%>
						        		</select>
						      	</div>
						    </div>
						    
						    <div class="form-group">
						    		<label class="col-lg-2 control-label" style="text-align: center;">Size </label>
						      	<div class="col-lg-5">
						        		<select name="size" id="size">
						        			<%
						        				out.println("<option value=\'1\'>Choose an OPTION</option>");
						        				out.println("<option value=\'men\'>XS</option>");
						        				out.println("<option value=\'women\'>S</option>");
						        				out.println("<option value=\'women\'>M</option>");
						        				out.println("<option value=\'women\'>L</option>");
						        				out.println("<option value=\'women\'>XL</option>");
						        			%>
						        		</select>
						      	</div>
						    </div>
						    
						    <div class="form-group">
						    		<label class="col-lg-2 control-label" style="text-align: center;">Fabric </label>
						      	<div class="col-lg-5">
						        		<select name="fabric" id="fabric">
						        			<%
						        				out.println("<option value=\'1\'>Choose an OPTION</option>");
						        				out.println("<option value=\'men\'>Cotton</option>");
						        				out.println("<option value=\'women\'>Silk</option>");
						        				out.println("<option value=\'women\'>Linen</option>");
						        				out.println("<option value=\'women\'>Wool</option>");
						        				out.println("<option value=\'women\'>Jute</option>");
						        				out.println("<option value=\'women\'>Gerogette</option>");
						        			%>
						        		</select>
						      	</div>
						    </div>
						    
						    <div class="form-group">
						    		<label class="col-lg-2 control-label" style="text-align: center;">Neck Type </label>
						      	<div class="col-lg-5">
						        		<select name="neck_type" id="neck_type">
						        			<%
						        				out.println("<option value=\'1\'>Choose an OPTION</option>");
						        				out.println("<option value=\'men\'>V</option>");
						        				out.println("<option value=\'women\'>Round</option>");
						        				out.println("<option value=\'women\'>Square</option>");
						        			%>
						        		</select>
						      	</div>
						    </div>	    
						    
						    <div class="form-group">
						    		<label class="col-lg-2 control-label" style="text-align: center;">Image 1</label>
						      	<div class="col-lg-5">
						        		<input type="file" id="file1" accept=".png,.jpeg,.jpg" name="file1" onchange="updatePreview('1')">
						      	</div>
						      	<div class="col-lg-5 preview-1" style="border: 1px solid black">
						      		<p>No Preview Available</p>
						      	</div>
						    </div>
						    <div class="form-group">
						    		<label class="col-lg-2 control-label" style="text-align: center;">Image 2</label>
						      	<div class="col-lg-5">
						        		<input type="file" id="file2" accept=".png,.jpeg,.jpg" name="file2" onchange="updatePreview('2')">
						      	</div>
						      	<div class="col-lg-5 preview-2" style="border: 1px solid black">
						      		<p>No Preview Available</p>
						      	</div>
						    </div>
						    <div class="form-group">
						    		<label class="col-lg-2 control-label" style="text-align: center;">Image 3</label>
						      	<div class="col-lg-5">
						        		<input type="file" id="file3" accept=".png,.jpeg,.jpg" name="file3" onchange="updatePreview('3')">
						      	</div>
						      	<div class="col-lg-5 preview-3" style="border: 1px solid black">
						      		<p>No Preview Available</p>
						      	</div>
						    </div>
						    <div class="form-group">
						    		<div class="col-lg-5">
						    			<input type="submit" class="btn btn-success col-lg-offset-5" id="submitaddP" name="submitaddP" value="Add Product">
						    		</div>
						    </div>
					    </div>
				  </div>
				</div>
			</form>
        	</div>
      </div>
    </div>
	
	
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script src="../../bootstrap/js/bootstrap.min.js"></script>
</body>
</html>