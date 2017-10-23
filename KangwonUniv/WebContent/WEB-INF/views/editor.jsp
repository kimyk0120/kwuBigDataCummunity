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
	
	<script async src="//www.google-analytics.com/analytics.js"></script>
	<script src="https://production-assets.codepen.io/assets/editor/live/console_runner-079c09a0e3b9ff743e39ee2d5637b9216b3545af0de366d4b9aad9dc87e26bfd.js"></script>
	<script src="https://production-assets.codepen.io/assets/editor/live/events_runner-73716630c22bbc8cff4bd0f07b135f00a0bdc5d14629260c3ec49e5606f98fdd.js"></script>
	<script src="https://production-assets.codepen.io/assets/editor/live/css_live_reload_init-2c0dc5167d60a5af3ee189d570b1835129687ea2a61bee3513dee3a50c115a77.js"></script>
	
	<!-- <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/dropzone/4.3.0/dropzone.js"></script> -->
	<!-- <script type="text/javascript" src="./common/js/pagedown.js"></script> -->
	<script type="text/javascript" src="https://aymdev.ninja/blog/asset/rsc/pagedown-master/Markdown.Converter.js"></script>
	<script type="text/javascript" src="https://aymdev.ninja/blog/asset/rsc/pagedown-master/Markdown.Editor.js"></script>
	<script type="text/javascript" src="https://aymdev.ninja/blog/asset/rsc/pagedown-master/Markdown.Sanitizer.js"></script>
	<script type="text/javascript" src="https://cdn.rawgit.com/google/code-prettify/master/loader/run_prettify.js"></script>
	
	<link rel="canonical" href="https://codepen.io/AymDev/pen/JWvBBv" />
	<!-- <link href="./common/css/pagedown.css" rel="stylesheet" type="text/css" /> -->
	<link rel="stylesheet" type="text/css" href="https://cdn.rawgit.com/google/code-prettify/master/loader/prettify.css" />

	<title>Home</title>
	
	<style class="cp-pen-styles">
		/* STYLE FOR PAGEDOWN */
@import url("https://fonts.googleapis.com/css?family=Questrial");
.wmd-prompt-background {
  background-color: Black;
}

.wmd-prompt-dialog {
  border: 1px solid #999999;
  background-color: #F5F5F5;
}

.wmd-prompt-dialog > div {
  font-size: 0.8em;
  font-family: arial, helvetica, sans-serif;
}

.wmd-prompt-dialog > form > input[type="text"] {
  border: 1px solid #999999;
  color: black;
}

.wmd-prompt-dialog > form > input[type="button"] {
  border: 1px solid #888888;
  font-family: trebuchet MS, helvetica, sans-serif;
  font-size: 0.8em;
  font-weight: bold;
}

.wmd-panel {
  width: 80%;
}
.wmd-panel .wmd-button-bar {
  width: 100%;
  background-color: Silver;
}
.wmd-panel #wmd-input {
  width: calc(100% - 20px);
  min-height: 150px;
  height: auto;
  padding: 10px;
  font-family: sans-serif;
  resize: none;
  overflow-y: hidden;
}

.wmd-button-row {
  position: relative;
  margin-left: 5px;
  margin-right: 5px;
  margin-bottom: 5px;
  margin-top: 10px;
  padding: 0px;
  height: 20px;
}

.wmd-spacer {
  width: 1px;
  height: 20px;
  margin-left: 14px;
  position: absolute;
  background-color: Silver;
  display: inline-block;
  list-style: none;
}

.wmd-button {
  width: 20px;
  height: 20px;
  padding-left: 2px;
  padding-right: 3px;
  position: absolute;
  display: inline-block;
  list-style: none;
  cursor: pointer;
}

