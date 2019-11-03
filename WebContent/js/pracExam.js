
try
{
	var questions=[];
	var qus=[];
	var answer=[];
	var col=[];
	var c;
	var i;
	var noq;
	var answerhead="THE CORRECT ANSWER IS:";
	var coranswer=[];
	function callAnimation(gotId)
	{
		document.getElementById("1").disabled=true;
		document.getElementById("2").disabled=true;
		document.getElementById("1").style.backgroundColor="red";
		document.getElementById("2").style.backgroundColor="red";
		document.getElementById("1").style.color="black";
		document.getElementById("2").style.color="black";
		var elem=gotId;
		elem.style.visibility="visible";
		var pos=0;
		var id=setInterval(frame,10);
		function frame()
		{
			if(pos>=80)
				{
					document.getElementById("1").disabled=false;
					document.getElementById("2").disabled=false;
					
					document.getElementById("1").style.backgroundColor="#4CAF50";
					document.getElementById("2").style.backgroundColor="#4CAF50";
					
					document.getElementById("1").style.color="white";
					document.getElementById("2").style.color="white";
					
					clearInterval(id);
					elem.style.visibility="hidden";
				
				}
			else
				{
					pos=pos+0.3;
					 elem.style.left = pos + '%'; 
				}
		}
		
		
	}
	function addQuestion() 
	{	
		
		var x=document.getElementsByName("qus");
		var len=x.length;
		var qus=x[len-1].innerHTML.split(':-:');
		answer.push(0);
		col.push(0);
	    questions.push({
	        key: qus[0] ,
	        question : qus[1],
	        opt1 : qus[2],
			opt2 : qus[3],
			opt3 : qus[4],
			opt4 : qus[5],
			ans	 : qus[6]
	    });
	 }
	function checkAnswer(id)
	{
//		alert("oncicked radiobutton");
//		alert(id);
//		alert(id);
//		alert(questions[c].ans);
			if(document.getElementById("r1").checked)
				answer[c]="r1";
			else if(document.getElementById("r2").checked)
				answer[c]="r2";
			else if(document.getElementById("r3").checked)
				answer[c]="r3";
			else if(document.getElementById("r4").checked)
				answer[c]="r4";
			
			if(id!=questions[c].ans)
				{
					var x=document.getElementById("o"+questions[c].ans).textContent;
					/*alert("Your answer is incorrect");
					 alert("Correct answer is option :"+x);*/			
					//alert("Correct answer is:"+x)
					/*document.getElementById("o"+id).style.backgroundColor="red";*/
					document.getElementById("o"+id).style.color="red";
					
					document.getElementById('anshead').innerHTML=answerhead;
					document.getElementById('answer').innerHTML=x;
					coranswer[c]=x;
					col[c]="red";
					
					for(var z=1;z<=4;z++)
						{
							document.getElementById("r"+z).disabled=true;
						}
					callAnimation(document.getElementById("image1"));
				}
			else
				{
					var x=document.getElementById("o"+questions[c].ans).textContent;
					document.getElementById('anshead').innerHTML=answerhead;
					document.getElementById('answer').innerHTML=x;
					coranswer[c]=x;
					document.getElementById("r"+id).style.backgroundColor="#80ff00";
					//document.getElementById("o"+id).style.backgroundColor="green";
					document.getElementById("o"+id).style.color="#80ff00";
					col[c]="#80ff00";
					for(var z=1;z<=4;z++)
					{
						document.getElementById("r"+z).disabled=true;
					}
					callAnimation(document.getElementById("image2"));
				}
	}
	
	function bclick(i)
	{
		c=i;
		if(answer[c]!=0 && col[c]!=0)
			
			{
				document.getElementById(answer[c]).checked=true;
			
				for(var z=1;z<=4;z++)
				{
					//document.getElementById("o"+z).style.backgroundColor="white";
					document.getElementById("o"+z).style.color="black";
				}
				
				if(col[c].localeCompare("#80ff00")==0)
				{
					//document.getElementById("o"+answer[c].substring(1)).style.backgroundColor="green";
					document.getElementById("o"+answer[c].substring(1)).style.color="#80ff00";
				}
					
				else if(col[c].localeCompare("red")==0)
				{
					//document.getElementById("o"+answer[c].substring(1)).style.backgroundColor="red";
					document.getElementById("o"+answer[c].substring(1)).style.color="red";
				}
				
				for(var z=1;z<=4;z++)
				{
						document.getElementById("r"+z).disabled=true;
				}
				
				document.getElementById('anshead').innerHTML=answerhead;

				document.getElementById('answer').innerHTML=coranswer[c];
			}
		else
			{
			
					for(var z=1;z<=4;z++)
					{
	//					document.getElementById("o"+z).style.backgroundColor="white";
						document.getElementById("o"+z).style.color="black";
					}
					
					document.getElementById('anshead').innerHTML=" ";
					document.getElementById('answer').innerHTML=" ";
					
					for(var z=1;z<=4;z++)
					{
						document.getElementById("r"+z).checked=false;
					}
					
					for(var z=1;z<=4;z++)
					{
							document.getElementById("r"+z).disabled=false;
					}
			}
		//document.getElementById("err").innerHTML=answer[c];
		document.getElementById("q").innerHTML= questions[i].key+"."+questions[i].question;
		document.getElementById("o1").innerHTML= questions[i].opt1;
		document.getElementById("o2").innerHTML= questions[i].opt2;
		document.getElementById("o3").innerHTML= questions[i].opt3;
		document.getElementById("o4").innerHTML= questions[i].opt4;
		
	}
	function next()
	{
		if(c<(noq-1))
		{
			c=c+1;
			bclick(c);
		}
		else
		{
			bclick(0);
		}
		
	}
	function previous()
	{
		if(c!=-1 && c!=0)
		{
			c=c-1;
			bclick(c);
		}
		else
		{
			bclick(noq-1);
		}
	}
	
	function getLength(length)
	{
		noq=length;
	}
	
	
}
catch (e)
{
	document.getElementById("p").innerHTML="error is"+e;
}