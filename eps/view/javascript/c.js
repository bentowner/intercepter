if(c_unit==='undefined'){var c_unit=1;}
if(c_unit==1){
var msg_note="Enter carton dimensions(length, width, height) to calculate cubic feet(ft³) and cubic meters(m³).";}
else {
var msg_note="Enter carton dimensions(length, width, height) to calculate cubic meters(m³) and cubic feet(ft³) .";}

var msg_totalvolume="Total freight volume is ";
var msg_cbm=" cubic meters(m³)";
var msg_or =" or ";
var msg_cuft=" cubic feet(ft³)";
var msg_totalgw ="Total gross weight is ";
var msg_volumeweight=" volume weight is ";
var msg_lbs=" lbs.";
var msg_kgs=" kgs";
var msg_20ft="20' GP container can load ";
var msg_40ft="40' GP container can load ";
var msg_40fthq="40' HQ container can load ";
var msg_cartons=" cartons";

function _gel(n){return document.getElementById(n);}
function x(c,b){var s = Array(Array(b[0],b[1],b[2]),Array(b[0],b[2],b[1]),Array(b[1],b[0],b[2]),Array(b[1],b[2],b[0]),Array(b[2],b[0],b[1]),Array(b[2],b[1],b[0]));
var r = new Array(-1,0);for(i=0;i<6;i++){
t = Math.floor(c[0]/s[i][0]) * Math.floor(c[1]/s[i][1]) * Math.floor(c[2]/s[i][2]);
if (r[0]==-1){r[0]=t;} else {r[0]= Math.min(t,r[0]);}
r[1] = Math.max(t,r[1]);} 
return r ;}

function ac(){
var nFeeTotal,nFeeTotal2,nWeightTotal,nWeightTotal2, sMsg ;
var n1, n2, n3 , n4;
if (isNaN(_gel("l").value)){n1=0;} else{n1=parseFloat(_gel("l").value);}
if (isNaN(_gel("w").value)){n2=0;} else{n2=parseFloat(_gel("w").value);}
if (isNaN(_gel("h").value)){n3=0;} else{n3=parseFloat(_gel("h").value);}
if(isNaN(_gel("q").value)) {_gel("q").value=1;};
n4 = parseFloat(_gel("q").value);
if(c_unit==1){  n1 = n1 * 2.54 ;n2 = n2 * 2.54 ;n3 = n3 * 2.54 ;}
nFeeTotal = Math.round( n1 * n2 * n3 * 0.00353 * n4 ) /100;
nFeeTotal2 =  Math.round(n1 * n2 * n3 * n4 / 10000) /100; 

if ((n1>0)&&(n2>0)&&(n3>0)){
 sMsg = msg_totalvolume+nFeeTotal2+msg_cbm+msg_or+nFeeTotal+msg_cuft;
} else {sMsg = "";}

if(isNaN(_gel("gw").value)) { _gel("gw").value = 0 ;};
var ctngw = _gel("gw").value ; 
if (c_unit==1){ctngw = ctngw * 0.45359237;}
nWeightTotal = Math.round(n4 * ctngw * 10) / 10 ;
nWeightTotal2 = Math.round(n1* n2 * n3 * n4 / 500) /10 ;
nWeightTotal_lb= Math.round(n4 * ctngw * 22.0462)/10;
nWeightTotal2_lb = Math.round(n1* n2 * n3 * n4 * 22.0462 / 5000) /10 ;

//Fedex/DHL/UPS oversize/overweight
var maxs=Math.max(n1,n2,n3);
var s;
if(maxs==n1){s=(n2+n3)*2+n1;}
else if(maxs==n2){s=(n1+n3)*2+n2;}
else {s=(n1+n2)*2+n3;}
fos=(s>330||maxs>274);fow=(ctngw>68);//Fedex
dos=maxs>120;dow=ctngw>70;//DHL
uos=maxs>152;uow=ctngw>31;//UPS 
var os='';
if(fos||dos||uos){os+='Oversize package of ';if(fos)os+='FedEx';
if(dos){if(fos)os+=',';os+='DHL';}
if(uos){if(fos||dos)os+=',';os+='UPS';}
}
if(fow||dow||uow){if(os!='')os=os+"<br>";os+='Overweight package of ';if(fow)os+='FedEx';
if(dow){if(fow)os+=',';os+='DHL';}
if(uow){if(fow||dow)os+=',';os+='UPS';}
}

if(os!=''){sMsg=sMsg+"<br><span style=\"color:#ff4400\">"+os+'</span>';}

if ((nWeightTotal>0)||(nWeightTotal2>0)){
sMsg = sMsg + "<br>" + msg_totalgw +  nWeightTotal + msg_kgs + msg_or + nWeightTotal_lb + msg_lbs;//Math.round(nWeightTotal * 22.046)/10 + msg_lbs;
  if (nWeightTotal2 > nWeightTotal){
  sMsg = sMsg + ",<span style=\"color:#ff3300\">" + msg_volumeweight 
  + nWeightTotal2 + msg_kgs + msg_or + nWeightTotal2_lb+ msg_lbs + "</span>"; } ;//Math.round(nWeightTotal2 * 22.046)/10 + msg_lbs + "</span>"; }
}

if(sMsg==""){_gel("msg").innerHTML = msg_note;} else {_gel("msg").innerHTML = sMsg ;}

if ((n1>0)&&(n2>0)&&(n3>0)){
sMsg = "";
var r = x(Array(589,230,230),Array(n1,n2,n3));
if ((r[0]>0) && (r[1]>0)){
sMsg=msg_20ft+r[0]; 
if (r[0]!=r[1]){sMsg=sMsg+"~"+r[1];}
sMsg=sMsg+msg_cartons;
}

var r = x(Array(1200,230,230),Array(n1,n2,n3));
if ((r[0]>0) && (r[1]>0)){ 
sMsg=sMsg+"<br>"+msg_40ft+r[0];
if (r[0]!=r[1]){sMsg=sMsg+"~"+r[1];}
sMsg=sMsg+msg_cartons;
}

var r = x(Array(1200,230,260),Array(n1,n2,n3));
if ((r[0]>0) && (r[1]>0)){
sMsg=sMsg+"<br>"+msg_40fthq+r[0];
if (r[0]!=r[1]){sMsg=sMsg+"~"+r[1];}
sMsg=sMsg+msg_cartons;
_gel("msg2").innerHTML=sMsg ;
}}}
_gel("msg").innerHTML=msg_note;