.wmd-button > span {
  background-image: url(http://aymdev.ninja/blog/asset/rsc/pagedown-master/wmd-buttons.png);
  background-repeat: no-repeat;
  background-position: 0px 0px;
  width: 20px;
  height: 20px;
  display: inline-block;
}

.wmd-spacer1 {
  left: 50px;
}

.wmd-spacer2 {
  left: 175px;
}

.wmd-spacer3 {
  left: 300px;
}

/*! Color themes for Google Code Prettify | MIT License | github.com/jmblog/color-themes-for-google-code-prettify */
pre.prettyprint {
  padding: 20px 50px !important;
  overflow-x: scroll;
}

.prettyprint {
  background: #2f3640 !important;
  border: 0 !important;
  /* Specify class=linenums on a pre to get line numbering */
}
.prettyprint * {
  font-family: monospace !important;
}
.prettyprint code {
  padding: 0 !important;
}
.prettyprint ol.linenums {
  margin-top: 0 !important;
  margin-bottom: 0 !important;
  color: #656d78 !important;
}
.prettyprint li.L0,
.prettyprint li.L1,
.prettyprint li.L2,
.prettyprint li.L3,
.prettyprint li.L4,
.prettyprint li.L5,
.prettyprint li.L6,
.prettyprint li.L7,
.prettyprint li.L8,
.prettyprint li.L9 {
  padding-left: 1em !important;
  background-color: #2f3640 !important;
  list-style-type: decimal !important;
}
.prettyprint .pln {
  color: #e6e9ed !important;
}
@media screen {
  .prettyprint {
    /* string content */
    /* keyword */
    /* comment */
    /* type name */
    /* literal value */
    /* punctuation */
    /* lisp open bracket */
    /* lisp close bracket */
    /* markup tag name */
    /* markup attribute name */
    /* markup attribute value */
    /* declaration */
    /* variable name */
    /* function name */
  }
  .prettyprint .str {
    color: #ffce54 !important;
  }
  .prettyprint .kwd {
    color: #4fc1e9 !important;
  }
  .prettyprint .com {
    color: #656d78 !important;
  }
  .prettyprint .typ {
    color: #4fc1e9 !important;
  }
  .prettyprint .lit {
    color: #ac92ec !important;
  }
  .prettyprint .pun {
    color: #e6e9ed !important;
  }
  .prettyprint .opn {
    color: #e6e9ed !important;
  }
  .prettyprint .clo {
    color: #e6e9ed !important;
  }
  .prettyprint .tag {
    color: #ed5565 !important;
  }
  .prettyprint .atn {
    color: #a0d468 !important;
  }
  .prettyprint .atv {
    color: #ffce54 !important;
  }
  .prettyprint .dec {
    color: #ac92ec !important;
  }
  .prettyprint .var {
    color: #e6e9ed !important;
  }
  .prettyprint .fun {
    color: #e6e9ed !important;
  }
}

/* CUSTOM STYLE FOR THE PREVIEW */
* {
  margin: 0;
  padding: 0;
  font-family: sans-serif;
  text-decoration: none;
}

#wmd-panel {
  width: 90%;
  padding: 5vh 5%;
}

#wmd-preview {
  width: 80%;
  padding: 5vh 10%;
}
#wmd-preview * {
  width: 100%;
  font-family: "Questrial", sans-serif;
}
#wmd-preview h1 {
  text-decoration: underline;
  color: #7086f1;
}
#wmd-preview h2 {
  color: #7086f1;
}
#wmd-preview p {
  margin-bottom: 1vh;
  line-height: 1.5rem;
}
#wmd-preview p a {
  color: #9eadf6;
}
#wmd-preview p a:hover {
  color: #425fec;
}
#wmd-preview p code {
  padding: 1px !important;
}
#wmd-preview .prettyprint {
  width: calc(100% - 100px);
  overflow-x: scroll;
}
#wmd-preview blockquote {
  border-left: 2px solid #888;
  padding: 5px 15px;
  margin: 5px 0;
  background: #fff6a7;
}
		
	
	
	</style>
	
	<script type="text/javascript">
	
	function file_delete(nm) {
		
		$.ajax({ 
			   url: "file_delete.do", 
			   type: "POST", 
			   data: {"file_nm" : nm},
			   dataType:"text",
			   cache: false,
			   success: function(msg){
				   alert(msg);
			   }
			   , error: function (xhr, ajaxOptions, thrownError) {
			      }
			}); 
		
		
	}
	
	</script>
	
