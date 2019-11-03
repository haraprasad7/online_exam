var db=none;
function printDiv(id) { 
    var divContents = document.getElementById(id).innerHTML; 
    var a = window.open('', '', 'height=1000, width=1000'); 
    a.document.write('<html>'); 
    a.document.write('<body > <h1>user results are <br>'); 
    a.document.write(divContents); 
    a.document.write('</body></html>'); 
    a.document.close(); 
    a.print(); 
} 
function sendInfo(user,password,db)  
	{ 
	var url="adduser.jsp?username="+user+"&password="+password+"&db="+db;  
	  
	if(window.XMLHttpRequest){  
	request=new XMLHttpRequest();  
	}  
	else if(window.ActiveXObject){  
	request=new ActiveXObject("Microsoft.XMLHTTP");  
	}  
	  
	try{  
	request.onreadystatechange=getInfo;  
	request.open("GET",url,true);  
	request.send();  
	}catch(e){alert("Unable to connect to server");}  
	}  
	  
	function getInfo(){  
	if(request.readyState==4){  
	var val=request.responseText;  
	document.getElementById('message'+db).innerHTML=val;  
	}  
	}
	function update(id)
	{
		db=id;
		var user=document.getElementById(id+'name').value;
		var password=document.getElementById(id+'password').value;
		sendInfo(user,password,id);
		
	}
	function viewResult()
	{
		var url="showres.jsp";
		if(window.XMLHttpRequest){  
			request=new XMLHttpRequest();  
			}  
			else if(window.ActiveXObject){  
			request=new ActiveXObject("Microsoft.XMLHTTP");  
			}  
			  
			try{  
			request.onreadystatechange=getInfoRes;  
			request.open("GET",url,true);  
			request.send();  
			}catch(e)
				{alert("Unable to connect to server");}  
		
	}
	function getInfoRes(){
		if(request.readyState==4){  
		var val=request.responseText;  
		document.getElementById('showresultsRIGHT').innerHTML=val; 
		} 
}
	function viewResultbyUser()
	{
		var v=document.getElementById('user').value;
		console.log(v);
		
		var url="showres.jsp?val="+v;
		if(window.XMLHttpRequest){  
			request=new XMLHttpRequest();  
			}  
			else if(window.ActiveXObject){  
			request=new ActiveXObject("Microsoft.XMLHTTP");  
			}  
			  
			try{  
			request.onreadystatechange=getInfoUser;  
			request.open("GET",url,true);  
			request.send();  
			}catch(e)
				{alert("Unable to connect to server");}  
		
	}
	function getInfoUser(){ 
		if(request.readyState==4){  
		var val=request.responseText;  
		document.getElementById('showresults').innerHTML=val;
		
		
		v=document.getElementById('user').value;
		if(v.length==0)
			{
			document.getElementById('showresults').innerHTML="";
			}
		
		} 
}
	