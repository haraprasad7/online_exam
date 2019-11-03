try
{

	var questions=[];
	var qus=[];
	var answer=[];
	var a=59;
	var minute=5;
	var func=setInterval(timedisplay,1000);
	function timedisplay()
	{
		console.log("hii");
		document.getElementById("txtHint").innerHTML = a;
		document.getElementById("minute").innerHTML = minute;
		a=a-1;
		if(minute==2)
			{
			clearInterval(func);
			submit();
			}
		if(a==0)
		{
		a=59;
		minute=minute-1;
		}
	}
	/*var request;  
	function sendInfo()  
	{ 
	var url="answertest.jsp?q="+c+"&a="+answer[c];  
	  
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
	document.getElementById('amit').innerHTML=val;  
	}  
	} */ 
	
	function addQuestion() 
	{	
		var x=document.getElementsByName("qus");
		var len=x.length;
		var qus=x[len-1].innerHTML.split(':-:');
		answer.push(0);
		
	    questions.push({
	        key: qus[0] ,
	        question : qus[1],
	        opt1 : qus[2],
			opt2 : qus[3],
			opt3 : qus[4],
			opt4 : qus[5]
	    });
	 }
	function bclick(i)
	{
		console.log("hi in bcick");
		c=i;
		if(answer[c]!=0)
			{
				document.getElementById("r"+String(answer[c])).checked=true;
			}
		else
			{
				document.getElementById("r1").checked=false;
				document.getElementById("r2").checked=false;
				document.getElementById("r3").checked=false;
				document.getElementById("r4").checked=false;
			}
		document.getElementById("q").innerHTML= questions[i].key+"."+questions[i].question;
		document.getElementById("o1").innerHTML= questions[i].opt1;
		document.getElementById("o2").innerHTML= questions[i].opt2;
		document.getElementById("o3").innerHTML= questions[i].opt3;
		document.getElementById("o4").innerHTML= questions[i].opt4;
		
	}
	function next()
	{
		console.log(answer.length)
		if(c<answer.length)
		{
			c=c+1;
			bclick(c);
		}
		else
			bclick(0);	
	}
	
	function mark()
	{
		if(document.getElementById("r1").checked)
			answer[c]=1;
		else if(document.getElementById("r2").checked)
			answer[c]=2;
		else if(document.getElementById("r3").checked)
			answer[c]=3
		else if(document.getElementById("r4").checked)
			answer[c]=4;
		else
			answer[c]=0;
		//sendInfo();
		document.getElementById(c).style.backgroundColor="RGB(255,100,0)";
		next();
	}
	function savenext()
	{
		if(document.getElementById("r1").checked)
			answer[c]=1;
		else if(document.getElementById("r2").checked)
			answer[c]=2;
		else if(document.getElementById("r3").checked)
			answer[c]=3;
		else if(document.getElementById("r4").checked)
			answer[c]=4;
		else
			answer[c]=0;
		//sendInfo();
		if(answer[c]!=0)
			document.getElementById(c).style.backgroundColor="RGB(127,255,0)";
		next();
	}
	function previous()
	{
		if(c!=0)
		{
			c=c-1;
			bclick(c);
		}
		else
			bclick(answer.length);
	}
	function saveprevious()
	{
		if(document.getElementById("r1").checked)
			answer[c]=1;
		else if(document.getElementById("r2").checked)
			answer[c]=2;
		else if(document.getElementById("r3").checked)
			answer[c]=3;
		else if(document.getElementById("r4").checked)
			answer[c]=4;
		else
			answer[c]=0;
		//sendInfo();
		if(answer[c]!=0)
			document.getElementById(c).style.backgroundColor="RGB(127,255,0)";
		previous();
	}
	
	function submit(){
		
		
		/*// Get the modal
		var modal = document.getElementById("myModal");
		modal.style.display = "block";


		// Get the <span> element that closes the modal
		var span = document.getElementsByClassName("close")[0];

		// When the user clicks on <span> (x), close the modal
		span.onclick = function() {
		  modal.style.display = "none";
		}

		function close2(){
			
			modal.style.display = "none";
		}

		// When the user clicks anywhere outside of the modal, close it
		window.onclick = function(event) {
		  if (event.target == modal) {
		    //modal.style.display = "block";
		  }
		}
		
		function ok(){
*/			//alert("submit");
			//window.location="http://localhost:9090/Exam/result_calculate.jsp?res="+answer;
			if(window.XMLHttpRequest){  
				xhttp=new XMLHttpRequest();  
			}  
			else if(window.ActiveXObject){  
				xhttp=new ActiveXObject("Microsoft.XMLHTTP");  
			}  
			//alert(answer);
			xhttp.open("GET", "http://localhost:8080/exam/result_calculate.jsp?subject="+document.getElementById('subname').textContent+"&res="+answer, false);
			xhttp.send();
			document.getElementById("resultPage").innerHTML=String(xhttp.responseText);
			//alert("submit");
		//}
	}
}
catch (e)
{
	document.getElementById("p").innerHTML="error is"+e;
}