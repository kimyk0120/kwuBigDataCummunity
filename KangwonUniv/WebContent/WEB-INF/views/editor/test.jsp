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
	
    <title>jQuery tagEditor Plugin</title>
    <meta name="description" content="A lightweight and sophisticated tag editor for jQuery. Sortable, editable tags with cursor navigation, autocomplete, and callbacks." />
    <link rel="shortcut icon" href="https://pixabay.com/favicon.ico" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300" />
    <link rel="stylesheet" href="https://cdn.rawgit.com/yahoo/pure-release/v0.6.0/pure-min.css" />
    <style>
        body { margin: 0; padding: 0; border: 0; min-width: 320px; color: #777; }
        html, button, input, select, textarea, .pure-g [class *= "pure-u"] { font-family: "Helvetica Neue", Helvetica, Arial, sans-serif; font-size: 1.02em; }
        p, td { line-height: 1.5; }
        ul { padding: 0 0 0 20px; }

        th { background: #eee; white-space: nowrap; }
        th, td { padding: 10px; text-align: left; vertical-align: top; font-size: .9em; font-weight: normal; border-right: 1px solid #fff; }
        td:first-child { white-space: nowrap; color: #008000; width: 1%; font-style: italic; }

        h1, h2, h3 { color: #4b4b4b; font-family: "Source Sans Pro", sans-serif; font-weight: 300; margin: 0 0 1.2em; }
        h1 { font-size: 4.5em; color: #1f8dd6; margin: 0 0 .4em; }
        h2 { font-size: 2em; color: #636363; }
        h3 { font-size: 1.8em; color: #4b4b4b; margin: 1.8em 0 .8em }
        h4 { font: bold 1em sans-serif; color: #636363; margin: 4em 0 1em; }
        a { color: #4e99c7; text-decoration: none; }
        a:hover { text-decoration: underline; }
        p, pre { margin: 0 0 1.2em; }
        ::selection { color: #fff; background: #328efd; }
        ::-moz-selection { color: #fff; background: #328efd; }

        @media (max-width:480px) {
            h1 { font-size: 3em; }
            h2 { font-size: 1.8em; }
            h3 { font-size: 1.5em; }
            td:first-child { white-space: normal; }
        }

        .inline-code { padding: 1px 5px; background: #eee; border-radius: 2px; }
        pre { padding: 15px 10px; font-size: .9em; color: #555; background: #edf3f8; }
        pre i { color: #aaa; } /* comments */
        pre b { font-weight: normal; color: #cf4b25; } /* strings */
        pre em { color: #0c59e9; } /* numeric */

        /* Pure CSS */
        .pure-button { margin: 5px 0; text-decoration: none !important; }
        .button-lg { margin: 5px 0; padding: .65em 1.6em; font-size: 105%; }
        .button-sm { font-size: 85%; }

        textarea {
            width: 100%; height: 29px; padding: .3em .5em; border: 1px solid #ddd; font-size: .9em;
            box-sizing: border-box; margin: 0 0 20px;
        }
        textarea[readonly] { color: #aaa; background: #f7f7f7; }

        #response {
            margin: 0 0 1.2em; padding: 10px; background: #f3f3f3; color: #777;
            font-size: .9em; max-height: 150px; overflow: hidden; overflow-y: auto;
        }
        #response i { font-style: normal; color: #cf4b25; }
        #response hr { margin: 2px 0; border: 0; border-top: 1px solid #eee; border-bottom: 1px solid #fdfdfd; }

        /* overwrite default CSS for tiny, dark tags in demo5 */
        #demo5+.tag-editor { background: #fafafa; font-size: 12px; }
        #demo5+.tag-editor .tag-editor-tag { color: #fff; background: #555; border-radius: 2px; }
        #demo5+.tag-editor .tag-editor-spacer { width: 7px; }
        #demo5+.tag-editor .tag-editor-delete { display: none; }

        /* color tags */
        .tag-editor .red-tag .tag-editor-tag { color: #c65353; background: #ffd7d7; }
        .tag-editor .red-tag .tag-editor-delete { background-color: #ffd7d7; }
        .tag-editor .green-tag .tag-editor-tag { color: #45872c; background: #e1f3da; }
        .tag-editor .green-tag .tag-editor-delete { background-color: #e1f3da; }
    </style>
    <script type="text/javascript">
    
    function goSave() {
    	
    	document.mainform.action = "save.do";
		document.mainform.submit();
    }
    
    </script>
    <link rel="stylesheet" href="common/css/jquery.tag-editor.css" />
</head>
<body>
<form id="mainform" name="mainform" method="post">
    <div style="max-width:900px;padding:0 10px;margin:40px auto;text-align:center">
        <h1>tagEditor</h1>
        <h2>A powerful and lightweight tag editor plugin for jQuery.</h2>
        <a href="https://github.com/Pixabay/jQuery-tagEditor/archive/master.zip" class="pure-button pure-button-primary button-lg">Download</a>
        &nbsp;
        <a href="https://github.com/Pixabay/jQuery-tagEditor" class="pure-button button-lg">View on GitHub</a>
    </div>
    <div style="border-top: 1px solid #eee;border-bottom:1px solid #eee;background:#fafafa;margin:30px 0;padding:20px 5px">
        <div style="padding :0 7px 0 5px;max-width:900px;margin:auto">
            <textarea id="hero-demo">example tags, sortable, autocomplete, edit in place, tab/cursor navigation, duplicate check, callbacks, copy-paste, placeholder, public methods, custom delimiter, graceful degradation</textarea>
        </div>
    </div>
    <div style="max-width:900px;margin:auto;padding:0 10px 50px">
        <h3>Overview and Features</h3>
       
        <div style="margin:0 0 1.2em">
            <p>The original field - textarea or text input - is normally hidden automatically. We show it here to make value changes visible:</p>
            <textarea id="demo1" name="demo1"></textarea>
        </div>
        <p>
            The placeholder is visible when all tags are deleted and the editor looses focus.
            jQuery UI is already loaded on this page - and by default, tags are then sortable via drag and drop.
        </p>

        <h4>Autocomplete</h4>
        <p>
            For enabling tag autocompletion, make sure to have <a href="https://jqueryui.com/autocomplete/">jQuery UI autocomplete</a> readily loaded.
            You can then pass <i>any</i> options that work with UI autocomplete to your tagEditor settings.
        </p>
      
        <div style="margin:0 0 1.2em"><textarea id="demo2" name="demo2"></textarea></div>

        <p>
            In the example, we simply add CSS classes to the <span class="inline-code">&lt;li&gt;</span> elements.
            This is just an exampe of what the onChange callback may be used for. Inside of it, <span class="inline-code">addTag</span> and <span class="inline-code">removeTag</span> may be called to dynamically change the current list of tags.
        </p>

        <div style="margin:40px 0;overflow:hidden">
            <span id="github_social"></span>
            <div style="float:left;margin-right:35px">
                <a href="#" data-width="70" class="twitter-share-button" data-text="jQuery tagEditor Plugin"></a>
            </div>
            <div style="float:left">
                <div class="g-plusone" data-size="medium"></div>
            </div>
            <div style="float:left;width:140px" class="fb-like" data-send="false" data-layout="button_count" data-width="140" data-show-faces="false"></div>
        </div>

        <p style="border-top:1px solid #eee;padding-top:30px">Please report any bugs and issues at the <a href="https://github.com/Pixabay/jQuery-tagEditor">GitHub repositiory</a>.</p>
        <p>This software is released as Open Source under the <a href="http://www.opensource.org/licenses/mit-license.php">MIT License</a> by <a href="https://pixabay.com/users/Simon/">Simon Steinberger / Pixabay.com</a>.</p>

    </div>
    
    <div style="max-width:900px;padding:0 10px;margin:40px auto;text-align:center">
        <a onclick="javascript:goSave()" class="pure-button button-lg">Save</a>
    </div>
</form>
    <script src="common/js/jquery-1.10.2.min.js"></script>
    <script src="common/js/jquery-ui.min.js"></script>
    <script src="common/js/jquery.caret.min.js"></script>
    <script src="common/js/jquery.tag-editor.js"></script>
    <script>
        // jQuery UI autocomplete extension - suggest labels may contain HTML tags
        // github.com/scottgonzalez/jquery-ui-extensions/blob/master/src/autocomplete/jquery.ui.autocomplete.html.js
        (function($){var proto=$.ui.autocomplete.prototype,initSource=proto._initSource;function filter(array,term){var matcher=new RegExp($.ui.autocomplete.escapeRegex(term),"i");return $.grep(array,function(value){return matcher.test($("<div>").html(value.label||value.value||value).text());});}$.extend(proto,{_initSource:function(){if(this.options.html&&$.isArray(this.options.source)){this.source=function(request,response){response(filter(this.options.source,request.term));};}else{initSource.call(this);}},_renderItem:function(ul,item){return $("<li></li>").data("item.autocomplete",item).append($("<a></a>")[this.options.html?"html":"text"](item.label)).appendTo(ul);}});})(jQuery);

        var cache = {};
        function googleSuggest(request, response) {
            var term = request.term;
            if (term in cache) { response(cache[term]); return; }
            $.ajax({
                url: 'https://query.yahooapis.com/v1/public/yql',
                dataType: 'JSONP',
                data: { format: 'json', q: 'select * from xml where url="http://google.com/complete/search?output=toolbar&q='+term+'"' },
                success: function(data) {
                    var suggestions = [];
                    try { var results = data.query.results.toplevel.CompleteSuggestion; } catch(e) { var results = []; }
                    $.each(results, function() {
                        try {
                            var s = this.suggestion.data.toLowerCase();
                            suggestions.push({label: s.replace(term, '<b>'+term+'</b>'), value: s});
                        } catch(e){}
                    });
                    cache[term] = suggestions;
                    response(suggestions);
                }
            });
        }

        $(function() {
        	
            $('#hero-demo').tagEditor({
                placeholder: 'Enter tags ...',
                autocomplete: { source: googleSuggest, minLength: 3, delay: 250, html: true, position: { collision: 'flip' } }
            });

            $('#demo1').tagEditor({ 
            	initialTags: [
						<c:forEach items="${demo}" var="a" varStatus="esgStatus">
						"${a}"
						<c:if test="${!esgStatus.last}">    
						,    
						</c:if>
						</c:forEach>
            	              ], 
            	delimiter: ', ', 
            	placeholder: 'Enter tags ...' }).css('display', 'block').attr('readonly', true);

            $('#demo2').tagEditor({
                autocomplete: { delay: 0, position: { collision: 'flip' }, source: ['ActionScript', 'AppleScript', 'Asp', 'BASIC', 'C', 'C++', 'CSS', 'Clojure', 'COBOL', 'ColdFusion', 'Erlang', 'Excel','Fortran', 'Groovy', 'Haskell', 'HTML', 'Java', 'JavaScript', 'Lisp', 'Perl', 'PHP', 'Python', 'R', 'Ruby', 'Scala', 'Scheme'] },
                forceLowercase: false,
                placeholder: 'Programming languages ...'
            });

        });
    </script>
    
</body>
</html>
