import{K as H,j as g,r as e,o as j,c as G,w as t,u as i,a as n,g as p,d as o,t as b,m as U,b as a}from"./app-089cc349.js";let L=navigator.language.split("-")[0];const _=["pt","en","es"];var v="en",m=_.includes(L)?_.indexOf(L):1;m>-1&&(v=_[m]);const W=H({id:"app",state:()=>({prevLang:v,lang:v,langIndex:m,langs:_,chatLoading:!1,chatMessages:[]}),actions:{toggleLang(){let s=this;this.langIndex++,this.langIndex=this.langIndex%this.langs.length,this.lang=this.langs[this.langIndex],setTimeout(function(){s.prevLang=s.lang},10)},setUserMessage(s){this.chatMessages.push({key:new Date().valueOf(),user:"Você",message:s})},setAssistantMessage(s){this.chatMessages.push({key:new Date().valueOf(),user:"Harvey Wood",message:s})},setChatStatus(s){console.log("setando status",s),this.chatLoading=s}}}),$=a("img",{src:"/img/logo-nsh.svg",class:"app-logo d-block w-100 mb-3"},null,-1),F=a("span",{lang:"pt",class:"text-center"},"Consultoria & Desenvolvimento",-1),K=a("span",{lang:"en",class:"text-center"},"Consultancy & Development ",-1),R=a("span",{lang:"es",class:"text-center"},"Consultoría & Desarrollo",-1),X=a("small",null,[a("p",null,[a("strong",null,"NISHINO LTDA"),a("br"),o(" 48.129.023/0001-27 ")]),a("p",null,[o(" Avenida Afluente, 1070"),a("br"),o(" Vila Fernanda"),a("br"),o(" Campo Grande / MS"),a("br"),o(" 79096-149 ")])],-1),q=a("strong",null,"NISHINO LTDA",-1),z=a("br",null,null,-1),E={data:()=>({drawer:window.innerWidth>600})},P=Object.assign(E,{__name:"GuestLayout",props:{canLogin:Boolean,canRegister:Boolean,title:String},setup(s){const r=W(),w=g(function(){return r.lang}),C=function(){r.toggleLang()},I=g(function(){return{pt:"Saiba Mais",en:"About me",es:"Acerca"}[r.lang]}),x=g(function(){return{pt:"Contato",en:"Call me",es:"Cuenta conmigo"}[r.lang]});return(l,c)=>{const d=e("v-list-item"),u=e("v-divider"),S=e("v-list"),k=e("v-card"),f=e("v-container"),A=e("v-navigation-drawer"),D=e("v-app-bar-nav-icon"),y=e("v-app-bar-title"),V=e("v-spacer"),M=e("v-icon"),N=e("v-btn"),B=e("v-app-bar"),O=e("v-main"),T=e("v-app");return j(),G(T,{lang:i(r).lang},{default:t(()=>[n(A,{color:"surf",modelValue:l.drawer,"onUpdate:modelValue":c[0]||(c[0]=h=>l.drawer=h)},{default:t(()=>[n(f,{class:"pa-5 d-flex flex-column"},{default:t(()=>[n(i(p),{id:"menuLogo",href:"/",class:"d-block w-75 my-6 mx-auto"},{default:t(()=>[$,F,K,R]),_:1}),n(k,{class:"w-100 mb-6"},{default:t(()=>[n(S,{lines:"one"},{default:t(()=>[n(i(p),{href:"/about"},{default:t(()=>[n(d,{"prepend-icon":"mdi-information",title:I.value,ripple:!0,link:""},null,8,["title"])]),_:1}),n(u),n(i(p),{href:"/blog"},{default:t(()=>[n(d,{"prepend-icon":"mdi-post",title:"Blog",ripple:!0})]),_:1}),n(u),n(i(p),{href:"/harvey"},{default:t(()=>[n(d,{"prepend-icon":"mdi-message",title:x.value,ripple:!0},null,8,["title"])]),_:1})]),_:1})]),_:1}),n(u,{class:"mb-5"}),X]),_:1})]),_:1},8,["modelValue"]),n(B,{class:"bg-nishino"},{default:t(()=>[n(D,{onClick:c[1]||(c[1]=h=>l.drawer=!l.drawer)}),n(y,null,{default:t(()=>[o(b(s.title),1)]),_:1}),n(V),n(N,{variant:"outlined",onClick:C},{default:t(()=>[n(M,{icon:"mdi-translate",class:"mr-3"}),o(" "+b(w.value),1)]),_:1})]),_:1}),n(O,{class:"bg-forest"},{default:t(()=>[U(l.$slots,"default"),n(f,{class:"bg-footer"},{default:t(()=>[q,z,o(" 48.129.023/0001-27 ")]),_:1})]),_:3})]),_:3},8,["lang"])}}});export{P as _,W as u};