﻿var LZString={_f:String.fromCharCode,_keyStrBase64:"ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/\x3d",_keyStrUriSafe:"ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+-$",_getBaseValue:function(a,g){LZString._baseReverseDic||(LZString._baseReverseDic={});if(!LZString._baseReverseDic[a]){LZString._baseReverseDic[a]={};for(var h=0;h<a.length;h++)LZString._baseReverseDic[a][a[h]]=h}return LZString._baseReverseDic[a][g]},compressToBase64:function(a){if(null==a)return"";
a=LZString._compress(a,6,function(a){return LZString._keyStrBase64.charAt(a)});switch(a.length%4){default:case 0:return a;case 1:return a+"\x3d\x3d\x3d";case 2:return a+"\x3d\x3d";case 3:return a+"\x3d"}},decompressFromBase64:function(a){return null==a?"":""==a?null:LZString._decompress(a.length,32,function(g){return LZString._getBaseValue(LZString._keyStrBase64,a.charAt(g))})},compressToUTF16:function(a){return null==a?"":LZString._compress(a,15,function(a){return String.fromCharCode(a+32)})+" "},
decompressFromUTF16:function(a){return null==a?"":""==a?null:LZString._decompress(a.length,16384,function(g){return a.charCodeAt(g)-32})},compressToUint8Array:function(a){a=LZString.compress(a);for(var g=new Uint8Array(2*a.length),h=0,f=a.length;h<f;h++){var c=a.charCodeAt(h);g[2*h]=c>>>8;g[2*h+1]=c%256}return g},decompressFromUint8Array:function(a){if(null===a||void 0===a)return LZString.decompress(a);for(var g=Array(a.length/2),h=0,f=g.length;h<f;h++)g[h]=256*a[2*h]+a[2*h+1];var c=[];g.forEach(function(a){c.push(String.fromCharCode(a))});
return LZString.decompress(c.join(""))},compressToEncodedURIComponent:function(a){return null==a?"":LZString._compress(a,6,function(a){return LZString._keyStrUriSafe.charAt(a)})},decompressFromEncodedURIComponent:function(a){if(null==a)return"";if(""==a)return null;a=a.replace(/ /g,"+");return LZString._decompress(a.length,32,function(g){return LZString._getBaseValue(LZString._keyStrUriSafe,a.charAt(g))})},compress:function(a){return LZString._compress(a,16,function(a){return String.fromCharCode(a)})},
_compress:function(a,g,h){if(null==a)return"";var f,c,r={},t={},k="",u="",m="",n=2,q=3,e=2,p=[],b=0,d=0,l;for(l=0;l<a.length;l+=1)if(k=a[l],Object.prototype.hasOwnProperty.call(r,k)||(r[k]=q++,t[k]=!0),u=m+k,Object.prototype.hasOwnProperty.call(r,u))m=u;else{if(Object.prototype.hasOwnProperty.call(t,m)){if(256>m.charCodeAt(0)){for(f=0;f<e;f++)b<<=1,d==g-1?(d=0,p.push(h(b)),b=0):d++;c=m.charCodeAt(0);for(f=0;8>f;f++)b=b<<1|c&1,d==g-1?(d=0,p.push(h(b)),b=0):d++,c>>=1}else{c=1;for(f=0;f<e;f++)b=b<<1|
c,d==g-1?(d=0,p.push(h(b)),b=0):d++,c=0;c=m.charCodeAt(0);for(f=0;16>f;f++)b=b<<1|c&1,d==g-1?(d=0,p.push(h(b)),b=0):d++,c>>=1}n--;0==n&&(n=Math.pow(2,e),e++);delete t[m]}else for(c=r[m],f=0;f<e;f++)b=b<<1|c&1,d==g-1?(d=0,p.push(h(b)),b=0):d++,c>>=1;n--;0==n&&(n=Math.pow(2,e),e++);r[u]=q++;m=String(k)}if(""!==m){if(Object.prototype.hasOwnProperty.call(t,m)){if(256>m.charCodeAt(0)){for(f=0;f<e;f++)b<<=1,d==g-1?(d=0,p.push(h(b)),b=0):d++;c=m.charCodeAt(0);for(f=0;8>f;f++)b=b<<1|c&1,d==g-1?(d=0,p.push(h(b)),
b=0):d++,c>>=1}else{c=1;for(f=0;f<e;f++)b=b<<1|c,d==g-1?(d=0,p.push(h(b)),b=0):d++,c=0;c=m.charCodeAt(0);for(f=0;16>f;f++)b=b<<1|c&1,d==g-1?(d=0,p.push(h(b)),b=0):d++,c>>=1}n--;0==n&&(n=Math.pow(2,e),e++);delete t[m]}else for(c=r[m],f=0;f<e;f++)b=b<<1|c&1,d==g-1?(d=0,p.push(h(b)),b=0):d++,c>>=1;n--;0==n&&(Math.pow(2,e),e++)}c=2;for(f=0;f<e;f++)b=b<<1|c&1,d==g-1?(d=0,p.push(h(b)),b=0):d++,c>>=1;for(;;)if(b<<=1,d==g-1){p.push(h(b));break}else d++;return p.join("")},decompress:function(a){return null==
a?"":""==a?null:LZString._decompress(a.length,32768,function(g){return a.charCodeAt(g)})},_decompress:function(a,g,h){var f=[],c=4,r=4,t=3,k="",u=[],m,n,q,e,p,b=LZString._f,d=h(0),l=g,v=1;for(m=0;3>m;m+=1)f[m]=m;k=0;q=Math.pow(2,2);for(e=1;e!=q;)n=d&l,l>>=1,0==l&&(l=g,d=h(v++)),k|=(0<n?1:0)*e,e<<=1;switch(k){case 0:k=0;q=Math.pow(2,8);for(e=1;e!=q;)n=d&l,l>>=1,0==l&&(l=g,d=h(v++)),k|=(0<n?1:0)*e,e<<=1;p=b(k);break;case 1:k=0;q=Math.pow(2,16);for(e=1;e!=q;)n=d&l,l>>=1,0==l&&(l=g,d=h(v++)),k|=(0<n?
1:0)*e,e<<=1;p=b(k);break;case 2:return""}m=f[3]=p;for(u.push(p);;){if(v>a)return"";k=0;q=Math.pow(2,t);for(e=1;e!=q;)n=d&l,l>>=1,0==l&&(l=g,d=h(v++)),k|=(0<n?1:0)*e,e<<=1;switch(p=k){case 0:k=0;q=Math.pow(2,8);for(e=1;e!=q;)n=d&l,l>>=1,0==l&&(l=g,d=h(v++)),k|=(0<n?1:0)*e,e<<=1;f[r++]=b(k);p=r-1;c--;break;case 1:k=0;q=Math.pow(2,16);for(e=1;e!=q;)n=d&l,l>>=1,0==l&&(l=g,d=h(v++)),k|=(0<n?1:0)*e,e<<=1;f[r++]=b(k);p=r-1;c--;break;case 2:return u.join("")}0==c&&(c=Math.pow(2,t),t++);if(f[p])k=f[p];else if(p===
r)k=m+m[0];else return null;u.push(k);f[r++]=m+k[0];c--;m=k;0==c&&(c=Math.pow(2,t),t++)}}};"undefined"!==typeof module&&null!=module&&(module.exports=LZString);