</head>
<body>
<h1>
	Hello world!  
</h1>

<a href="javascript:file_delete('listURL_201503_culture_0.csv')">file delete</a>

<div class="wmd-panel" id="wmd-panel">
  <div id="wmd-button-bar"></div>
  <textarea class="wmd-input" id="wmd-input" name="content">
Written for a tutorial on [Aym:Dev - Blog][1]

Part 3 :
========
using PageDown<br>
using Code Prettify with custom style :

    <script type="text/javascript" src="pagedown-master/Markdown.Converter.js"></script>
    <script type="text/javascript" src="pagedown-master/Markdown.Sanitizer.js"></script>
    <script type="text/javascript" src="pagedown-master/Markdown.Editor.js"></script>

using a modified PageDown Sanitizer to whitelist `<iframe>` :
    
<!-- <iframe height='265' scrolling='no' title='Create a Markdown text editor using PageDown & Code Prettify - Part 1' src='//codepen.io/AymDev/embed/WpMjqr/?height=265&theme-id=0&default-tab=result&embed-version=2' frameborder='no' allowtransparency='true' allowfullscreen='true' style='width: 100%;'>See the Pen <a href='https://codepen.io/AymDev/pen/WpMjqr/'>Create a Markdown text editor using PageDown & Code Prettify - Part 1</a> by Aym Dev (<a href='https://codepen.io/AymDev'>@AymDev</a>) on <a href='https://codepen.io'>CodePen</a>.
</iframe>
 -->

[1]: http://aymdev.ninja/blog/index.php?article=13
  </textarea>
</div>
<div id="wmd-preview" class="wmd-panel wmd-preview"></div>


<script type="text/javascript">
  (function () {
      var converter1 = Markdown.getSanitizingConverter();
      converter1.hooks.chain("preBlockGamut", function (text, rbg) {
          return text.replace(/^ {0,3}""" *\n((?:.*?\n)+?) {0,3}""" *$/gm, function (whole, inner) {
              return "<blockquote>" + rbg(inner) + "</blockquote>\n";
          });
      });
      var editor1 = new Markdown.Editor(converter1);
      editor1.run();
  })();
</script>

<script src="https://production-assets.codepen.io/assets/common/stopExecutionOnTimeout-b2a7b3fe212eaa732349046d8416e00a9dec26eb7fd347590fbced3ab38af52e.js"></script>

<script>
/*

WRITTEN FOR A TUTORIAL ON >> AYM:DEV - BLOG

*/
function Convert() {

	var textarea = document.querySelector('#wmd-input');
	textarea.style.height = "auto";
	textarea.style.height = textarea.scrollHeight + "px";

	// PrettyPrint :
	var preview = document.getElementById('wmd-preview'),
		code_blocks = preview.getElementsByTagName('pre'),
		txt_blocks = preview.getElementsByTagName('p');

	for (var i = 0; i < code_blocks.length; i++) {
		var code_block = code_blocks[i].getElementsByTagName('code');
		if (!code_block[0].classList.contains('prettyprint')) {
			code_block[0].classList.add('prettyprint');
			code_block[0].classList.add('linenums');
			code_blocks[i].classList.add('prettyprint');
			code_blocks[i].classList.add('linenums');
		}
	}

	for (var j = 0; j < txt_blocks.length; j++) {
		var txt_block = txt_blocks[j].getElementsByTagName('code');
		for (var k = 0; k < txt_block.length; k++) {
			if (!txt_block[k].classList.contains('prettyprint')) {
				txt_block[k].classList.add('prettyprint');
			}
		}
	}
	PR.prettyPrint();
}

document.addEventListener("DOMContentLoaded", function (event) {
	var textarea = document.querySelector('#wmd-input');
	Convert();
	textarea.onkeyup = Convert;
});
//# sourceURL=pen.js

</script>

</body>
</html>
