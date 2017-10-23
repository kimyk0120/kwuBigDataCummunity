<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions"  prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko" lang="ko">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta http-equiv="X-UA-Compatible" content="IE=Edge,chrome=1" />
	<meta http-equiv="X-UA-Compatible" content="requiresActiveX=true" />
	
	<script type="text/javascript" src="./common/js/jquery-1.10.2.min.js"></script>
	<script type="text/javascript" src="./common/js/jquery-ui.min.js"></script>
	<!-- <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/dropzone/4.3.0/dropzone.js"></script> -->
	<script type="text/javascript" src="./common/js/dropzone.js"></script>
	<!-- <script type="text/javascript" src="./common/js/dropzone-amd-module.js"></script> -->
	
	<link href="./common/css/basic.css" rel="stylesheet" type="text/css" />
	<link href="./common/css/dropzone.css" rel="stylesheet" type="text/css" />
	
	



	<title>Home</title>
	
	
	<script type="text/javascript">
	
	
	
</script>
	
</head>
<body>
<h1>
	Hello world!  
</h1>
<form id="mainform" name="mainform"  method="post" enctype="multipart/form-data">
<!-- <form action="/file-upload" class="dropzone"> -->
    <!-- <input name="file" type="file" /> -->
   <div class="clsbox-1" runat="server"  >
		<div class="dropzone clsbox" id="mydropzone">

		</div>
	</div>


  <div id="dropzone-previews">
  	
  </div>
  
  <div class="btn-block">
	<input type="button" onclick="javascript:board_save()"/>
</div><!--// btn-block -->
  
</form>
	<script type="text/javascript">
	
	var accept = ".csv,.hwp";
	Dropzone.autoDiscover = false;

	// Dropzone class:
	var myDropzone = new Dropzone("#mydropzone", { 
		autoProcessQueue: false,
	  url: "UploadImages",
	   acceptedFiles: accept,
	   maxFilesize: 500,
	   uploadMultiple: false,
	   createImageThumbnails: false,
	   addRemoveLinks: true,
	    maxFiles: 3,
	    maxfilesexceeded: function(file) {
	        this.removeAllFiles();
	        this.addFile(file);
	    },
	    init: function () {
	    this.on('error', function (file, errorMessage) {
								alert(maxFilesize);
								alert(errorMessage);
								//this.removeAllFiles();
								if (errorMessage.indexOf('Error 404') !== -1) {
									var errorDisplay = document.querySelectorAll('[data-dz-errormessage]');
									errorDisplay[errorDisplay.length - 1].innerHTML = 'Error 404: The upload page was not found on the server';
								}
								if (errorMessage.indexOf('File is too big') !== -1) {
									alert('i remove current file');
	                // i remove current file
									this.removeAllFiles();
								}
							});
	  }
	  
	  });

</script>


</body>
</html>
