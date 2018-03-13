<%@page import="osp.Product,osp.Supplier"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.io.*,org.apache.tomcat.util.http.fileupload.*,org.apache.tomcat.util.http.fileupload.disk.*,org.apache.tomcat.util.http.fileupload.servlet.*,javax.servlet.*,javax.servlet.http.*,java.util.*,java.util.Map.*,java.util.regex.*,org.apache.commons.io.*"%>
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
		   //$('#neck_type [value="1"]').attr("selected",true);
		   /* var query = $('#f1').attr("action");
		   alert(query+" hi"); */
	       $('#submitaddP').click();
		}
		function disable_neck()
		{
			//var conceptName = $('#category').find(":selected").text();
			//alert(conceptName);
			$('#neck_type [value="1"]').attr("selected",true);
			$('#submitaddP').click();
			//$("#category option:contains("+conceptName+")").attr('selected', true);
		}
		function validate()
		{
			alert("hi");
			var pname = document.getElementById('pname');
			var desc = document.getElementById('desc');
			var colour = document.getElementById('colour');
			var brand = document.getElementById('brand');
			var ideal_for = document.getElementById('ideal_for');
			var file1 = document.getElementById('file1');
			var file2 = document.getElementById('file2');
			var file3 = document.getElementById('file3');
			
			alert(pname.value + " " + desc.value + " " + colour.value + " " + brand.value +" " + file1.value);
			return false;
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
				HashMap<String , String> map= null;
				FileItemFactory itemFactory = null;
				ServletFileUpload fileUpload = null;
				// \\at the end of string PATH
				String path = "D:\\workspacemca\\OnlineShopping\\WebContent\\images\\";
				int fully_validated_data = 0;
				
				public boolean allLetters(String args,JspWriter out,String parameter)throws IOException
				{
					String pattern = "^[A-Za-z\\s]+$";
			        Pattern p=Pattern.compile(pattern,Pattern.CASE_INSENSITIVE);
					
					if(args.matches(pattern))  
					{  
						return true;
					}  
					else  
					{  
						out.println("<div class=\"alert alert-dismissible alert-danger\"><button type=\"button\" class=\"close\" data-dismiss=\"alert\">&times;</button>"+parameter+" must have LETTERS ONLY.</div>");  
						return false;
					}
				}
				public boolean allNumeric(String args,JspWriter out,String parameter)throws IOException
				{
					String pattern = "^[0-9]+$";
			        Pattern p=Pattern.compile(pattern,Pattern.CASE_INSENSITIVE);
					
					if(args.matches(pattern))  
					{  
						return true;
					}  
					else  
					{  
						out.println("<div class=\"alert alert-dismissible alert-danger\"><button type=\"button\" class=\"close\" data-dismiss=\"alert\">&times;</button>"+parameter+" must have NUMBERS ONLY.</div>");  
						return false;  
					}
				}
				public boolean inFormat(String args,JspWriter out,String parameter)throws IOException
				{
					String pattern = "[0-9]+([.][0-9]{1,2})?";
			        Pattern p=Pattern.compile(pattern,Pattern.CASE_INSENSITIVE);
					
					if(args.matches(pattern))  
					{  
						return true;
					}  
					else  
					{  
						out.println("<div class=\"alert alert-dismissible alert-danger\"><button type=\"button\" class=\"close\" data-dismiss=\"alert\">&times;</button>"+parameter+" is in INCORRECT FORMAT!</div>");  
						return false;  
					}
				}
			%>
			<%
				if(session.getAttribute("u_id") == null && session.getAttribute("u_fname") == null && session.getAttribute("u_lname") == null && session.getAttribute("is_Admin") == null)
				{
					out.println("<div class=\"jumbotron\">You are not Logged In. Please ");
					out.println("<a href=\"http://"+request.getServerName()+":"+request.getServerPort()+"/OnlineShopping/login\">Login</a></div>");
				}
				else
				{
					String bool = (String)session.getAttribute("is_Admin");
					if(!bool.equalsIgnoreCase("true"))
					{
						out.println("<div class=\"jumbotron\">You are not allowed to Access this Page Contents ");
						out.println("<a href=\"http://"+request.getServerName()+":"+request.getServerPort()+"/OnlineShopping\">Shop items</a></div>");
					}
					else
					{
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
					
						//System.out.println(map);
					out.print(request.getMethod());
					map = new HashMap<String , String>();
					itemFactory = new DiskFileItemFactory();
					fileUpload = new ServletFileUpload(itemFactory);
					product = new Product();
			
					if(request.getMethod().equalsIgnoreCase("post"))
					{
						
						Map<String,List<FileItem>> items = fileUpload.parseParameterMap(request);
						
						for(Entry<String, List<FileItem>> mapitem : items.entrySet())
						{
							FileItem item = mapitem.getValue().get(0);
							
							if (item.isFormField())
							{
								
								String name = item.getFieldName();
								/* String value = item.getString();
								System.out.println(name+" "+value); */
								
							    String value = item.getString();
							    if(value.equalsIgnoreCase(""))
							    		map.put(name, null);
							    else
							    		map.put(name, value);
							    //System.out.println(name+" "+value);
								
								/* if (flag == 1)
								{
									System.out.println("ERROR : ");
									break;
								} */
							}
							if(!item.isFormField())
							{
								String fieldName = item.getFieldName();
							    String fileName = item.getName();
							    //System.out.println(fieldName+" "+fileName);
							    String contentType = item.getContentType();
							    boolean isInMemory = item.isInMemory();
							    long sizeInBytes = item.getSize();
							    if(fileName.equalsIgnoreCase(""))
						    			map.put(fieldName, null);
						    		else
						    			map.put(fieldName, fileName);
							    /* File uploadDir = new File(path);
								out.println("<div class=\"alert alert-dismissible alert-danger\"><button type=\"button\" class=\"close\" data-dismiss=\"alert\">&times;</button>"+uploadDir.isDirectory()+"</div>");
								if(contentType.equals("image/jpeg") || contentType.equals("image/png"))
								{
									File file = File.createTempFile("img", ".jpeg", uploadDir);
									item.write(file);
								} */
							}
							
						}
			
						
						
						
						//VALIDATION HERE
						
						if(map.get("pname") == null || map.get("desc") == null || map.get("colour") == null || map.get("brand") == null || map.get("ideal_for") == null || map.get("category") == null || map.get("size") == null || map.get("fabric") == null || map.get("price") == null || map.get("item_ordered") == null || map.get("file1") == null || map.get("file2") == null || map.get("file3") == null || map.get("supplier") == null)
						{
							out.println("<div class=\"alert alert-dismissible alert-danger\"><button type=\"button\" class=\"close\" data-dismiss=\"alert\">&times;</button>Please enter all fields.</div>");
						}
						else
						{
							if(allLetters(map.get("pname"), out, "Product Name"))
							{
								if(allLetters(map.get("colour"), out, "Product Colour"))
								{
									if(allLetters(map.get("brand"), out, "Product Brand"))
									{
										if(inFormat(map.get("price"), out, "Price"))
										{
											if(allNumeric(map.get("item_ordered"), out, "Total Items Ordered"))
											{
												fully_validated_data = 1;
											}
										}
									}
								}
							}	
						}
						
						if(fully_validated_data == 1)
						{
							Supplier supplier = null;
							supplier = new Supplier();
							if(!supplier.getStatus().contains("ERROR"))
							{
								String status = product.getStatus();
								if(!status.contains("ERROR"))
								{
									//System.out.println(map.get("category").toString());
									product.setCat_id(product.get_Cat_id(map.get("category").toString()));
									if(!product.getStatus().contains("ERROR"))
									{
										product.setPname(map.get("pname"));
										product.setDescription(map.get("desc"));
										product.setColor(map.get("colour"));
										product.setBrand(map.get("brand"));
										product.setIdeal_for(map.get("ideal_for"));
										
										product.setS_id(supplier.get_S_id(map.get("supplier")));
										//product.setCat_id(Integer.parseInt(map.get("category")));
										product.setSize(map.get("size").trim());
										product.setFabric(map.get("fabric").trim());
										product.setPrice(Double.parseDouble(map.get("price")));
										product.setTotal_items_order(Integer.parseInt(map.get("item_ordered")));
										product.setItems_left(Integer.parseInt(map.get("item_ordered")));
										product.setImage_path(path+map.get("ideal_for")+"\\"+map.get("category").trim()+"\\"+map.get("colour").trim()+"\\"+map.get("file1").trim());
										product.setImage_path_2(path+map.get("ideal_for")+"\\"+map.get("category").trim()+"\\"+map.get("colour").trim()+"\\"+map.get("file2").trim());
										product.setImage_path_3(path+map.get("ideal_for")+"\\"+map.get("category").trim()+"\\"+map.get("colour").trim()+"\\"+map.get("file3").trim());
										status = product.add();
										if(!product.getStatus().contains("ERROR"))
										{
											Map<String,List<FileItem>> items1 = fileUpload.parseParameterMap(request);
											
											for(Entry<String, List<FileItem>> mapitem : items.entrySet())
											{
												FileItem item = mapitem.getValue().get(0);
												
												if(!item.isFormField())
												{
												    File uploadDir = new File(path+map.get("ideal_for").trim()+"\\"+map.get("category").trim()+"\\"+map.get("colour").trim());
												    System.out.println(uploadDir.isDirectory());
												    if(!uploadDir.isDirectory())
												    {
												    		try{
												    			boolean dir_created = uploadDir.mkdirs();
												    			if( !dir_created )
												    				System.out.println("Dir creation failed TRY");
												    		}catch(Exception e)
												    		{
												    			System.out.println("Dir creation failed");
												    			e.printStackTrace();
												    		}
												    		String ext = FilenameUtils.getExtension(item.getName());
												    		File file = File.createTempFile("img", "."+ext, uploadDir);
															item.write(file);
												    }
												    else
												    {
												    	String ext = FilenameUtils.getExtension(item.getName());
											    		File file = File.createTempFile("img", "."+ext, uploadDir);
														item.write(file);
												    }
													
												}
												
											}
											map.clear();
											fully_validated_data = 0;
											out.println("<div class=\"alert alert-dismissible alert-success\"><button type=\"button\" class=\"close\" data-dismiss=\"alert\">&times;</button>Product Added Successfully</div>");
										}
										else
										{
											out.println("<div class=\"alert alert-dismissible alert-danger\"><button type=\"button\" class=\"close\" data-dismiss=\"alert\">&times;</button>"+product.getStatus()+"</div>");
										}
									}
									else
										out.println("<div class=\"alert alert-dismissible alert-danger\"><button type=\"button\" class=\"close\" data-dismiss=\"alert\">&times;</button>"+product.getStatus()+"</div>");
								}
								else
									out.println("<div class=\"alert alert-dismissible alert-danger\"><button type=\"button\" class=\"close\" data-dismiss=\"alert\">&times;</button>"+product.getStatus()+"</div>");
							}
							else
								out.println("<div class=\"alert alert-dismissible alert-danger\"><button type=\"button\" class=\"close\" data-dismiss=\"alert\">&times;</button>"+supplier.getStatus()+"</div>");
						
						}
						
					}
				%>
			</div>
			
        		<form class="form-horizontal" id = "f1" action="<%request.getRequestURL(); %>" method="POST" enctype="multipart/form-data" >
				<div class="jumbotron">
					<legend>Add Product</legend>
					  <div class="row">
					  	<div class="col-lg-12">
						  	<div class="form-group">
						    		<label class="col-lg-2 control-label" style="text-align: center;">Product Name <span style="color: red;">*</span></label>
						      	<div class="col-lg-5">
						        		<input type="text" class="form-control" id="pname" name="pname" value="<% if(map.containsKey("pname")){if(map.get("pname") == null)out.println(""); else out.println(map.get("pname"));}%>" placeholder="Product Name">
						      	</div>
						    </div>
						    <div class="form-group">
						    		<label class="col-lg-2 control-label" style="text-align: center;">Product Description <span style="color: red;">*</span></label>
						      	<div class="col-lg-5">
						        		<textarea rows="4" cols="10" class="form-control" id="desc" name="desc"><% if(map.containsKey("desc")){if(map.get("desc") == null)out.println(""); else out.println(map.get("desc"));}%></textarea>
						      	</div>
						    </div>
						    
						    <div class="form-group">
						    		<label class="col-lg-2 control-label" style="text-align: center;">Colour <span style="color: red;">*</span></label>
						      	<div class="col-lg-5">
						        		<input type="text" class="form-control" id="colour" value="<% if(map.containsKey("colour")){if(map.get("colour") == null)out.println(""); else out.println(map.get("colour"));}%>" name="colour" placeholder="Colour">
						      	</div>
						    </div>	
						    
						    <div class="form-group">
						    		<label class="col-lg-2 control-label" style="text-align: center;">Brand <span style="color: red;">*</span></label>
						      	<div class="col-lg-5">
						        		<input type="text" class="form-control" id="brand" value="<% if(map.containsKey("brand")){if(map.get("brand") == null)out.println(""); else out.println(map.get("brand"));}%>" name="brand" placeholder="Product Brand">
						      	</div>
						    </div>
						    
						    <div class="form-group">
						    		<label class="col-lg-2 control-label" style="text-align: center;">Ideal For <span style="color: red;">*</span></label>
						      	<div class="col-lg-5">
						        		<select class="form-control" name="ideal_for" id="ideal_for" onchange="reset_cat()">
					        				<option value='' <%if(map.containsKey("ideal_for")){ if(map.get("ideal_for") == null) out.println("selected");} %>>Choose an OPTION</option>
					        				<option value='men' <% if(map.containsKey("ideal_for")){ if(map.get("ideal_for") != null) { if(map.get("ideal_for").equalsIgnoreCase("men")) out.println("selected"); } } %>>Men</option>
					        				<option value='women' <% if(map.containsKey("ideal_for")){ if(map.get("ideal_for") != null) { if(map.get("ideal_for").equalsIgnoreCase("women")) out.println("selected"); } }%>>Women</option>
						        		</select>
						      	</div>
						    </div>
						    
						    <div class="form-group">
						    		<label class="col-lg-2 control-label" style="text-align: center;">Category <span style="color: red;">*</span></label>
						      	<div class="col-lg-5">
						        		<select class="form-control" name="category" id = "category">
						        			<option value=''>Choose an OPTION</option>
						        			<%
						        				String str ="";
						        				if(map.containsKey("ideal_for"))
						        				{
						        					if(map.get("ideal_for") == null)
						        						str = "";
						        					else
						        					{
							        					if(map.get("ideal_for").equalsIgnoreCase("men"))
							        						str = "men";
							        					if(map.get("ideal_for").equalsIgnoreCase("women"))
							        						str = "women";
						        					}
						        				}
						        				String item[] = product.get_categories(str);
						        				
						        				for(String cat : item)
						        				{
						        					%>
						        						<option value='<% out.println(cat); %>'><% out.println(cat);%> </option>
						        					<%
						        				}
						        			%>
						        		</select>
						      	</div>
						    </div>
						    
						    <div class="form-group">
						    		<label class="col-lg-2 control-label" style="text-align: center;">Size <span style="color: red;">*</span></label>
						      	<div class="col-lg-5">
						        		<select class="form-control" name="size" id="size">
						        			<option value='' <%if(map.containsKey("size")){ if(map.get("size") == null) out.println("selected");} %>>Choose an OPTION</option>
						        			<option value='xs' <% if(map.containsKey("size")){ if(map.get("size") != null) { if(map.get("size").equalsIgnoreCase("xs")) out.println("selected"); } } %>>XS</option>
					        				<option value='s' <% if(map.containsKey("size")){ if(map.get("size") != null) { if(map.get("size").equalsIgnoreCase("s")) out.println("selected"); } } %>>S</option>
					        				<option value='m' <% if(map.containsKey("size")){ if(map.get("size") != null) { if(map.get("size").equalsIgnoreCase("m")) out.println("selected"); } } %>>M</option>
					        				<option value='l' <% if(map.containsKey("size")){ if(map.get("size") != null) { if(map.get("size").equalsIgnoreCase("l")) out.println("selected"); } } %>>L</option>
					        				<option value='xl' <% if(map.containsKey("size")){ if(map.get("size") != null) { if(map.get("size").equalsIgnoreCase("xl")) out.println("selected"); } } %>>XL</option>
						        		</select>
						      	</div>
						    </div>
						    
						    <div class="form-group">
						    		<label class="col-lg-2 control-label" style="text-align: center;">Fabric <span style="color: red;">*</span></label>
						      	<div class="col-lg-5">
						        		<select class="form-control" name="fabric" id="fabric">
						        				<option value='' <%if(map.containsKey("fabric")){ if(map.get("fabric") == null) out.println("selected");} %>>Choose an OPTION</option>
						        				<option value='cotton' <% if(map.containsKey("fabric")){ if(map.get("fabric") != null) { if(map.get("fabric").equalsIgnoreCase("cotton")) out.println("selected"); } } %>>Cotton</option>
						        				<option value='silk' <% if(map.containsKey("fabric")){ if(map.get("fabric") != null) { if(map.get("fabric").equalsIgnoreCase("silk")) out.println("selected"); } } %>>Silk</option>
						        				<option value='linen' <% if(map.containsKey("fabric")){ if(map.get("fabric") != null) { if(map.get("fabric").equalsIgnoreCase("linen")) out.println("selected"); } } %>>Linen</option>
						        				<option value='wool' <% if(map.containsKey("fabric")){ if(map.get("fabric") != null) { if(map.get("fabric").equalsIgnoreCase("wool")) out.println("selected"); } } %>>Wool</option>
						        				<option value='jute' <% if(map.containsKey("fabric")){ if(map.get("fabric") != null) { if(map.get("fabric").equalsIgnoreCase("jute")) out.println("selected"); } } %>>Jute</option>
						        				<option value='gerogette' <% if(map.containsKey("fabric")){ if(map.get("fabric") != null) { if(map.get("fabric").equalsIgnoreCase("gerogette")) out.println("selected"); } } %>>Gerogette</option>
						        		</select>
						      	</div>
						    </div>
						    
						    
						    <div class="form-group">
								<label class="col-lg-2 control-label" style="text-align: center;">Price <span style="color: red;">*</span></label>
								<div class="input-group col-lg-5">
									<span class="input-group-addon">₹</span>
										<input type="text" class="form-control" id ="price" name="price" value="<% if(map.containsKey("price")){if(map.get("price") == null)out.println(""); else out.println(map.get("price"));}%>" placeholder="Price">
										<span class="input-group-btn">
									</span>
								</div>
							</div>
							
							<div class="form-group">
						    		<label class="col-lg-2 control-label" style="text-align: center;">Total Items Ordered <span style="color: red;">*</span></label>
						      	<div class="col-lg-5">
						        		<input type="text" class="form-control" id="item_ordered" value="<% if(map.containsKey("item_ordered")){if(map.get("item_ordered") == null)out.println(""); else out.println(map.get("item_ordered"));}%>" name="item_ordered" placeholder="Total Items Ordered">
						      	</div>
						    </div>
						    
						    <div class="form-group">
						    		<label class="col-lg-2 control-label" style="text-align: center;">Image 1 <span style="color: red;">*</span></label>
						      	<div class="col-lg-5">
						        		<input type="file" id="file1" accept=".png,.jpeg,.jpg" name="file1" onchange="updatePreview('1')">
						      	</div>
						      	<div class="col-lg-5 preview-1" style="border: 1px solid black">
						      		<p>No Preview Available</p>
						      	</div>
						    </div>
						    <div class="form-group">
						    		<label class="col-lg-2 control-label" style="text-align: center;">Image 2 <span style="color: red;">*</span></label>
						      	<div class="col-lg-5">
						        		<input type="file" id="file2" accept=".png,.jpeg,.jpg" name="file2" onchange="updatePreview('2')">
						      	</div>
						      	<div class="col-lg-5 preview-2" style="border: 1px solid black">
						      		<p>No Preview Available</p>
						      	</div>
						    </div>
						    <div class="form-group">
						    		<label class="col-lg-2 control-label" style="text-align: center;">Image 3 <span style="color: red;">*</span></label>
						      	<div class="col-lg-5">
						        		<input type="file" id="file3" accept=".png,.jpeg,.jpg" name="file3" onchange="updatePreview('3')">
						      	</div>
						      	<div class="col-lg-5 preview-3" style="border: 1px solid black">
						      		<p>No Preview Available</p>
						      	</div>
						    </div>
						    
						    <div class="form-group">
						    		<label class="col-lg-2 control-label" style="text-align: center;">Supplier <span style="color: red;">*</span></label>
						      	<div class="col-lg-5">
						        		<select class="form-control" name="supplier" id = "supplier">
						        			<option value=''>Choose an OPTION</option>
						        			<%
						        				Supplier supplier_ob = null;
						        				supplier_ob = new Supplier();
						        				if(!supplier_ob.getStatus().contains("ERROR"))
						        				{
						        					String suppliers[] = supplier_ob.get_Suppliers();
							        				
							        				for(String supplier : suppliers)
							        				{
							        					%>
							        						<option value='<% out.println(supplier); %>'><% out.println(supplier);%> </option>
							        					<%
							        				}
						        				}
						        			%>
						        		</select>
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
<%
	}
}
%>