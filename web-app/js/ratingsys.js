/*
Author: Addam M. Driver
Date: 10/31/2006
*/

var sMax;	// Is the maximum number of stars
var preSet=new Array(); // Is the previous value once a selection has been made
var rated=new Array();

// Rollover for image Stars //
function rating(me,code){
	sMax = 0;	// Is the maximum number of stars
//	for(n=0; n<me.parentNode.childNodes.length; n++){
//		if(me.parentNode.childNodes[n].nodeName == "A"){
//			sMax++;	
//		}
//	}
sMax=5	
	if(!rated[code]){
		s = me.parentNode.id.replace(code+"_", ''); // Get the selected star
		a = 0;
		for(i=1; i<=sMax; i++){		
			if(i<=s){
				document.getElementById(code+"_"+i).className = "star hover";
				document.getElementById(code+"_rateStatus").innerHTML = me.title;	
				a++;
			}else{
				document.getElementById(code+"_"+i).className = "star";
			}
		}
	}
}

// For when you roll off of the the whole thing //
function off(me, code){
	if(!rated[code]){
		if(!preSet[code]){	
			for(i=1; i<=sMax; i++){		
				document.getElementById(code+"_"+i).className = "star";
				document.getElementById(code+"_rateStatus").innerHTML = me.parentNode.parentNode.title;
			}
		}else{
			rating(preSet[code],code);
			document.getElementById(code+"_rateStatus").innerHTML = document.getElementById(code+"_ratingSaved").innerHTML;
		}
	}
}

// When you actually rate something //
function rateIt(me, code){
	if(!rated[code]){
		document.getElementById(code+"_rateStatus").innerHTML = document.getElementById(code+"_ratingSaved").innerHTML + " :: "+me.title;
		preSet[code] = me;
		rated[code]=1;
		sendRate(me,code);
		rating(me,code);
	}
}

// Send the rating information somewhere using Ajax or something like that.
function sendRate(me,code){
    s = me.parentNode.id.replace(code+"_", ''); // Get the selected star
    document.getElementById("rating_"+code).value = s;

}
