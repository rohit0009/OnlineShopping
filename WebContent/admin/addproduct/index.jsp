<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
			var fileTypes = ['image/jpeg','image/png']
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
        		<form class="form-horizontal" action="${ pageContext.request.contextPath }/add" method="POST" enctype="multipart/form-data">
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
						    			<input type="submit" class="btn btn-success col-lg-offset-5" value="Add Product">
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